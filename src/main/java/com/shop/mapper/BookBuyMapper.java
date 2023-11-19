package com.shop.mapper;

import com.shop.entity.BookBuy;
import com.shop.entity.Notice;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface BookBuyMapper {
    List<BookBuy> getList(Page page);
    BookBuy getBookBuyList(@Param("bbno") int bbno);
    int getCount(Page page);
    void visitCount(int bbno);
    void bookbuyInsert(@Param("bookbuy") BookBuy bookBuy);
    void bookbuyUpdate(BookBuy bookBuy);
    void bookbuyDelete(int bbno);
}
