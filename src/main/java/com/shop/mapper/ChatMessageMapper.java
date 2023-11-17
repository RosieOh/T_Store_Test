package com.shop.mapper;

import com.shop.entity.ChatMessage;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ChatMessageMapper {
    List<ChatMessage> ChatMessageList(int rno);

    int ChatMessageNotRead(int rno);

    ChatMessage getChatMessageList();

    int ChatMessageInsert();

    int ChatMessageReadUpdate(int cno, String MessageSender);

    int ChatMessageSenderReadUpdate(int rno, String MessageSender);

    int ChatMessageSenderRemoveUpdate(int cno);

    int ChatMessageDelete(int cno);
}
