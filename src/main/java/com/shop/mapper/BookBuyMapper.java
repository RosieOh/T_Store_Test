package com.shop.mapper;

import com.shop.entity.BookBuy;
import com.shop.entity.BookSell;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface BookBuyMapper {
    List<BookBuy> getList(Page page);
    BookBuy getBookBuy(@Param("bbno") int bbno);
    int getCount(Page page);
    void visitCount(Page page);
    void bookbuyInsert(@Param("bookbuy") BookBuy bookBuy);
    void bookbuyUpdate(BookBuy bookBuy);
    void bookbuyDelete(int bbno);
}
