import { Client } from "@stomp/stompjs";
import SockJS from "sockjs-client";

let stompClient = null;

/**
 * Kết nối WebSocket cho customer
 */
export const connectWebSocket = (conversationId, onMessageReceived) => {
  // Disconnect nếu đã có connection cũ
  if (stompClient && stompClient.active) {
    console.log("⚠️ Closing existing WebSocket connection");
    stompClient.deactivate();
  }

  const socket = new SockJS("http://localhost:8080/ws");

  stompClient = new Client({
    webSocketFactory: () => socket,
    reconnectDelay: 5000,
    heartbeatIncoming: 4000,
    heartbeatOutgoing: 4000,
    debug: (msg) => console.log("[STOMP]", msg),
    
    onConnect: () => {
      console.log("✅ Connected to WebSocket /ws");

      // Subscribe vào conversation topic
      stompClient.subscribe(`/topic/conversation/${conversationId}`, (msg) => {
        try {
          const parsed = JSON.parse(msg.body);
          console.log("📨 Received message:", parsed);
          onMessageReceived(parsed);
        } catch (error) {
          console.error("❌ Error parsing message:", error);
          onMessageReceived({ type: "RAW", data: msg.body });
        }
      });
    },
    
    onDisconnect: () => {
      console.log("🔌 Disconnected from WebSocket");
    },
    
    onStompError: (frame) => {
      console.error("❌ STOMP error:", frame);
    },
  });

  stompClient.activate();
};

/**
 * Disconnect WebSocket
 */
export const disconnectWebSocket = () => {
  if (stompClient && stompClient.active) {
    console.log("🔌 Disconnecting WebSocket");
    stompClient.deactivate();
    stompClient = null;
  }
};

/**
 * Gửi message qua WebSocket
 * @param {number} conversationId 
 * @param {number} senderId - Customer ID (Long)
 * @param {string} content 
 */
export const sendMessage = (conversationId, senderId, content) => {
  if (!stompClient || !stompClient.connected) {
    console.warn("⚠️ WebSocket not connected");
    return;
  }

  const msg = {
    conversationId,
    senderId,  // ✅ Gửi userId dạng Long (number)
    senderRole: "CUSTOMER",
    content,
  };

  console.log("📤 Sending message:", msg);

  stompClient.publish({
    destination: "/app/chat.sendMessage",
    body: JSON.stringify(msg),
  });
};

/**
 * Check if WebSocket is connected
 */
export const isConnected = () => {
  return stompClient && stompClient.connected;
};