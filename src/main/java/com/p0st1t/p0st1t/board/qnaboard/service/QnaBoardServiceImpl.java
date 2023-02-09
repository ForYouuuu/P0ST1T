package com.p0st1t.p0st1t.board.qnaboard.service;


import com.p0st1t.p0st1t.board.qnaboard.domain.QnaBoardVO;
import com.p0st1t.p0st1t.board.qnaboard.domain.QnaCriteria;
import com.p0st1t.p0st1t.board.qnaboard.mapper.QnaBoardMapper;
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
public class QnaBoardServiceImpl implements QnaBoardService {


    private final QnaBoardMapper qnaBoardMapper;

    @Override
    public List<QnaBoardVO> getList(QnaCriteria cri) {
        return qnaBoardMapper.getListWithPaging(cri);
    }


    @Override
    public List<QnaBoardVO> getListWithPaging(QnaCriteria cri) {
        return qnaBoardMapper.getListWithPaging(cri);
    }

    @Override
    public Long register(@Valid QnaBoardVO vo) {
        qnaBoardMapper.insertSelectKey(vo);
        return vo.getBno();
    }

    @Override
    public QnaBoardVO get(Long bno) {
        return qnaBoardMapper.read(bno);
    }

    @Override
    public boolean delete(Long bno) {
        return qnaBoardMapper.getDelete(bno) == 1;
    }

    @Override
    public int modify(@Valid QnaBoardVO bVo) {
        return qnaBoardMapper.update(bVo);
    }


    @Override
    public int getTotalCount(QnaCriteria cri) {
        return qnaBoardMapper.getTotalCount(cri);
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
        return qnaBoardMapper.BoardViewCount(bno);
    }

    @Override
    public List<QnaBoardVO> notice() throws Exception {
        return qnaBoardMapper.notice();
    }
}
