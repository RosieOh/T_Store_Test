package com.shop.mapper;

import com.shop.entity.Chat;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMapper {
    List<Chat> chatList();
    List<Chat> chatProductList(int pno);
    Chat getChat(int rno);
    Chat getChatId(int pno, String userId);
    Chat getChatUnique(String userId, int pno);
    void ChatInsert(String userId, int pno);
    void ChatOffUpdate(int rno);
    int ChatDelete(int rno);
}
