package com.web.jewelry.dto.response;

import com.web.jewelry.enums.EConversationStatus;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ConversationDetailResponse {

    private Long id;
    private Long customerId;
    private String customerName;
    private String customerEmail;
    private Long staffId;
    private String staffName;
    private EConversationStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

    private List<MessageResponse> messages;
    private Integer messageCount;
}