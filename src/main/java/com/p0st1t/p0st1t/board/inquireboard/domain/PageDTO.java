package com.p0st1t.p0st1t.board.inquireboard.domain;

import lombok.Data;

@Data
public class PageDTO {
    private int startPage; // 화면에 보여질 첫 페이지
    private int endPage;    // 화면에 보여질 마지막 페이지
    private boolean prev, next;  // 이전 페이지, 다음페이지 존재유무 확인
    private int total;  // 전체 게시물 수
    private InquireCriteria cri;   // 페이지 넘버 , 어마운트

    private int boardid;
    private int categoryid;

    public PageDTO(InquireCriteria cri, int total) {
        this.cri = cri;
        this.total = total;

        this.endPage = (int) (Math.ceil(cri.getPageNum() / 10.0) * 10);
        this.startPage = this.endPage - 9;
        int realEnd = (int) (Math.ceil((total * 1.0) / cri.getAmount()));


        if (realEnd < this.endPage) {
            this.endPage = realEnd;
        }

        this.prev = this.startPage > 1;
        this.next = this.endPage < realEnd;

    }
}
