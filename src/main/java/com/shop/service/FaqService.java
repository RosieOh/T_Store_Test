package com.shop.service;

import com.shop.entity.Faq;
import com.shop.mapper.FaqMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FaqService {

    @Autowired
    private FaqMapper faqMapper;

    public List<Faq> faqList(){
        return faqMapper.faqList();
    }
}
