package com.web.jewelry.service.message;

import com.web.jewelry.model.Message;
import com.web.jewelry.repository.MessageRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MessageService implements IMessageService {
    private final MessageRepository messageRepository;

    @Override
    public Message saveMessage(Message m) {
        m.setSentAt(LocalDateTime.now());
        return messageRepository.save(m);
    }

    @Override
    public List<Message> getMessages(Long conversationId) {
        return messageRepository.findByConversationIdOrderBySentAtAsc(conversationId);
    }
}
