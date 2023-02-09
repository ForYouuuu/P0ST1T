package com.p0st1t.p0st1t.board.myBoard.mapper;

import com.p0st1t.p0st1t.board.myBoard.domain.MyBoardVO;
import com.p0st1t.p0st1t.board.myBoard.domain.MyReplyVO;
import com.p0st1t.p0st1t.board.myBoard.domain.ProfileCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyBoardMapper {

    public List<MyBoardVO> getList(Long userId);
    public List<MyBoardVO> getListWithPaging(@Param("userId") Long userId, @Param("cri") ProfileCriteria cri);
    public int getTotalCount(Long userId);
    public int getTotalRepCount(Long userId);
    public List<MyReplyVO> getRepListWithPaging(@Param("userId") Long userId, @Param("cri") ProfileCriteria cri);
    public int getBoardCnt();
    public int getUserCnt();
}
