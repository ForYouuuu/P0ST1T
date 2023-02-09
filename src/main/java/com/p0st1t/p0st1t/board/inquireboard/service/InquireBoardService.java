package com.p0st1t.p0st1t.board.inquireboard.service;

import com.p0st1t.p0st1t.board.inquireboard.domain.InquireBoardVO;
import com.p0st1t.p0st1t.board.inquireboard.domain.InquireCriteria;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

public interface InquireBoardService {

    public List<InquireBoardVO> getList(InquireCriteria cri);
    public List<InquireBoardVO> getListWithPaging(InquireCriteria cri);
    public Long register(InquireBoardVO vo);
    public InquireBoardVO get(Long bno);
    public boolean delete(Long bno);
    public int modify(InquireBoardVO bVo);
    public int getTotalCount(InquireCriteria cri);
    public Map<String, String> validateHandling(Errors errors);
    public int BoardViewCount(Long bno);
    public List<InquireBoardVO> notice() throws Exception;
}
