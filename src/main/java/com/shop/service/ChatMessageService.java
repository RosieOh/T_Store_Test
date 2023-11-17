package com.shop.service;

import com.shop.entity.ChatMessage;
import com.shop.mapper.ChatMessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatMessageService {

    @Autowired
    private ChatMessageMapper chatMessageMapper;

    public List<ChatMessage> ChatMessageList(int rno) { return chatMessageMapper.ChatMessageList(rno);}
    public int ChatMessageNotRead(int rno) {return chatMessageMapper.ChatMessageNotRead(rno);}
    public ChatMessage getChatMessageList() {return chatMessageMapper.getChatMessageList();}
    public int ChatMessageInsert() {return chatMessageMapper.ChatMessageInsert();}
    public int ChatMessageReadUpdate(int cno, String MessageSender) { return chatMessageMapper.ChatMessageReadUpdate(cno, MessageSender);}
    public int ChatMessageSenderReadUpdate(int rno, String MessageSender) { return chatMessageMapper.ChatMessageSenderReadUpdate(rno, MessageSender);}
    public int ChatMessageSenderRemoveUpdate(int cno) {return chatMessageMapper.ChatMessageSenderRemoveUpdate(cno);}
    public int ChatMessageDelete(int cno) {return chatMessageMapper.ChatMessageDelete(cno);}
}

