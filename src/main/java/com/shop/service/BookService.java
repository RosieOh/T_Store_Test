package com.shop.service;

import com.shop.entity.Book;
import com.shop.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookService {

    @Autowired
    private BookMapper bookMapper;

    public int createBook(Book book)  {return bookMapper.createBook(book);}
    public List<Book> readBookAll()  {return bookMapper.readBookAll();}
    public Book readBook(Long seq)  {return bookMapper.readBook(seq);}
}
