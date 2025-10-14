package com.web.jewelry.controller;

import com.web.jewelry.dto.request.ConversationRequest;
import com.web.jewelry.dto.request.MessageRequest;
import com.web.jewelry.dto.response.ConversationResponse;
import com.web.jewelry.dto.response.MessageResponse;
import com.web.jewelry.model.Conversation;
import com.web.jewelry.model.Message;
import com.web.jewelry.service.conversation.IConversationService;
import com.web.jewelry.service.message.IMessageService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("${api.prefix}/chat")
@RequiredArgsConstructor
public class ChatController {

    private final IConversationService conversationService;
    private final IMessageService messageService;
    private final SimpMessagingTemplate messagingTemplate;
    private final ModelMapper modelMapper;

    // --- Conversation APIs ---
    @PostMapping("/request")
    public ResponseEntity<ConversationResponse> createConversation(@RequestBody ConversationRequest request) {
        Conversation conversation = conversationService.createRequest(request.getCustomerId());
        ConversationResponse response = toConversationResponse(conversation);

        // thông báo tới nhân viên có yêu cầu mới
        messagingTemplate.convertAndSend("/topic/pending", response);
        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/accept")
    public ResponseEntity<ConversationResponse> acceptConversation(
            @PathVariable Long id,
            @RequestParam Long staffId) {

        Conversation conversation = conversationService.accept(id, staffId);
        ConversationResponse response = toConversationResponse(conversation);

        // thông báo cho khách hàng conversation được accept
        messagingTemplate.convertAndSend("/topic/conversation/" + id,   Map.of("type", "STATUS", "status", "ACCEPTED"));
        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/close")
    public ResponseEntity<ConversationResponse> closeConversation(@PathVariable Long id) {
        Conversation conversation = conversationService.close(id);
        ConversationResponse response = toConversationResponse(conversation);

        // thông báo kết thúc chat
        messagingTemplate.convertAndSend("/topic/conversation/" + id, "CLOSED");
        return ResponseEntity.ok(response);
    }

    // --- Message APIs ---
    @GetMapping("/{id}/messages")
    public ResponseEntity<List<MessageResponse>> getMessages(@PathVariable Long id) {
        List<MessageResponse> messages = messageService.getMessages(id)
                .stream()
                .map(this::toMessageResponse)
                .toList();

        return ResponseEntity.ok(messages);
    }

    @MessageMapping("/chat.sendMessage")
    public void handleMessage(MessageRequest request) {
        Message message = new Message();
        message.setConversationId(request.getConversationId());
        message.setSenderId(request.getSenderId());
        message.setSenderRole(request.getSenderRole());
        message.setContent(request.getContent());
        Message saved = messageService.saveMessage(message);

        MessageResponse response = toMessageResponse(saved);

        // gửi tin nhắn đến cả 2 phía (staff và customer) trong conversation
        messagingTemplate.convertAndSend("/topic/conversation/" + request.getConversationId(), response);
    }

    // --- Mapping helpers ---
    private ConversationResponse toConversationResponse(Conversation conversation) {
        return modelMapper.map(conversation, ConversationResponse.class);
    }

    private MessageResponse toMessageResponse(Message message) {
        return modelMapper.map(message, MessageResponse.class);
    }
}
