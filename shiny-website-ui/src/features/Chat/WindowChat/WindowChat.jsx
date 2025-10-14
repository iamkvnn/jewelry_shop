import { faHeadset, faMinimize, faPaperPlane, faSpinner, faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import PropTypes from "prop-types";
import { useEffect, useState, useRef } from "react";
import { useSelector } from "react-redux";
import chatApi from "../../../api/chatApi";
import { connectWebSocket, disconnectWebSocket, sendMessage } from "../../../services/socketService";
import styles from "./WindowChat.module.css";

function WindowChat({ isOpen, onClose }) {
  const [message, setMessage] = useState("");
  const [isConnecting, setIsConnecting] = useState(true);
  const [messages, setMessages] = useState([]);
  const [conversationId, setConversationId] = useState(null);
  const [connectionStatus, setConnectionStatus] = useState("requesting");
  const [error, setError] = useState(null);
  const userId = useSelector((state) => state.user.current.id);
  const messagesEndRef = useRef(null);

  // Auto scroll to bottom khi có message mới
  const scrollToBottom = () => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  };

  useEffect(() => {
    scrollToBottom();
  }, [messages]);

  // Tạo conversation khi mở chat
  useEffect(() => {
    if (isOpen && isConnecting && userId && connectionStatus === "requesting") {
      setError(null);

      chatApi
        .createConversation(userId)
        .then((response) => {
          setConnectionStatus("waiting");
          setConversationId(response.id);
        })
        .catch((error) => {
          setError("Không thể kết nối. Vui lòng thử lại sau.");
          setConnectionStatus("error");
          setIsConnecting(false);
        });
    }
  }, [isOpen, isConnecting, userId, connectionStatus]);

  useEffect(() => {
    if (conversationId) {
      connectWebSocket(conversationId, (message) => {

        switch (message.type) {
          case "STATUS":
            if (message.status === "ACCEPTED") {
              setConnectionStatus("connected");
              setIsConnecting(false);
              setMessages((prev) => [
                ...prev,
                {
                  id: Date.now(),
                  text: message.message || "Nhân viên đã chấp nhận yêu cầu hỗ trợ!",
                  sender: "support",
                  timestamp: new Date().toLocaleTimeString(),
                },
              ]);
            } else if (message.status === "CLOSED") {
              setConnectionStatus("error");
              setIsConnecting(false);
              setError(message.message || "Cuộc hội thoại đã kết thúc.");
            }
            break;

          case "MESSAGE":
            const messageData = message.data;
            if (messageData) {
              // ⚠️ Bỏ qua nếu sender là chính user hiện tại (tránh bị render 2 lần)
              if (messageData.senderRole === "CUSTOMER" && messageData.senderId === userId) {
                return;
              }

              setMessages((prev) => [
                ...prev,
                {
                  id: messageData.id || Date.now(),
                  text: messageData.content,
                  sender: messageData.senderRole === "CUSTOMER" ? "user" : "support",
                  timestamp: new Date(messageData.sentAt).toLocaleTimeString(),
                },
              ]);
            }
            break;

          default:
        }
      });
    }

    // ✅ Cleanup: disconnect WebSocket khi component unmount hoặc conversationId thay đổi
    return () => {
      if (conversationId) {
        disconnectWebSocket();
      }
    };
  }, [conversationId]);

  // ✅ Reset trạng thái và disconnect khi đóng chat
  useEffect(() => {
    if (!isOpen) {
      // Disconnect WebSocket trước
      if (conversationId) {
        disconnectWebSocket();
      }
      
      // Reset state
      setIsConnecting(true);
      setMessages([]);
      setMessage("");
      setConversationId(null);
      setConnectionStatus("requesting");
      setError(null);
    }
  }, [isOpen, conversationId]);

  const handleSendMessage = async () => {
    if (message.trim() && conversationId && connectionStatus === "connected") {
      const newMessage = {
        id: messages.length + 1,
        text: message,
        sender: "user",
        timestamp: new Date().toLocaleTimeString(),
      };

      // Hiển thị tin nhắn ngay lập tức cho UX tốt hơn
      setMessages([...messages, newMessage]);
      const messageText = message;
      setMessage("");

      try {
        // ✅ Gửi với userId (Long) - backend sẽ xử lý đúng
        await sendMessage(conversationId, userId, messageText);
      } catch (error) {
        // Có thể thêm logic retry hoặc hiển thị error cho user
      }
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter" && !e.shiftKey) {
      e.preventDefault();
      handleSendMessage();
    }
  };

  if (!isOpen) return null;

  return (
    <div className={styles.windowChat}>
      {/* Header */}
      <div className={styles.chatHeader}>
        <div className={styles.headerInfo}>
          <div className={styles.avatar}>
            <FontAwesomeIcon icon={faHeadset} />
          </div>
          <div className={styles.headerText}>
            <h3>Hỗ trợ khách hàng</h3>
            <span className={styles.status}>
              {connectionStatus === "requesting" && "Đang gửi yêu cầu..."}
              {connectionStatus === "waiting" && "Đang chờ nhân viên..."}
              {connectionStatus === "connected" && "Đang online"}
              {connectionStatus === "error" && "Lỗi kết nối"}
            </span>
          </div>
        </div>
        <div className={styles.headerActions}>
          <button className={styles.minimizeBtn} onClick={onClose}>
            <FontAwesomeIcon icon={faMinimize} />
          </button>
          <button className={styles.closeBtn} onClick={onClose}>
            <FontAwesomeIcon icon={faTimes} />
          </button>
        </div>
      </div>

      {/* Message Body */}
      <div className={styles.chatBody}>
        {connectionStatus === "error" ? (
          <div className={styles.errorContainer}>
            <div className={styles.errorIcon}>⚠️</div>
            <p className={styles.errorText}>{error}</p>
            <button
              className={styles.retryBtn}
              onClick={() => {
                setConnectionStatus("requesting");
                setIsConnecting(true);
                setError(null);
              }}
            >
              Thử lại
            </button>
          </div>
        ) : isConnecting ? (
          <div className={styles.loadingContainer}>
            <div className={styles.loadingSpinner}>
              <FontAwesomeIcon icon={faSpinner} spin />
            </div>
            <p className={styles.loadingText}>
              {connectionStatus === "requesting" && "Đang gửi yêu cầu kết nối..."}
              {connectionStatus === "waiting" && "Đang chờ nhân viên chấp nhận..."}
            </p>
            <div className={styles.loadingDots}>
              <span></span>
              <span></span>
              <span></span>
            </div>
          </div>
        ) : (
          <>
            {messages.map((msg) => (
              <div
                key={msg.id}
                className={`${styles.message} ${msg.sender === "user" ? styles.userMessage : styles.supportMessage}`}
              >
                <div className={styles.messageContent}>
                  <p>{msg.text}</p>
                  <span className={styles.timestamp}>{msg.timestamp}</span>
                </div>
              </div>
            ))}
            <div ref={messagesEndRef} />
          </>
        )}
      </div>

      {/* Input Area */}
      <div className={styles.chatInput}>
        <input
          type="text"
          placeholder={
            connectionStatus === "connected"
              ? "Nhập tin nhắn..."
              : connectionStatus === "error"
              ? "Lỗi kết nối"
              : "Đang kết nối..."
          }
          value={message}
          onChange={(e) => setMessage(e.target.value)}
          onKeyPress={handleKeyPress}
          className={styles.messageInput}
          disabled={connectionStatus !== "connected"}
        />
        <button
          onClick={handleSendMessage}
          className={styles.sendBtn}
          disabled={!message.trim() || connectionStatus !== "connected"}
        >
          {connectionStatus !== "connected" ? (
            <FontAwesomeIcon icon={faSpinner} spin />
          ) : (
            <FontAwesomeIcon icon={faPaperPlane} />
          )}
        </button>
      </div>
    </div>
  );
}

WindowChat.propTypes = {
  isOpen: PropTypes.bool.isRequired,
  onClose: PropTypes.func.isRequired,
};

export default WindowChat;