package com.p0st1t.p0st1t.board.myBoard.domain;

import lombok.Data;

@Data
public class ProfileCriteria {

    private int pageNum;
    private int amount;
    private int skip;


    public ProfileCriteria() {
        this(1, 10);
        this.skip = 0;
    }

    public ProfileCriteria(int pageNum, int amount) {
        this.pageNum = pageNum;
        this.amount = amount;
        this.skip = (pageNum - 1) * amount;
    }


    public void setPageNum(int pageNum) {
        this.skip = (pageNum - 1) * this.amount;
        this.pageNum = pageNum;
    }


    public void setAmount(int amount) {
        this.skip = (this.pageNum - 1) * amount;
        this.amount = amount;
    }

}
