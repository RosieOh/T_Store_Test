package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
public class Notice {
    private int no;
    private String title;
    private String content;
    private int author;
    private Date regdate;
    private int cnt;
}
