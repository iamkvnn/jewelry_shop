package com.web.jewelry.dto.request;

import com.web.jewelry.enums.EUserRole;
import lombok.Data;

/**
 * Message request - hỗ trợ cả senderId dạng Long và String
 */
@Data
public class MessageRequest {
    private Long conversationId;

    /**
     * Có thể là Long (customerId) hoặc String (staffEmail)
     * Backend sẽ xử lý convert tương ứng
     */
    private Object senderId;  // ✅ Changed from Long to Object

    private EUserRole senderRole;
    private String content;

    /**
     * Helper method để lấy senderId dạng Long
     * @return Long nếu senderId là Long, null nếu là String
     */
    public Long getSenderIdAsLong() {
        if (senderId instanceof Long) {
            return (Long) senderId;
        } else if (senderId instanceof Integer) {
            return ((Integer) senderId).longValue();
        }
        return null;
    }

    /**
     * Helper method để lấy senderId dạng String
     * @return String representation của senderId
     */
    public String getSenderIdAsString() {
        return senderId != null ? senderId.toString() : null;
    }
}