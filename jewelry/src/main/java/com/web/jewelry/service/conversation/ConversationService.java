package com.web.jewelry.service.conversation;

import com.web.jewelry.dto.response.ConversationDetailResponse;
import com.web.jewelry.dto.response.MessageResponse;
import com.web.jewelry.enums.EConversationStatus;
import com.web.jewelry.model.Conversation;
import com.web.jewelry.model.Message;
import com.web.jewelry.model.Staff;
import com.web.jewelry.repository.ConversationRepository;
import com.web.jewelry.repository.MessageRepository;
import com.web.jewelry.repository.CustomerRepository;
import com.web.jewelry.repository.StaffRepository;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class ConversationService implements IConversationService {

    private final ConversationRepository convRepo;
    private final MessageRepository messageRepository;
    private final CustomerRepository customerRepository;
    private final StaffRepository staffRepository;
    private final ModelMapper modelMapper;

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
    @Transactional
    public Conversation acceptByEmail(Long conversationId, String staffEmail) {
        Staff staff = staffRepository.findByEmail(staffEmail)
                .orElseThrow(() -> new RuntimeException("Staff not found with email: " + staffEmail));
        return accept(conversationId, staff.getId());
    }

    @Override
    @Transactional
    public Conversation closeByEmail(Long conversationId, String staffEmail) {
        Staff staff = staffRepository.findByEmail(staffEmail)
                .orElseThrow(() -> new RuntimeException("Staff not found with email: " + staffEmail));

        Conversation conversation = convRepo.findById(conversationId)
                .orElseThrow(() -> new RuntimeException("Conversation không tồn tại"));

        // Verify staff owns this conversation
        if (!staff.getId().equals(conversation.getStaffId())) {
            throw new IllegalStateException("Staff không có quyền đóng conversation này");
        }

        return close(conversationId);
    }

    @Override
    @Transactional
    public Conversation accept(Long id, Long staffId) {
        Conversation c = convRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Conversation không tồn tại"));

        if (c.getStatus() != EConversationStatus.PENDING) {
            throw new IllegalStateException("Conversation không ở trạng thái PENDING");
        }

        c.setStaffId(staffId);
        c.setStatus(EConversationStatus.ACCEPTED);
        c.setUpdatedAt(LocalDateTime.now());
        return convRepo.save(c);
    }

    @Override
    @Transactional
    public Conversation close(Long id) {
        Conversation c = convRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Conversation không tồn tại"));

        c.setStatus(EConversationStatus.CLOSED);
        c.setUpdatedAt(LocalDateTime.now());
        return convRepo.save(c);
    }

    @Override
    public List<Conversation> findPendingOlderThanMinutes(long minutes) {
        List<Conversation> pending = convRepo.findByStatus(EConversationStatus.PENDING);
        LocalDateTime cutoff = LocalDateTime.now().minusMinutes(minutes);
        return pending.stream()
                .filter(c -> c.getCreatedAt().isBefore(cutoff))
                .toList();
    }

    @Override
    public List<Conversation> getByStaffId(Long staffId) {
        return convRepo.findByStaffId(staffId);
    }

    @Override
    public List<Conversation> getByStaffEmail(String staffEmail) {
        Staff staff = staffRepository.findByEmail(staffEmail)
                .orElseThrow(() -> new RuntimeException("Staff not found with email: " + staffEmail));
        return convRepo.findByStaffId(staff.getId());
    }

    @Override
    public List<Conversation> getActiveByStaffId(Long staffId) {
        return convRepo.findByStaffIdAndStatus(staffId, EConversationStatus.ACCEPTED);
    }

    @Override
    public ConversationDetailResponse getConversationDetail(Long conversationId) {
        Conversation conversation = convRepo.findById(conversationId)
                .orElseThrow(() -> new RuntimeException("Conversation không tồn tại"));

        List<Message> messages = messageRepository.findByConversationIdOrderBySentAtAsc(conversationId);

        ConversationDetailResponse response = ConversationDetailResponse.builder()
                .id(conversation.getId())
                .customerId(conversation.getCustomerId())
                .staffId(conversation.getStaffId())
                .status(conversation.getStatus())
                .createdAt(conversation.getCreatedAt())
                .updatedAt(conversation.getUpdatedAt())
                .messageCount(messages.size())
                .messages(messages.stream()
                        .map(msg -> modelMapper.map(msg, MessageResponse.class))
                        .collect(Collectors.toList()))
                .build();

        return response;
    }

    @Override
    public boolean isConversationBelongToStaff(Long conversationId, Long staffId) {
        return convRepo.findById(conversationId)
                .map(conv -> staffId.equals(conv.getStaffId()))
                .orElse(false);
    }

    @Override
    public boolean isConversationBelongToStaffEmail(Long conversationId, String staffEmail) {
        Staff staff = staffRepository.findByEmail(staffEmail)
                .orElseThrow(() -> new RuntimeException("Staff not found with email: " + staffEmail));
        return isConversationBelongToStaff(conversationId, staff.getId());
    }

    @Override
    public Conversation getById(Long id) {
        return convRepo.findById(id)
                .orElseThrow(() -> new RuntimeException("Conversation không tồn tại"));
    }

    @Override
    public List<Conversation> getAllConversations() {
        return convRepo.findAll();
    }
}