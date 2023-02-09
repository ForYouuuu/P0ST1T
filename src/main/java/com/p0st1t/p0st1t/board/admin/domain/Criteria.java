package com.p0st1t.p0st1t.board.admin.domain;

import lombok.Data;
import org.springframework.web.util.UriComponentsBuilder;

@Data
public class Criteria {

    private String boardname;
    private int boardid;
    private String categoryname;
    private int categoryid;
    private int categoryidinsert;
    private String sort;
    private int pageNum;
    private int amount;
    private String user_id;
    private String auth;
    private String email;
    private String name;
    private String nickname;
    private int skip; // limit 오프셋(offset)페이징 처리
    // 스킵 할 게시물 수 ((pageNum-1) * amount)

    private String type; // T C W      Title Content Writer

    private String[] typeArr; // 검색 타입 배열
    private String keyword;


    public String[] getTypeArr() {
        return type == null ? new String[]{} : type.split("");
    }

    public String getListLink() {
        UriComponentsBuilder builder = UriComponentsBuilder.fromPath("")
                .queryParam("pageNum", this.pageNum)
                .queryParam("amount", this.amount)
                .queryParam("type", this.type)
                .queryParam("keyword", this.keyword)
                .queryParam("boardid", this.boardid)
                .queryParam("categoryid", this.categoryid)
                .queryParam("sort", this.sort);

        return builder.toUriString();
    }

    public Criteria(String sort, int boardid, int categoryid) {
        this.sort = sort;
        this.boardid = boardid;
        this.categoryid = categoryid;
    }

    public Criteria() {
        this(1, 13);
        this.skip = 0;
    }

    public Criteria(int pageNum, int amount) {
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
