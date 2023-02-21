package com.gold.model;

import lombok.Data;

@Data
public class PageMaker {

    private int pageStart;
    private int pageEnd;
    private boolean next, prev;
    private int pageTotal;
    private Criteria criteria;

    public PageMaker(Criteria criteria, int pageTotal){
        this.criteria = criteria;
        this.pageTotal = pageTotal;

        this.pageEnd = (int)(Math.ceil(criteria.getPageNum()/10.0))*10;

        this.pageStart = this.pageEnd - 9;

        int amountEnd = (int)(Math.ceil(pageTotal*1.0/ criteria.getPageAmount()));

        if(amountEnd < pageEnd){
            this.pageEnd = amountEnd;
        }

        this.prev = this.pageStart > 1;

        this.next = this.pageEnd < amountEnd;
    }

}
