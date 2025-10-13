package com.web.jewelry.controller;

import com.web.jewelry.dto.request.ConversationRequest;
import com.web.jewelry.dto.request.MessageRequest;
import com.web.jewelry.dto.response.ConversationResponse;
import com.web.jewelry.dto.response.MessageResponse;
import com.web.jewelry.dto.response.WebSocketResponse;
import com.web.jewelry.model.Conversation;
import com.web.jewelry.model.Message;
import com.web.jewelry.model.Staff;
import com.web.jewelry.repository.StaffRepository;
import com.web.jewelry.service.conversation.IConversationService;
import com.web.jewelry.service.message.IMessageService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/chat")
@RequiredArgsConstructor
public class ChatController {

    private final IConversationService conversationService;
    private final IMessageService messageService;
    private final SimpMessagingTemplate messagingTemplate;
    private final ModelMapper modelMapper;
    private final StaffRepository staffRepository;

    @PostMapping("/request")
    public ResponseEntity<ConversationResponse> createConversation(@RequestBody ConversationRequest request) {
        Conversation conversation = conversationService.createRequest(request.getCustomerId());
        ConversationResponse response = toConversationResponse(conversation);

        WebSocketResponse wsResponse = WebSocketResponse.builder()
                .type("NEW_REQUEST")
                .data(response)
                .conversationId(conversation.getId())
                .build();

        messagingTemplate.convertAndSend("/topic/staff/pending", wsResponse);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/accept")
    public ResponseEntity<ConversationResponse> acceptConversation(
            @PathVariable Long id,
            @RequestParam Long staffId) {

        Conversation conversation = conversationService.accept(id, staffId);
        ConversationResponse response = toConversationResponse(conversation);

        WebSocketResponse customerNotification = WebSocketResponse.builder()
                .type("STATUS")
                .status("ACCEPTED")
                .staffId(staffId)
                .conversationId(id)
                .build();

        messagingTemplate.convertAndSend("/topic/conversation/" + id, customerNotification);

        return ResponseEntity.ok(response);
    }

    @PostMapping("/{id}/close")
    public ResponseEntity<ConversationResponse> closeConversation(@PathVariable Long id) {
        Conversation conversation = conversationService.close(id);
        ConversationResponse response = toConversationResponse(conversation);

        WebSocketResponse closeNotification = WebSocketResponse.builder()
                .type("STATUS")
                .status("CLOSED")
                .message("Cuộc trò chuyện đã kết thúc")
                .conversationId(id)
                .build();

        messagingTemplate.convertAndSend("/topic/conversation/" + id, closeNotification);

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{id}/messages")
    public ResponseEntity<List<MessageResponse>> getMessages(@PathVariable Long id) {
        List<MessageResponse> messages = messageService.getMessages(id)
                .stream()
                .map(this::toMessageResponse)
                .toList();

        return ResponseEntity.ok(messages);
    }

    /**
     * 🔥 CRITICAL: WebSocket handler cho việc gửi message
     */
    @MessageMapping("/chat.sendMessage")
    public void handleMessage(MessageRequest request) {
        System.out.println("╔══════════════════════════════════════╗");
        System.out.println("║  📨 MESSAGE RECEIVED ON BACKEND      ║");
        System.out.println("╚══════════════════════════════════════╝");
        System.out.println("📋 Request Details:");
        System.out.println("   - ConversationId: " + request.getConversationId());
        System.out.println("   - SenderId (raw): " + request.getSenderId());
        System.out.println("   - SenderId type: " + (request.getSenderId() != null ? request.getSenderId().getClass().getName() : "null"));
        System.out.println("   - SenderRole: " + request.getSenderRole());
        System.out.println("   - Content: " + request.getContent());

        try {
            // Tạo message entity
            Message message = new Message();
            message.setConversationId(request.getConversationId());
            message.setSenderRole(request.getSenderRole());
            message.setContent(request.getContent());

            // Resolve senderId
            Long actualSenderId = resolveSenderId(request);
            System.out.println("   - ✅ Resolved SenderId: " + actualSenderId);
            message.setSenderId(actualSenderId);

            // Lưu message vào DB
            Message saved = messageService.saveMessage(message);
            System.out.println("   - ✅ Message saved to DB with ID: " + saved.getId());

            // Convert to response
            MessageResponse messageResponse = toMessageResponse(saved);
            System.out.println("   - ✅ MessageResponse created: " + messageResponse);

            // Wrap trong WebSocketResponse
            WebSocketResponse wsResponse = WebSocketResponse.builder()
                    .type("MESSAGE")
                    .data(messageResponse)
                    .conversationId(request.getConversationId())
                    .senderRole(request.getSenderRole().toString())
                    .build();

            System.out.println("   - ✅ WebSocketResponse built:");
            System.out.println("      type: " + wsResponse.getType());
            System.out.println("      conversationId: " + wsResponse.getConversationId());
            System.out.println("      data: " + wsResponse.getData());

            // Broadcast message
            String destination = "/topic/conversation/" + request.getConversationId();
            System.out.println("   - 📤 Broadcasting to: " + destination);

            messagingTemplate.convertAndSend(destination, wsResponse);

            System.out.println("   - ✅ Message broadcasted successfully!");
            System.out.println("══════════════════════════════════════\n");

        } catch (Exception e) {
            System.err.println("❌ ERROR in handleMessage:");
            e.printStackTrace();
            throw e;
        }
    }

    /**
     * Resolve senderId từ Object sang Long
     */
    private Long resolveSenderId(MessageRequest request) {
        Object senderId = request.getSenderId();

        System.out.println("🔍 Resolving senderId...");
        System.out.println("   - Input type: " + senderId.getClass().getName());
        System.out.println("   - Input value: " + senderId);

        // Nếu đã là Long
        if (senderId instanceof Long) {
            System.out.println("   - ✅ Already Long");
            return (Long) senderId;
        }
        // Nếu là Integer
        else if (senderId instanceof Integer) {
            System.out.println("   - ✅ Converting from Integer to Long");
            return ((Integer) senderId).longValue();
        }
        // Nếu là String
        else if (senderId instanceof String) {
            String str = (String) senderId;
            System.out.println("   - Input is String: " + str);

            // Thử parse thành Long trước (nếu là số dạng string)
            try {
                Long id = Long.parseLong(str);
                System.out.println("   - ✅ Parsed string to Long: " + id);
                return id;
            } catch (NumberFormatException e) {
                // Nếu không phải số -> đây là email
                System.out.println("   - String is email, looking up staff...");
                Staff staff = staffRepository.findByEmail(str)
                        .orElseThrow(() -> new RuntimeException("Staff not found with email: " + str));
                System.out.println("   - ✅ Found staff with ID: " + staff.getId());
                return staff.getId();
            }
        }

        throw new IllegalArgumentException("Invalid senderId type: " + senderId.getClass().getName());
    }

    private ConversationResponse toConversationResponse(Conversation conversation) {
        return modelMapper.map(conversation, ConversationResponse.class);
    }

    private MessageResponse toMessageResponse(Message message) {
        return modelMapper.map(message, MessageResponse.class);
    }
}