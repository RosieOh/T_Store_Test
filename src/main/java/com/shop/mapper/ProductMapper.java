package com.shop.mapper;

import com.shop.entity.Product;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {
    List<Product> productList(Page page);
    List<Product> productListBySeller(String seller, String page);
    Product getProduct(Long pno);
    int productInsert(Product product);
    int productStatusUpdate(Long pno, String status);
    int productDelete(Long pno);
}
