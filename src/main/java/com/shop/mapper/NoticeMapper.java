package com.shop.mapper;


import com.shop.entity.Notice;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface NoticeMapper {
    List<Notice> noticeList(Page page);
    Notice noticeDetail(int no);
    void visitCount(int no);
    void noticeInsert(Notice domain);
    void noticeDelete(int no);
    void noticeEdit(Notice domain);
    int totalCount(Page page);
}