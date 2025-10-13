package com.web.jewelry.dto.request;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class AcceptConversationRequest {

    @NotNull(message = "Conversation ID không được để trống")
    private Long conversationId;

    @NotNull(message = "Staff ID không được để trống")
    private Long staffId;
}