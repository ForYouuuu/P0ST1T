package com.p0st1t.p0st1t.board.noticeboard.mapper;

import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeBoardVO;
import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NoticeBoardMapper {

    public List<NoticeBoardVO> getList(NoticeCriteria cri);

    public void register(NoticeBoardVO vo);

    public void insertSelectKey(NoticeBoardVO bVo);

    public NoticeBoardVO read(Long bno);

    public int getDelete(Long bno);

    public int update(NoticeBoardVO bVo);

    public List<NoticeBoardVO> getListWithPaging(NoticeCriteria cri);

    public int getTotalCount(NoticeCriteria cri);

    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

    public int BoardViewCount(Long bno);

    public List<NoticeBoardVO> notice() throws Exception;


}
