package com.web.jewelry.repository;

import com.web.jewelry.enums.EConversationStatus;
import com.web.jewelry.model.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ConversationRepository extends JpaRepository<Conversation, Long> {
    List<Conversation> findByStatus(EConversationStatus status);
}
