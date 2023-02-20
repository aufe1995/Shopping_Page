package com.gold.model;

import lombok.Data;

@Data
public class BrandVo {

    private int brandID;

    private String brandName;

    private int countryCode;

    private int establishYear;

    private String brandDesc;
}
