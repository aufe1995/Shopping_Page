package com.gold.service;

import com.gold.mappers.BrandMapper;
import com.gold.model.BrandVo;
import com.gold.model.Criteria;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BrandService {

    @Autowired
    BrandMapper brandMapper;

    public void addBrand(BrandVo brandVo) throws Exception{
        brandVo.setBrandName(brandVo.getBrandName());
        brandVo.setCountryCode(brandVo.getCountryCode());
        brandVo.setEstablishYear(brandVo.getEstablishYear());
        brandVo.setBrandDesc(brandVo.getBrandDesc());
        brandMapper.addBrand(brandVo);
    }

    public List<BrandVo> brandGetList(Criteria criteria) throws Exception{
        return brandMapper.brandGetList(criteria);
    }

    public int brandGetTotal(Criteria criteria) throws Exception{
        return brandMapper.brandGetTotal(criteria);
    }

    public BrandVo brandGetDetail(int brandID) throws Exception {
        return brandMapper.brandGetDetail(brandID);
    }

    public int brandModify(BrandVo brandVo) throws Exception {
        brandVo.setBrandID(brandVo.getBrandID());
        brandVo.setBrandName(brandVo.getBrandName());
        brandVo.setCountryCode(brandVo.getCountryCode());
        brandVo.setEstablishYear(brandVo.getEstablishYear());
        brandVo.setBrandDesc(brandVo.getBrandDesc());
        return brandMapper.brandModify(brandVo);
    }

    public int brandDelete(int brandID) throws Exception {
        return brandMapper.brandDelete(brandID);
    }
}
