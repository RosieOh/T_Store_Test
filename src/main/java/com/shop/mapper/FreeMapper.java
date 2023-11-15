package com.shop.mapper;


import com.shop.entity.Free;
import com.shop.entity.Notice;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;

@Mapper
@Component
public interface FreeMapper {

    List<Free> getList(Page page);
    Free getFree(@Param("fno") int fno);
    int getCount(Page page);
    void visitCount(int fno);
    void freeInsert(@Param("free") Free free);
    void freeUpdate(Free free);
    void freeDelete(int fno);


}
