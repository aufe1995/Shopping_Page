package com.gold.model;

import lombok.Data;

@Data
public class BrandVo {

    private int brandID;

    private String brandName;

    private String countryCode;

    private int establishYear;

    private String brandDesc;

    public void setCountryCode(String countryCode){
        this.countryCode = countryCode;
        if(countryCode.equals("410")){
            this.countryCode = "대한민국";
        }else if(countryCode.equals("840")){
            this.countryCode = "미국";
        }else if(countryCode.equals("826")){
            this.countryCode = "영국";
        }else if(countryCode.equals("329")){
            this.countryCode = "일본";
        }else if(countryCode.equals("276")){
            this.countryCode = "독일";
        }else if(countryCode.equals("250")){
            this.countryCode = "프랑스";
        }else if(countryCode.equals("380")){
            this.countryCode = "이탈리아";
        }else {
            this.countryCode = "없음";
        }
    }
}
