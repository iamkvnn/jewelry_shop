package com.web.jewelry.service.notification;

import com.web.jewelry.dto.response.ConversationResponse;
import com.web.jewelry.dto.response.MessageResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class WebSocketNotificationService {

    private final SimpMessagingTemplate messagingTemplate;

    /**
     * Gửi thông báo về conversation mới cho tất cả staff
     */
    public void notifyNewConversation(ConversationResponse conversation) {
        messagingTemplate.convertAndSend("/topic/staff/pending", conversation);
    }

    /**
     * Gửi thông báo conversation đã được chấp nhận
     */
    public void notifyConversationAccepted(Long conversationId, Long staffId) {
        messagingTemplate.convertAndSend(
                "/topic/conversation/" + conversationId,
                Map.of(
                        "type", "ACCEPTED",
                        "staffId", staffId,
                        "message", "Nhân viên đã chấp nhận yêu cầu chat"
                )
        );
    }

    /**
     * Gửi thông báo conversation đã bị đóng
     */
    public void notifyConversationClosed(Long conversationId, String reason) {
        messagingTemplate.convertAndSend(
                "/topic/conversation/" + conversationId,
                Map.of(
                        "type", "CLOSED",
                        "message", reason != null ? reason : "Cuộc trò chuyện đã kết thúc"
                )
        );
    }

    /**
     * Gửi tin nhắn mới trong conversation
     */
    public void sendMessage(Long conversationId, MessageResponse message) {
        messagingTemplate.convertAndSend(
                "/topic/conversation/" + conversationId,
                Map.of("type", "MESSAGE", "data", message)
        );
    }

    /**
     * Thông báo staff đang typing
     */
    public void notifyTyping(Long conversationId, String userName, boolean isTyping) {
        messagingTemplate.convertAndSend(
                "/topic/conversation/" + conversationId + "/typing",
                Map.of(
                        "userName", userName,
                        "isTyping", isTyping
                )
        );
    }

    /**
     * Thông báo conversation đã bị xóa khỏi danh sách pending
     */
    public void notifyConversationRemovedFromPending(Long conversationId) {
        messagingTemplate.convertAndSend(
                "/topic/staff/pending/removed",
                Map.of("conversationId", conversationId)
        );
    }
}