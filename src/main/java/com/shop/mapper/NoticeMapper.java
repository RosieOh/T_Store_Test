package com.shop.mapper;


import com.shop.entity.Notice;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface NoticeMapper {
    List<Notice> getList(Page page);
    Notice getNotice(@Param("no") int no);
    int getCount(Page page);
    void visitCount(int no);
    void noticeInsert(@Param("notice") Notice notice);
    void noticeUpdate(Notice notice);
    void noticeDelete(int no);
}