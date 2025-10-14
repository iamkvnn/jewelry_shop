package com.web.jewelry.dto.request;
import com.web.jewelry.enums.EUserRole;
import lombok.Data;
@Data
public class MessageRequest {
    private Long conversationId;
    private Long senderId;
    private EUserRole senderRole;
    private String content;
}
