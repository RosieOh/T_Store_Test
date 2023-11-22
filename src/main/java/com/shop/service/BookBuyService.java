package com.shop.service;

import com.shop.entity.BookBuy;
import com.shop.mapper.BookBuyMapper;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookBuyService {

    @Autowired
    private BookBuyMapper bookBuyMapper;

    public List<BookBuy> getList(Page page) {return bookBuyMapper.getList(page);}
    public BookBuy getBookBuy(@Param("bbno") int bbno) {return bookBuyMapper.getBookBuy(bbno);}
    public int getCount(Page page) {return bookBuyMapper.getCount(page);}
    public void visitCount(Page page) {bookBuyMapper.visitCount(page);}
    public void bookbuyInsert(@Param("bookbuy") BookBuy bookBuy) {bookBuyMapper.bookbuyInsert(bookBuy);}
    public void bookbuyUpdate(BookBuy bookBuy) {bookBuyMapper.bookbuyUpdate(bookBuy);}
    public void bookbuyDelete(int bbno) {bookBuyMapper.bookbuyDelete(bbno);}
}
