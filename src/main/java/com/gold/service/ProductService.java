package com.gold.service;

import com.gold.mappers.ProductMapper;
import com.gold.model.CateVo;
import com.gold.model.Criteria;
import com.gold.model.ProductVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

    @Autowired
    ProductMapper productMapper;

    public void addProduct(ProductVo productVo){
        productVo.setProductName(productVo.getProductName());
        productVo.setBrandID(productVo.getBrandID());
        productVo.setProductCate(productVo.getProductCate());
        productVo.setProductCode(productVo.getProductCode());
        productVo.setProductDesc(productVo.getProductDesc());
        productMapper.addProduct(productVo);
    }

    public List<ProductVo> productGetList(Criteria criteria) throws Exception {
        return productMapper.productGetList(criteria);
    }

    public int productGetTotal(Criteria criteria) throws Exception{
        return productMapper.productGetTotal(criteria);
    }

    public List<CateVo> cateList() {
        return productMapper.cateList();
    }

    public ProductVo productGetDetail(int productID) throws Exception{
        return productMapper.productGetDetail(productID);
    }

    public int productModify(ProductVo productVo) throws Exception {
        productVo.setProductID(productVo.getProductID());
        productVo.setProductName(productVo.getProductName());
        productVo.setBrandID(productVo.getBrandID());
        productVo.setProductCate(productVo.getProductCate());
        productVo.setProductCode(productVo.getProductCode());
        productVo.setProductDesc(productVo.getProductDesc());
        return productMapper.productModify(productVo);
    }

}
