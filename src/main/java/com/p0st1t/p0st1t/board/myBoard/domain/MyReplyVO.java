package com.p0st1t.p0st1t.board.myBoard.domain;

import lombok.Data;

import java.util.Date;

@Data
public class MyReplyVO {

    private String boardname;
    private int boardid;
    private String reply;
    private String title;
    private String qname;
    private int rno;
    private int bno;
    private String writer;
    private Date replydate;
}
