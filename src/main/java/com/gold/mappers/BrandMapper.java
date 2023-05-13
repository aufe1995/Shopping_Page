package com.gold.mappers;

import com.gold.model.BrandVo;
import com.gold.model.Criteria;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface BrandMapper {

    void addBrand(BrandVo brandVo);

    List<BrandVo> brandGetList(Criteria criteria);

    int brandGetTotal(Criteria criteria);

    BrandVo brandGetDetail(int brandID);

    int brandModify(BrandVo brandVo);

    int brandDelete(int brandID);
}
