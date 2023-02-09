package com.p0st1t.p0st1t.board.qnaboard.mapper;


import com.p0st1t.p0st1t.board.qnaboard.domain.QnaBoardVO;
import com.p0st1t.p0st1t.board.qnaboard.domain.QnaCriteria;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface QnaBoardMapper {

    public List<QnaBoardVO> getList(QnaCriteria cri);

    public void register(QnaBoardVO vo);

    public void insertSelectKey(QnaBoardVO bVo);

    public QnaBoardVO read(Long bno);

    public int getDelete(Long bno);

    public int update(QnaBoardVO bVo);

    public List<QnaBoardVO> getListWithPaging(QnaCriteria cri);

    public int getTotalCount(QnaCriteria cri);

    public void updateReplyCnt(@Param("bno") Long bno, @Param("amount") int amount);

    public int BoardViewCount(Long bno);

    public List<QnaBoardVO> notice() throws Exception;


}
