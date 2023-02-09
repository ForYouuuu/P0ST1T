package com.p0st1t.p0st1t.board.noticeboard.service;


import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeBoardVO;
import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeCriteria;
import org.springframework.validation.Errors;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

public interface NoticeBoardService {

    public List<NoticeBoardVO> getList(NoticeCriteria cri);

    public List<NoticeBoardVO> getListWithPaging(NoticeCriteria cri);

    public Long register(@Valid NoticeBoardVO vo);

    public NoticeBoardVO get(Long bno);

    public boolean delete(Long bno);

    public int modify(@Valid NoticeBoardVO bVo);

    public int getTotalCount(NoticeCriteria cri);

    // 유효성 핸들링
    public Map<String, String> validateHandling(Errors errors);

    public int viewCount(Long bno);

    public List<NoticeBoardVO> notice() throws Exception;


}
