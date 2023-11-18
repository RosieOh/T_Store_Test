package com.shop.mapper;

import com.shop.entity.Category;
import com.shop.entity.Product;
import com.shop.util.Page;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface ProductMapper {
    List<Product> productList(Page page);                               // 상품 목록 조회
    List<Product> productListBySeller(String seller, String page);      // 해당 판매자의 상품 목록 조회
    List<Map<String, Integer>> getCategoryProductNumber();              // 카테고리 별 상품 수 조회
    List<Category> categoryList();                                      // 모든 카테고리 목록을 조회
    Product productDetail(Long pno);                                    // 상품 상세 정보 조회
    int getProductCount(Page page);                                     // 전체 상품의 수 조회
    Product productInsert(Product product);                                 // 새로운 상품 등록
    int productStatusUpdate(Long pno, String status);                   // 상품의 절판 여부 조회
    int productDelete(Long pno);                                        // 상품 삭제
}
