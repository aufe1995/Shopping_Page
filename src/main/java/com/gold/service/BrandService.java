package com.gold.service;

import com.gold.mappers.BrandMapper;
import com.gold.model.BrandVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
}
