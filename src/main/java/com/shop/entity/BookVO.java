package com.shop.entity;

import groovy.transform.ToString;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@ToString
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class BookVO {
    private String title;
    private String link;
    private String image;
    private String author;
    private String discount;
    private String publisher;
    private String pubdate;
    private String isbn;
    private String description;
}
