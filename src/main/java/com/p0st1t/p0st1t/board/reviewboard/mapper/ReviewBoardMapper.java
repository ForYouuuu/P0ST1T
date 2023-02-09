package com.p0st1t.p0st1t.board.reviewboard.mapper;


import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewBoardVO;
import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReviewBoardMapper {

    public List<ReviewBoardVO> getList(ReviewCriteria cri);

    public void register(ReviewBoardVO vo);

    public void insertSelectKey(ReviewBoardVO bVo);

    public ReviewBoardVO read(Long bno);

    public int getDelete(Long bno);

    public int update(ReviewBoardVO bVo);

    public List<ReviewBoardVO> getListWithPaging(ReviewCriteria cri);

    public int getTotalCount(ReviewCriteria cri);

    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

    public int BoardViewCount(Long bno);

    public List<ReviewBoardVO> notice() throws Exception;


}
