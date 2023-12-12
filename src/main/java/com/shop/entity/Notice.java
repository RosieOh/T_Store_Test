package com.shop.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Notice {
    private int no;
    private String title;
    private String content;
    private String resdate;
    private int username;
    private int visit;
}
