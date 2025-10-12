package com.web.jewelry.model;

import com.web.jewelry.enums.EUserRole;
import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "messages")
@Getter @Setter @NoArgsConstructor @AllArgsConstructor @Builder
public class Message {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Long conversationId;
    private Long senderId;

    @Enumerated(EnumType.STRING)
    private EUserRole senderRole;

    private String content;

    private LocalDateTime sentAt;
}
