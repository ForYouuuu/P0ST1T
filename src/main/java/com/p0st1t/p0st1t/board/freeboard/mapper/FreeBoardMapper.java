package com.p0st1t.p0st1t.board.freeboard.mapper;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.freeboard.domain.FreeBoardVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface FreeBoardMapper {

    public List<FreeBoardVO> getList(Criteria cri);
    public void register(FreeBoardVO vo);
    public void insertSelectKey(FreeBoardVO bVo);
    public FreeBoardVO read(Long bno);
    public int getDelete(Long bno);
    public int update(FreeBoardVO bVo);
    public List<FreeBoardVO> getListWithPaging(Criteria cri);
    public int getTotalCount(Criteria cri);
    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
    public int BoardViewCount(Long bno);
    public List<FreeBoardVO> notice() throws Exception;

}
