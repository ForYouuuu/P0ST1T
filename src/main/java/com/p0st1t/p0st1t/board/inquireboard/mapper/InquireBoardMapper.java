package com.p0st1t.p0st1t.board.inquireboard.mapper;

import com.p0st1t.p0st1t.board.inquireboard.domain.InquireBoardVO;
import com.p0st1t.p0st1t.board.inquireboard.domain.InquireCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface InquireBoardMapper {

    public List<InquireBoardVO> getList(InquireCriteria cri);
    public void register(InquireBoardVO vo);
    public void insertSelectKey(InquireBoardVO bVo);
    public InquireBoardVO read(Long bno);
    public int getDelete(Long bno);
    public int update(InquireBoardVO bVo);
    public List<InquireBoardVO> getListWithPaging(InquireCriteria cri);
    public int getTotalCount(InquireCriteria cri);
    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);
    public int BoardViewCount(Long bno);
    public List<InquireBoardVO> notice() throws Exception;


}
