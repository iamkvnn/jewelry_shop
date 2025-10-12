package com.web.jewelry.service.message;

import com.web.jewelry.model.Message;
import java.util.List;

public interface IMessageService {
    Message saveMessage(Message m);
    List<Message> getMessages(Long conversationId);
}
