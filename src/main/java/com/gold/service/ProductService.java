package com.gold.service;

import com.gold.mappers.ProductMapper;
import com.gold.vo.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ProductService {

    @Autowired
    ProductMapper productMapper;

    public void addProduct(ProductVo productVo){
        productVo.setProductName(productVo.getProductName());
        productVo.setBrandID(productVo.getBrandID());
        productVo.setProductCode(productVo.getProductCode());
    }
}
