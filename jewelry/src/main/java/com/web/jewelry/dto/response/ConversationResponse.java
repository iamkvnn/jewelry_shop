package com.web.jewelry.dto.response;
import com.web.jewelry.enums.EConversationStatus;
import lombok.*;

import java.time.LocalDateTime;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ConversationResponse {
    private Long id;
    private Long customerId;
    private Long staffId;
    private EConversationStatus status;
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
}
