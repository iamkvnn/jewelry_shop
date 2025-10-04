package com.web.jewelry.service.conversation;

import com.web.jewelry.enums.EConversationStatus;
import com.web.jewelry.model.Conversation;
import com.web.jewelry.repository.ConversationRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class ConversationService implements IConversationService {
    private final ConversationRepository convRepo;

    @Override
    public Conversation createRequest(Long customerId) {
        Conversation c = Conversation.builder()
                .customerId(customerId)
                .staffId(null)
                .status(EConversationStatus.PENDING)
                .createdAt(LocalDateTime.now())
                .updatedAt(LocalDateTime.now())
                .build();
        return convRepo.save(c);
    }

    @Override
    public List<Conversation> getPending() {
        return convRepo.findByStatus(EConversationStatus.PENDING);
    }

    @Override
    public Conversation accept(Long id, Long staffId) {
        Conversation c = convRepo.findById(id).orElseThrow();
        if (c.getStatus() != EConversationStatus.PENDING)
            throw new IllegalStateException("Conversation not pending");
        c.setStaffId(staffId);
        c.setStatus(EConversationStatus.ACCEPTED);
        c.setUpdatedAt(LocalDateTime.now());
        return convRepo.save(c);
    }

    @Override
    public Conversation close(Long id) {
        Conversation c = convRepo.findById(id).orElseThrow();
        c.setStatus(EConversationStatus.CLOSED);
        c.setUpdatedAt(LocalDateTime.now());
        return convRepo.save(c);
    }

    @Override
    public List<Conversation> findPendingOlderThanMinutes(long minutes) {
        List<Conversation> pending = convRepo.findByStatus(EConversationStatus.PENDING);
        LocalDateTime cutoff = LocalDateTime.now().minusMinutes(minutes);
        return pending.stream().filter(c -> c.getCreatedAt().isBefore(cutoff)).toList();
    }
}
