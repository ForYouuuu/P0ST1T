package com.p0st1t.p0st1t.board.admin.domain;

import lombok.Data;

import java.util.Date;


@Data
public class AdminVO {
    private String boardname;
    private int boardid;
    private String categoryname;
    private int categoryid;
    private int categoryidinsert;
    private String keyword;
    private Long bno; //PK
    private String title;
    private String content;
    private String writer;
    private Date writedate;
    private Date updatedate;
    private int viewcount;
    private int replycnt;
    private int likehit;
    private String user_id;
    private String auth;
    private String email;
    private String name;
    private String nickname;
}
