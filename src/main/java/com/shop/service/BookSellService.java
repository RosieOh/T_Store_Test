package com.shop.service;

import com.shop.entity.BookSell;
import com.shop.mapper.BookSellMapper;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BookSellService {

    @Autowired
    private BookSellMapper bookSellMapper;

    public List<BookSell> getList(Page page) { return bookSellMapper.getList(page);}
    public BookSell getBookSell(@Param("bsno") int bsno) {return bookSellMapper.getBookSell(bsno);}
    public int getCount(Page page) {return bookSellMapper.getCount(page);}
    public void visitCount(int bsno) { bookSellMapper.visitCount(bsno);}
    public void bookSellInsert(@Param("booksell") BookSell bookSell) {bookSellMapper.bookSellInsert(bookSell);}
    public void bookSellUpdate(BookSell bookSell) {bookSellMapper.bookSellUpdate(bookSell);}
    public void bookSellDelete(int bsno) {bookSellMapper.bookSellDelete(bsno);}
}
