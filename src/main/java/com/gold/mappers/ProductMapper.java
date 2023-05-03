package com.gold.mappers;

import com.gold.model.CateVo;
import com.gold.model.Criteria;
import com.gold.model.ProductVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {

    void addProduct(ProductVo productVo);

    List<ProductVo> productGetList(Criteria criteria);

    int productGetTotal(Criteria criteria);

    List<CateVo> cateList();
}
