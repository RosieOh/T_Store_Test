package com.shop.service;

import com.shop.entity.Notice;
import com.shop.util.Page;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface NoticeService {

    public List<Notice> noticeList(Page page) throws Exception;

    public Notice noticeDetail(int no) throws Exception;

    public void noticeInsert(Notice domain) throws Exception;

    public void noticeDelete(int no) throws Exception;

    public void noticeEdit(Notice domain) throws Exception;

    public int totalCount(Page page) throws Exception;
}
