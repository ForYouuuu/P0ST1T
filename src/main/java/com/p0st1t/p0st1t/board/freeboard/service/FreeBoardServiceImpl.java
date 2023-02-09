package com.p0st1t.p0st1t.board.freeboard.service;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.freeboard.domain.FreeBoardVO;
import com.p0st1t.p0st1t.board.freeboard.mapper.FreeBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class FreeBoardServiceImpl implements FreeBoardService {


    private final FreeBoardMapper freeBoardMapper;

    @Override
    public List<FreeBoardVO> getList(Criteria cri) {
        return freeBoardMapper.getListWithPaging(cri);
    }

    @Override
    public List<FreeBoardVO> getListWithPaging(Criteria cri) {
        return freeBoardMapper.getListWithPaging(cri);
    }

    @Override
    public Long register(FreeBoardVO vo) {
        freeBoardMapper.insertSelectKey(vo);
        return vo.getBno();
    }

    @Override
    public FreeBoardVO get(Long bno) {
        return freeBoardMapper.read(bno);
    }

    @Override
    public boolean delete(Long bno) {
        return freeBoardMapper.getDelete(bno) == 1;
    }

    @Override
    public int modify(FreeBoardVO bVo) {
        return freeBoardMapper.update(bVo);
    }

    @Override
    public int getTotalCount(Criteria cri) {
        return freeBoardMapper.getTotalCount(cri);
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
        return freeBoardMapper.BoardViewCount(bno);
    }

    @Override
    public List<FreeBoardVO> notice() throws Exception {
        return freeBoardMapper.notice();
    }


}
