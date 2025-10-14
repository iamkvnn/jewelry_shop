import { Client } from "@stomp/stompjs";
import SockJS from "sockjs-client";

let stompClient = null;

export const connectWebSocket = (conversationId, onMessageReceived) => {
  const socket = new SockJS("http://localhost:8080/ws"); // endpoint WebSocket
  stompClient = new Client({
    webSocketFactory: () => socket,
    debug: (str) => console.log(str),
    onConnect: () => {
      console.log("Connected to WebSocket");

      // subscribe topic conversation
      stompClient.subscribe(`/topic/conversation/${conversationId}`, (msg) => {
        let message;
        try {
          message = typeof msg.body === "string" ? JSON.parse(msg.body) : msg.body;
        } catch (e) {
          console.warn("Could not parse message as JSON:", msg.body);
          message = msg.body;
        }
        onMessageReceived(message);
      });
    },
  });
  stompClient.activate();
};

export const sendMessage = (conversationId, senderId, content) => {
  if (!stompClient) return;
  const senderRole = "CUSTOMER";
  const msg = {
    conversationId,
    senderId,
    senderRole,
    content,
  };
  stompClient.publish({
    destination: "/app/chat.sendMessage",
    body: JSON.stringify(msg),
  });
};
