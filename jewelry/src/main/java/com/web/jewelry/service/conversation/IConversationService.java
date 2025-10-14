package com.web.jewelry.service.conversation;

import com.web.jewelry.model.Conversation;
import java.util.List;

public interface IConversationService {
    Conversation createRequest(Long customerId);
    List<Conversation> getPending();
    Conversation accept(Long id, Long staffId);
    Conversation close(Long id);
    List<Conversation> findPendingOlderThanMinutes(long minutes);
}
