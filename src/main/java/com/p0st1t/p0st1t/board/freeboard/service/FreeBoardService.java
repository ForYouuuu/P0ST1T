package com.p0st1t.p0st1t.board.freeboard.service;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.freeboard.domain.FreeBoardVO;
import org.springframework.validation.Errors;


import java.util.List;
import java.util.Map;

public interface FreeBoardService {

    public List<FreeBoardVO> getList(Criteria cri);
    public List<FreeBoardVO> getListWithPaging(Criteria cri);
    public Long register(FreeBoardVO vo);
    public FreeBoardVO get(Long bno);
    public boolean delete(Long bno);
    public int modify(FreeBoardVO bVo);
    public int getTotalCount(Criteria cri);
    public int viewCount(Long bno);
    // 유효성 핸들링
    public Map<String, String> validateHandling(Errors errors);
    public List<FreeBoardVO> notice() throws Exception;


}
