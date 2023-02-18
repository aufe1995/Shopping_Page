package com.gold.mappers;

import com.gold.vo.ProductVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

    void addProduct(ProductVo productVo);

}
