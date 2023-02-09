package com.p0st1t.p0st1t.board.myBoard.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MyBoardVO {

    private String boardname;
    private int boardid;
    private String qname;
    private int qid;
    private int bno;
    private String title;
    private String content;
    private Long writerid;
    private String writer;
    private Date writedate;
    private Date updatedate;
    private int replycnt;
    private int likehit;
    private int viewcount;
}
