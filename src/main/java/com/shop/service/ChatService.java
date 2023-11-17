package com.shop.service;

import com.shop.entity.Chat;
import com.shop.mapper.ChatMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {

    @Autowired
    private ChatMapper chatMapper;

    public List<Chat> chatList() { return chatMapper.chatList();}
    public List<Chat> chatProductList(int pno) { return chatMapper.chatProductList(pno);}
    public Chat getChat(int rno) { return chatMapper.getChat(rno);}
    public Chat getChatId(int pno, String userId) {return getChatId(pno, userId);}
    public Chat getChatUnique(String userId, int pno) {return getChatUnique(userId, pno);}
    public void ChatInsert(String userId, int pno) {chatMapper.ChatInsert(userId, pno);}
    public void ChatOffUpdate(int rno) { chatMapper.ChatOffUpdate(rno);}
    public int ChatDelete(int rno) { return chatMapper.ChatDelete(rno);}
}
