package com.p0st1t.p0st1t.board.reply.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

import java.util.List;

@Data
@AllArgsConstructor
public class ReplyPageDTO {

    private int replyCnt; //해당 게시글의 총 댓글 수
    private List<ReplyVO> list; //해당 게시글에서 페이지에 맞는 댓글 목록(amount = 10)
}
