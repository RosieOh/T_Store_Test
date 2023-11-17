package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.validation.constraints.NotNull;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessage {
    public enum MessageType {
        ENTER, TALK, LEAVE, NOTICE
    }

    private int cno;
    @NotNull
    private MessageType type;
    @NotNull
    private int rno;
    @NotNull
    private String messageSender;
    @NotNull
    private String message;
    private String status = "NOTREAD";
    private String time;

}
