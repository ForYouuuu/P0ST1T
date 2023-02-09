package com.p0st1t.p0st1t.board.freeboard.domain;

import lombok.Data;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotEmpty;
import java.util.Date;

@Data
public class FreeBoardVO {

    private String boardname;
    private int boardid;
    private String categoryname;
    private int categoryid;
    private int categoryidinsert;
    private boolean secret;
    private Long bno;   //PK

    @NotEmpty(message = "제목을 입력해야 합니다")
    @Length(min = 3, message = "제목은 3자 이상 입력 바랍니다")
    private String title;

    @NotEmpty(message = "내용을 입력해야 합니다")
    @Length(min = 10, message = "내용은 최소 10자 이상 입력 바랍니다")
    private String content;
    private String writer;
    private Long writerid;
    private Date writedate;
    private Date updatedate;
    private int viewcount;
    private int replycnt;
    private int likehit;

}
