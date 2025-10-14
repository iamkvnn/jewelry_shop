package com.web.jewelry.repository;

import com.web.jewelry.enums.EConversationStatus;
import com.web.jewelry.model.Conversation;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface ConversationRepository extends JpaRepository<Conversation, Long> {

    List<Conversation> findByStatus(EConversationStatus status);

    List<Conversation> findByStaffId(Long staffId);

    List<Conversation> findByStaffIdAndStatus(Long staffId, EConversationStatus status);

    List<Conversation> findByCustomerId(Long customerId);

    Optional<Conversation> findByCustomerIdAndStatus(Long customerId, EConversationStatus status);

    @Query("SELECT c FROM Conversation c WHERE c.staffId = :staffId " +
            "AND c.status IN (com.web.jewelry.enums.EConversationStatus.PENDING, " +
            "com.web.jewelry.enums.EConversationStatus.ACCEPTED) ORDER BY c.updatedAt DESC")
    List<Conversation> findActiveConversationsByStaffId(@Param("staffId") Long staffId);

    @Query("SELECT COUNT(c) FROM Conversation c WHERE c.staffId = :staffId " +
            "AND c.status = com.web.jewelry.enums.EConversationStatus.ACCEPTED")
    Integer countActiveConversationsByStaffId(@Param("staffId") Long staffId);
}