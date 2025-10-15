package com.web.jewelry.service.conversation;

import com.web.jewelry.dto.response.ConversationDetailResponse;
import com.web.jewelry.model.Conversation;
import java.util.List;

public interface IConversationService {
    Conversation createRequest(Long customerId);
    List<Conversation> getPending();
    Conversation accept(Long id, Long staffId);
    Conversation close(Long id);
    Conversation acceptByEmail(Long conversationId, String staffEmail);
    Conversation closeByEmail(Long conversationId, String staffEmail);
    List<Conversation> findPendingOlderThanMinutes(long minutes);
    List<Conversation> getByStaffId(Long staffId);
    List<Conversation> getByStaffEmail(String staffEmail);
    List<Conversation> getActiveByStaffId(Long staffId);
    ConversationDetailResponse getConversationDetail(Long conversationId);
    boolean isConversationBelongToStaff(Long conversationId, Long staffId);
    boolean isConversationBelongToStaffEmail(Long conversationId, String staffEmail);
    Conversation getById(Long id);
    List<Conversation> getAllConversations();
}
