package com.shop.service;

import com.shop.entity.Notice;
import com.shop.mapper.NoticeMapper;
import com.shop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NoticeService {

    @Autowired
    private NoticeMapper noticeMapper;

    public List<Notice> getList(Page page) { return noticeMapper.getList(page); }
    public Notice getNotice(int no) { return noticeMapper.getNotice(no); }
    public void visitCount(int no) { noticeMapper.visitCount(no);}
    public void noticeInsert(Notice notice) { noticeMapper.noticeInsert(notice); }
    public void noticeUpdate(Notice notice) { noticeMapper.noticeUpdate(notice); }
    public void noticeDelete(int no) { noticeMapper.noticeDelete(no); }
    public int getCount(Page page) { return noticeMapper.getCount(page); }
}
