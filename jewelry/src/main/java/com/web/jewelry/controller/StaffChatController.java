package com.web.jewelry.controller;

import com.web.jewelry.dto.response.ConversationResponse;
import com.web.jewelry.dto.response.ConversationDetailResponse;
import com.web.jewelry.dto.response.WebSocketResponse;
import com.web.jewelry.model.Conversation;
import com.web.jewelry.service.conversation.IConversationService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@RestController
@RequestMapping("${api.prefix}/staff/chat")
@RequiredArgsConstructor
public class StaffChatController {

    private final IConversationService conversationService;
    private final SimpMessagingTemplate messagingTemplate;
    private final ModelMapper modelMapper;

    /**
     * Lấy danh sách tất cả conversation đang pending
     */
    @GetMapping("/pending")
    public ResponseEntity<List<ConversationResponse>> getPendingConversations() {
        List<Conversation> pending = conversationService.getPending();
        List<ConversationResponse> response = pending.stream()
                .map(conv -> modelMapper.map(conv, ConversationResponse.class))
                .collect(Collectors.toList());

        return ResponseEntity.ok(response);
    }

    /**
     * Nhân viên chấp nhận một conversation bằng EMAIL
     */
    @PostMapping("/{id}/accept")
    public ResponseEntity<ConversationResponse> acceptConversation(
            @PathVariable Long id,
            @RequestParam String staffEmail) {

        Conversation conversation = conversationService.acceptByEmail(id, staffEmail);
        ConversationResponse response = modelMapper.map(conversation, ConversationResponse.class);

        // Gửi thông báo cho customer
        WebSocketResponse customerNotification = WebSocketResponse.builder()
                .type("STATUS")
                .status("ACCEPTED")
                .staffId(conversation.getStaffId())
                .staffEmail(staffEmail)
                .conversationId(id)
                .message("Nhân viên đã chấp nhận yêu cầu hỗ trợ!")
                .build();

        messagingTemplate.convertAndSend("/topic/conversation/" + id, customerNotification);
        // Gửi thông báo cho staff khác
        messagingTemplate.convertAndSend("/topic/staff/pending/removed",
                WebSocketResponse.builder()
                        .type("REMOVED")
                        .conversationId(id)
                        .build());
        // Thông báo cập nhật danh sách pending
        messagingTemplate.convertAndSend("/topic/staff/pending",
                WebSocketResponse.builder()
                        .type("STATUS_CHANGE")
                        .build());

        return ResponseEntity.ok(response);
    }

    /**
     * Nhân viên đóng conversation bằng EMAIL
     */
    @PostMapping("/{conversationId}/close")
    public ResponseEntity<ConversationResponse> closeConversation(
            @PathVariable Long conversationId,
            @RequestParam String staffEmail) {
        Conversation conversation = conversationService.closeByEmail(conversationId, staffEmail);
        ConversationResponse response = modelMapper.map(conversation, ConversationResponse.class);

        WebSocketResponse closeNotification = WebSocketResponse.builder()
                .type("STATUS_CHANGE")
                .status("CLOSED")
                .message("Cuộc trò chuyện đã kết thúc")
                .conversationId(conversationId)
                .build();

        messagingTemplate.convertAndSend("/topic/conversation/" + conversationId, closeNotification);


        return ResponseEntity.ok(response);
    }

    @GetMapping("/my-conversations")
    public ResponseEntity<List<ConversationResponse>> getMyConversations(
            @RequestParam String staffEmail) {

        List<Conversation> conversations = conversationService.getByStaffEmail(staffEmail);
        List<ConversationResponse> response = conversations.stream()
                .map(conv -> modelMapper.map(conv, ConversationResponse.class))
                .collect(Collectors.toList());

        return ResponseEntity.ok(response);
    }

    @GetMapping("/{conversationId}/detail")
    public ResponseEntity<ConversationDetailResponse> getConversationDetail(
            @PathVariable Long conversationId) {
        ConversationDetailResponse detail = conversationService.getConversationDetail(conversationId);
        return ResponseEntity.ok(detail);
    }

    @GetMapping("/{conversationId}/verify")
    public ResponseEntity<Map<String, Boolean>> verifyStaffConversation(
            @PathVariable Long conversationId,
            @RequestParam String staffEmail) {
        boolean isValid = conversationService.isConversationBelongToStaffEmail(conversationId, staffEmail);
        return ResponseEntity.ok(Map.of("isValid", isValid));
    }
}
