package com.gold.model;

import lombok.Data;

@Data
public class CateVo {
    /* 카테고리 구분 */
    private int section;

    /* 카테고리 이름 */
    private String cateName;

    /* 카테고리 코드 */
    private String cateCode;

    /* 상위 카테고리 */
    private String cateParent;

    @Override
    public String toString(){
        return "CateVo [section="+section+", cateName="+cateName+", cateCode="+cateCode+", cateParent="+cateParent+"]";
    }
}
