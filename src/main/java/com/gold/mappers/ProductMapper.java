package com.gold.mappers;

import com.gold.model.ProductVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

    void addProduct(ProductVo productVo);

}
