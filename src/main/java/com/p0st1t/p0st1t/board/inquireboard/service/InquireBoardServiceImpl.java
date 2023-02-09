package com.p0st1t.p0st1t.board.inquireboard.service;

import com.p0st1t.p0st1t.board.inquireboard.domain.InquireBoardVO;
import com.p0st1t.p0st1t.board.inquireboard.domain.InquireCriteria;
import com.p0st1t.p0st1t.board.inquireboard.mapper.InquireBoardMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class InquireBoardServiceImpl implements InquireBoardService {


    private final InquireBoardMapper inquireBoardMapper;

    @Override
    public List<InquireBoardVO> getList(InquireCriteria cri) {
        return inquireBoardMapper.getListWithPaging(cri);
    }

    @Override
    public List<InquireBoardVO> getListWithPaging(InquireCriteria cri) {
        return inquireBoardMapper.getListWithPaging(cri);
    }

    @Override
    public Long register(InquireBoardVO vo) {
        inquireBoardMapper.insertSelectKey(vo);
        return vo.getBno();
    }

    @Override
    public InquireBoardVO get(Long bno) {
        return inquireBoardMapper.read(bno);
    }

    @Override
    public boolean delete(Long bno) {
        return inquireBoardMapper.getDelete(bno) == 1;
    }

    @Override
    public int modify(InquireBoardVO bVo) {
        return inquireBoardMapper.update(bVo);
    }

    @Override
    public int getTotalCount(InquireCriteria cri) {
        return inquireBoardMapper.getTotalCount(cri);
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
    public int BoardViewCount(Long bno) {
        return inquireBoardMapper.BoardViewCount(bno);
    }

    @Override
    public List<InquireBoardVO> notice() throws Exception {
        return inquireBoardMapper.notice();
    }
}
