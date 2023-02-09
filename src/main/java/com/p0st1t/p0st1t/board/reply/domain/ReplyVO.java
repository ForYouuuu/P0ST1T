package com.p0st1t.p0st1t.board.reply.domain;

import lombok.Data;

import java.util.Date;

@Data
public class ReplyVO {

    private Long rno;
    private Long bno;
    private String replyer;
    private String reply;
    private Long replyerid;
    private Date replydate;
    private Date updatedate;

}
