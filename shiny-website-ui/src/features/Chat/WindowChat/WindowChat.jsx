import { faHeadset, faMinimize, faPaperPlane, faSpinner, faTimes } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import PropTypes from "prop-types";
import { useEffect, useState } from "react";
import { useSelector } from "react-redux";
import chatApi from "../../../api/chatApi";
import { connectWebSocket, sendMessage } from "../../../services/socketService";
import styles from "./WindowChat.module.css";

function WindowChat({ isOpen, onClose }) {
  const [message, setMessage] = useState("");
  const [isConnecting, setIsConnecting] = useState(true);
  const [messages, setMessages] = useState([]);
  const [conversationId, setConversationId] = useState(null);
  const [connectionStatus, setConnectionStatus] = useState("requesting"); // requesting, waiting, connected, error
  const [error, setError] = useState(null);
  const userId = useSelector((state) => state.user.current.id);

  // Tạo conversation khi mở chat
  useEffect(() => {
    if (isOpen && isConnecting && userId && connectionStatus === "requesting") {
      console.log("Creating conversation for user:", userId);
      setError(null);

      chatApi
        .createConversation(userId)
        .then((response) => {
          console.log("Conversation created:", response);
          setConnectionStatus("waiting");
          setConversationId(response.id);
        })
        .catch((error) => {
          console.error("Error creating conversation:", error);
          setError("Không thể kết nối. Vui lòng thử lại sau.");
          setConnectionStatus("error");
          setIsConnecting(false);
        });
    }
  }, [isOpen, isConnecting, userId, connectionStatus]);

  useEffect(() => {
    if (conversationId) {
      connectWebSocket(conversationId, (message) => {
        // Nếu là trạng thái
        if (message.type === "STATUS") {
          if (message.status === "ACCEPTED") {
            setConnectionStatus("connected");
            setIsConnecting(false);

            // Thêm tin nhắn chào mừng khi kết nối thành công
            const welcomeMessage = {
              id: Date.now(),
              text: "Đã kết nối với nhân viên hỗ trợ. Bạn có câu hỏi gì không?",
              sender: "support",
              timestamp: new Date().toLocaleTimeString(),
            };
            setMessages((prev) => [...prev, welcomeMessage]);
          } else if (message.status === "CLOSED") {
            setConnectionStatus("error");
            setIsConnecting(false);
          }
        }
        // Nếu là tin nhắn chat
        else if (message.type === "MESSAGE") {
          setMessages((prev) => [
            ...prev,
            {
              id: message.id,
              text: message.content,
              sender: message.senderId === userId ? "user" : "support",
              timestamp: new Date(message.createdAt).toLocaleTimeString(),
            },
          ]);
        }
      });
    }
  }, [conversationId, userId]);

  // Reset trạng thái khi đóng chat
  useEffect(() => {
    if (!isOpen) {
      setIsConnecting(true);
      setMessages([]);
      setMessage("");
      setConversationId(null);
      setConnectionStatus("requesting");
      setError(null);
    }
  }, [isOpen]);

  const handleSendMessage = async () => {
    if (message.trim() && conversationId) {
      const newMessage = {
        id: messages.length + 1,
        text: message,
        sender: "user",
        timestamp: new Date().toLocaleTimeString(),
      };

      // Hiển thị tin nhắn ngay lập tức cho UX tốt hơn
      setMessages([...messages, newMessage]);
      setMessage("");

      try {
        // TODO: Gọi API gửi tin nhắn khi có endpoint
        await sendMessage(conversationId, userId, message);
        // Trong thực tế, tin nhắn phản hồi sẽ đến qua WebSocket hoặc polling
        // Tạm thời giữ simulation để test UI
      } catch (error) {
        console.error("Error sending message:", error);
      }
    }
  };

  const handleKeyPress = (e) => {
    if (e.key === "Enter") {
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
          messages.map((msg) => (
            <div
              key={msg.id}
              className={`${styles.message} ${msg.sender === "user" ? styles.userMessage : styles.supportMessage}`}
            >
              <div className={styles.messageContent}>
                <p>{msg.text}</p>
                <span className={styles.timestamp}>{msg.timestamp}</span>
              </div>
            </div>
          ))
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
