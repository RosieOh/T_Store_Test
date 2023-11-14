package com.shop.service;

import com.shop.entity.Free;
import com.shop.entity.Notice;
import com.shop.mapper.FreeMapper;
import com.shop.mapper.NoticeMapper;
import com.shop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeService {

    @Autowired
    private FreeMapper freeMapper;


    public List<Free> getList(Page page) { return freeMapper.getList(page); }
    public Free getFree(int fno) { return freeMapper.getFree(fno); }
    public void visitCount(int fno) { freeMapper.visitCount(fno);}
    public void freeInsert(Free free) { freeMapper.freeInsert(free); }
    public void freeUpdate(Free free) { freeMapper.freeUpdate(free); }
    public void freeDelete(int fno) { freeMapper.freeDelete(fno); }
    public int getCount(Page page) { return freeMapper.getCount(page); }
}