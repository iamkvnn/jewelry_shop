package com.web.jewelry.model;

import com.web.jewelry.enums.EConversationStatus;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "conversations")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Conversation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long customerId;   // id của khách
    private Long staffId;      // id của nhân viên (null nếu chưa có ai nhận)

    @Enumerated(EnumType.STRING)
    private EConversationStatus status; // PENDING, ACCEPTED, CLOSED, TIMEOUT

    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;

}
