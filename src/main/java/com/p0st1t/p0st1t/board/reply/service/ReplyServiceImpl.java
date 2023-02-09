package com.p0st1t.p0st1t.board.reply.service;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.freeboard.mapper.FreeBoardMapper;
import com.p0st1t.p0st1t.board.reply.domain.ReplyPageDTO;
import com.p0st1t.p0st1t.board.reply.domain.ReplyVO;
import com.p0st1t.p0st1t.board.reply.mapper.ReplyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@RequiredArgsConstructor
@Controller
@Service // 서비스임을 알려주는 
public class ReplyServiceImpl implements ReplyService {


    private final ReplyMapper mapper;

    private final FreeBoardMapper bmapper;

    @Transactional
    @Override
    public int register(ReplyVO vo) {


        bmapper.updateReplyCnt(vo.getBno(), 1);

        return mapper.insert(vo);
    }

    @Override
    public ReplyVO get(Long rno) {
        return mapper.read(rno);
    }

    @Override
    public int modify(ReplyVO vo) {
        return mapper.update(vo);
    }

    @Transactional
    @Override
    public int remove(Long rno) {

        ReplyVO vo = mapper.read(rno);
        bmapper.updateReplyCnt(vo.getBno(), -1);
        return mapper.delete(rno);
    }

    @Override
    public List<ReplyVO> getList(Criteria cri, Long bno) {
        return mapper.getListWithPaging(cri, bno);
    }

    @Override
    public ReplyPageDTO getListPage(Criteria cri, Long bno) {
        return new ReplyPageDTO(mapper.getCountByBno(bno)
                , mapper.getListWithPaging(cri, bno));
    }

    @Override
    public int getCount(Long bno) {
        return mapper.getCountByBno(bno);
    }

}
