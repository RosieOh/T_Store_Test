package com.shop.mapper;

import com.shop.entity.BookSell;
import com.shop.entity.Notice;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookSellMapper {
    List<BookSell> getList(Page page);
    BookSell getBookSell(@Param("bsno") int bsno);
    int getCount(Page page);
    void visitCount(int bsno);
    void bookSellInsert(@Param("booksell") BookSell bookSell);
    void bookSellUpdate(BookSell bookSell);
    void bookSellDelete(int bsno);
}
