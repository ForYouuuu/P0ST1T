package com.p0st1t.p0st1t.board.myBoard.service;

import com.p0st1t.p0st1t.board.myBoard.domain.MyBoardVO;
import com.p0st1t.p0st1t.board.myBoard.domain.MyReplyVO;
import com.p0st1t.p0st1t.board.myBoard.domain.ProfileCriteria;
import com.p0st1t.p0st1t.board.myBoard.mapper.MyBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class MyBoardService {

    private final MyBoardMapper mapper;

    public List<MyBoardVO> getList(Long userId) {
        return mapper.getList(userId);
    }

    public List<MyBoardVO> getListWithPaging(Long userId, ProfileCriteria cri) {
        return mapper.getListWithPaging(userId, cri);
    }

    public int getTotalCount(Long userId) {
        return mapper.getTotalCount(userId);
    }

    public int getTotalRepCount(Long userId) {
        return mapper.getTotalRepCount(userId);
    }

    public List<MyReplyVO> getRepListWithPaging(Long userId, ProfileCriteria cri) {
        return mapper.getRepListWithPaging(userId, cri);
    }

    public int getBoardCnt() {
        return mapper.getBoardCnt();
    }

    public int getUserCnt() {
        return mapper.getUserCnt();
    }
}
