package com.p0st1t.p0st1t.board.reviewboard.domain;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class ReviewCriteria {

    private String boardname;
    private int boardid;
    private String categoryname;
    private int categoryid;
    private int categoryidinsert;
    private int qid;
    private int pageNum;
    private int amount;
    private int skip;
    private String type; // T C W      Title Content Writer

    private String[] typeArr; // 검색 타입 배열
    private String keyword;
    private String sort;

    public String[] getTypeArr() {
        return type == null ? new String[]{} : type.split("");
    }

    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.amount)
                .queryParam("type", this.type)
                .queryParam("keyword", this.keyword)
                .queryParam("qid", this.qid)
                .queryParam("sort", this.sort);

        return builder.toUriString();
    }

    public ReviewCriteria(String sort) {
        this.sort = sort;
    }

    public ReviewCriteria() {
        this(1, 10);
        this.skip = 0;
    }


    public ReviewCriteria(int qid) {
        this.qid = qid;
    }

    public ReviewCriteria(int pageNum, int amount) {
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

    public void setType(String type) {
        this.type = type;
        this.typeArr = type.split("");
    }


}
