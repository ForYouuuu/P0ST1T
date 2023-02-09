package com.p0st1t.p0st1t.board.reviewboard.service;


import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewBoardVO;
import com.p0st1t.p0st1t.board.reviewboard.domain.ReviewCriteria;
import com.p0st1t.p0st1t.board.reviewboard.mapper.ReviewBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ReviewBoardServiceImpl implements ReviewBoardService {


    private final ReviewBoardMapper reviewBoardMapper;


    @Override
    public List<ReviewBoardVO> getList(ReviewCriteria cri) {
        return reviewBoardMapper.getListWithPaging(cri);
    }


    @Override
    public List<ReviewBoardVO> getListWithPaging(ReviewCriteria cri) {
        return reviewBoardMapper.getListWithPaging(cri);
    }

    @Override
    public Long register(@Valid ReviewBoardVO vo) {
        reviewBoardMapper.insertSelectKey(vo);
        return vo.getBno();
    }

    @Override
    public ReviewBoardVO get(Long bno) {
        return reviewBoardMapper.read(bno);
    }

    @Override
    public boolean delete(Long bno) {
        return reviewBoardMapper.getDelete(bno) == 1;
    }

    @Override
    public int modify(@Valid ReviewBoardVO bVo) {
        return reviewBoardMapper.update(bVo);
    }


    @Override
    public int getTotalCount(ReviewCriteria cri) {
        return reviewBoardMapper.getTotalCount(cri);
    }

    @Override
    public Map<String, String> validateHandling(Errors errors) {
        Map<String, String> validatorResult = new HashMap<>();

        for (FieldError error : errors.getFieldErrors()) { // 유효성 실패한 필드 목록 가져옴
            String validKeyName = String.format("valid_%s", error.getField()); // 유효성 실패한 필드명 가져옴
            validatorResult.put(validKeyName, error.getDefaultMessage()); //유효성 검사 실패한 필드에 정의된 메세지 가져옴
            validatorResult.put(validKeyName, error.getDefaultMessage()); //유효성 검사 실패한 필드에 정의된 메세지 가져옴

        }
        return validatorResult;
    }

    @Override
    public int viewCount(Long bno) {
        return reviewBoardMapper.BoardViewCount(bno);
    }

    @Override
    public List<ReviewBoardVO> notice() throws Exception {
        return reviewBoardMapper.notice();
    }
}
