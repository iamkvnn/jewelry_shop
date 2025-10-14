package com.web.jewelry.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Standardized WebSocket message response
 * Đảm bảo tất cả WebSocket messages có cùng structure
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class WebSocketResponse {

    /**
     * Loại message: MESSAGE, STATUS, STATUS_CHANGE, ACCEPTED, CLOSED, etc.
     */
    private String type;

    /**
     * Status của conversation: PENDING, ACCEPTED, CLOSED
     */
    private String status;

    /**
     * Message mô tả (nếu có)
     */
    private String message;

    /**
     * Data payload (MessageResponse, ConversationResponse, etc.)
     */
    private Object data;

    /**
     * ID của conversation liên quan
     */
    private Long conversationId;

    /**
     * ID của staff (nếu có)
     */
    private Long staffId;

    /**
     * Email của staff (nếu có)
     */
    private String staffEmail;

    /**
     * Tên người dùng (cho typing indicator)
     */
    private String userName;

    /**
     * Trạng thái typing
     */
    private Boolean isTyping;

    /**
     * Sender role (CUSTOMER hoặc STAFF)
     */
    private String senderRole;
}