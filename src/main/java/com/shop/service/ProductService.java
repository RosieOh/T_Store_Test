package com.shop.service;

import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.mapper.ProductMapper;
import com.shop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ProductService {

    @Autowired
    private ProductMapper productMapper;

    public List<Product> productList(Page page) { return productMapper.productList(page);}
    public List<Product> productListBySeller(String seller, String page) {return productMapper.productListBySeller(seller, page);}
    public List<Map<String, Integer>> getCategoryProductNumber() {return productMapper.getCategoryProductNumber();}
    public List<Category> categoryList() {return productMapper.categoryList();}
    public Product productDetail(Long pno) {return productMapper.productDetail(pno);}
    public int getProductCount(Page page) {return productMapper.getProductCount(page);}
    public Product productInsert(Product product) {return productMapper.productInsert(product);}
    public int productStatusUpdate(Long pno, String status) {return productMapper.productStatusUpdate(pno, status);}
    public int productDelete(Long pno) {return productMapper.productDelete(pno);}
}

