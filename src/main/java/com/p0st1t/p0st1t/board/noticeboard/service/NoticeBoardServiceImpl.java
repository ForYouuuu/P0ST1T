package com.p0st1t.p0st1t.board.noticeboard.service;


import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeBoardVO;
import com.p0st1t.p0st1t.board.noticeboard.domain.NoticeCriteria;
import com.p0st1t.p0st1t.board.noticeboard.mapper.NoticeBoardMapper;
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
public class NoticeBoardServiceImpl implements NoticeBoardService {


    private final NoticeBoardMapper noticeBoardMapper;

    @Override
    public List<NoticeBoardVO> getList(NoticeCriteria cri) {
        return noticeBoardMapper.getListWithPaging(cri);
    }


    @Override
    public List<NoticeBoardVO> getListWithPaging(NoticeCriteria cri) {
        return noticeBoardMapper.getListWithPaging(cri);
    }

    @Override
    public Long register(@Valid NoticeBoardVO vo) {
        noticeBoardMapper.insertSelectKey(vo);
        return vo.getBno();
    }

    @Override
    public NoticeBoardVO get(Long bno) {
        return noticeBoardMapper.read(bno);
    }

    @Override
    public boolean delete(Long bno) {
        return noticeBoardMapper.getDelete(bno) == 1;
    }

    @Override
    public int modify(@Valid NoticeBoardVO bVo) {
        return noticeBoardMapper.update(bVo);
    }


    @Override
    public int getTotalCount(NoticeCriteria cri) {
        return noticeBoardMapper.getTotalCount(cri);
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
        return noticeBoardMapper.BoardViewCount(bno);
    }

    @Override
    public List<NoticeBoardVO> notice() throws Exception {
        return noticeBoardMapper.notice();
    }
}
