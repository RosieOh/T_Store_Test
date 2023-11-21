package com.shop.mapper;

import com.shop.entity.BookSell;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface BookSellMapper {
    List<BookSell> getList(Page page);
    BookSell getBookSell(@Param("bsno") int bsno);
    int getCount(Page page);
    void visitCount(Page page);
    void booksellInsert(@Param("booksell") BookSell bookSell);
    void booksellUpdate(BookSell bookSell);
    void booksellDelete(int bsno);
}
