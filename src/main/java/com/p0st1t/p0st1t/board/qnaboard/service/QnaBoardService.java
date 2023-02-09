package com.p0st1t.p0st1t.board.qnaboard.service;


import com.p0st1t.p0st1t.board.qnaboard.domain.QnaBoardVO;
import com.p0st1t.p0st1t.board.qnaboard.domain.QnaCriteria;
import org.springframework.validation.Errors;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

public interface QnaBoardService {

    public List<QnaBoardVO> getList(QnaCriteria cri);

    public List<QnaBoardVO> getListWithPaging(QnaCriteria cri);

    public Long register(@Valid QnaBoardVO vo);

    public QnaBoardVO get(Long bno);

    public boolean delete(Long bno);

    public int modify(@Valid QnaBoardVO bVo);

    public int getTotalCount(QnaCriteria cri);

    public Map<String, String> validateHandling(Errors errors);

    public int viewCount(Long bno);

    public List<QnaBoardVO> notice() throws Exception;
}
