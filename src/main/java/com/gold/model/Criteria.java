package com.gold.model;

import lombok.Data;

@Data
public class Criteria {

    private int pageNum;
    private int pageAmount;
    private int pageReset;
    private String type;
    private String keyword;

    public Criteria(int pageNum, int pageAmount){
        this.pageNum = pageNum;
        this.pageAmount = pageAmount;
        this.pageReset = (pageNum - 1) * pageAmount;
    }

    public Criteria(){
        this(1,10);
    }

    public String[] getTypeArr() {
        return type == null? new String[] {}:type.split("");
    }

    public void setPageNum(int pageNum){
        this.pageNum = pageNum;
        this.pageReset = (pageNum - 1) * this.pageAmount;
    }

    public void setAmount(int pageAmount){
        this.pageAmount = pageAmount;
        this.pageReset = (this.pageReset - 1) * pageAmount;
    }
}
