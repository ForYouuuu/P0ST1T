package com.p0st1t.p0st1t.board.reviewboard.service;


import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewBoardVO;
import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewCriteria;
import org.springframework.validation.Errors;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

public interface ReviewBoardService {

    public List<ReviewBoardVO> getList(ReviewCriteria cri);

    public List<ReviewBoardVO> getListWithPaging(ReviewCriteria cri);

    public Long register(@Valid ReviewBoardVO vo);

    public ReviewBoardVO get(Long bno);

    public boolean delete(Long bno);

    public int modify(@Valid ReviewBoardVO bVo);

    public int getTotalCount(ReviewCriteria cri);


    public Map<String, String> validateHandling(Errors errors);

    public int viewCount(Long bno);

    public List<ReviewBoardVO> notice() throws Exception;
}
