package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Free {
    private int fno;
    private String title;
    private String content;
    private int author;
    private Date regdate;
    private int cnt;
}
