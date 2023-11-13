package com.shop.service;

import com.shop.entity.Free;
import com.shop.mapper.FreeMapper;
import com.shop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FreeServiceImpl implements FreeService{

    @Autowired
    private FreeMapper freeMapper;

    @Override
    public List<Free> freeList(Page page) {
        return freeMapper.freeList(page);
    }

    @Override
    public Free freeDetail(int fno) {
        return freeMapper.freeDetail(fno);
    }

    @Override
    public void visitCount(int fno) {
        freeMapper.visitCount(fno);
    }

    @Override
    public void freeInsert(Free domain) {
        freeMapper.freeInsert(domain);
    }

    @Override
    public void freeDelete(int fno) {
        freeMapper.freeDelete(fno);
    }

    @Override
    public void freeEdit(Free domain) {
        freeMapper.freeEdit(domain);
    }

    @Override
    public int totalCount(Page page) {
        return freeMapper.totalCount(page);
    }
}
