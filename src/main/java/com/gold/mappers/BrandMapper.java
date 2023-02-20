package com.gold.mappers;

import com.gold.model.BrandVo;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface BrandMapper {

    void addBrand(BrandVo brandVo);
}
