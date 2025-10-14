package com.web.jewelry.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class StaffInfoResponse {
    private Long id;
    private String fullName;
    private String email;
    private String phoneNumber;
    private Integer activeConversations;
}