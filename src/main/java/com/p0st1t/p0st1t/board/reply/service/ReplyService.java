package com.p0st1t.p0st1t.board.reply.service;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.reply.domain.ReplyPageDTO;
import com.p0st1t.p0st1t.board.reply.domain.ReplyVO;

import java.util.List;

public interface ReplyService {

    public int register(ReplyVO vo);

    public ReplyVO get(Long rno);

    public int modify(ReplyVO vo);

    public int remove(Long rno);

    public List<ReplyVO> getList(Criteria cri, Long bno);

    public ReplyPageDTO getListPage(Criteria cri, Long bno);

    public int getCount(Long bno);

}
