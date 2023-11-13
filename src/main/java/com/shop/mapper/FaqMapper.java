package com.shop.mapper;

import com.shop.entity.Faq;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
@Mapper
public interface FaqMapper {
    List<Faq> faqList();
}
