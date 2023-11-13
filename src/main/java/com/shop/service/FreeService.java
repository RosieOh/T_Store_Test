package com.shop.service;

import com.shop.entity.Free;
import com.shop.mapper.FreeMapper;
import com.shop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public interface FreeService {

    public List<Free> freeList(Page page);

    public Free freeDetail(int fno);

    public void visitCount(int fno);

    public void freeInsert(Free domain);

    public void freeDelete(int fno);

    public void freeEdit(Free domain);

    public int totalCount(Page page);
}