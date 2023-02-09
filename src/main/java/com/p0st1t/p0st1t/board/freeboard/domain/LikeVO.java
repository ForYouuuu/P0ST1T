package com.p0st1t.p0st1t.board.freeboard.domain;

import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class LikeVO {

    private Long hno;
    @NotNull
    private Long bno;
    @NotNull
    private String id;

}
