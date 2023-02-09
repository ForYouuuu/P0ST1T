package com.p0st1t.p0st1t.board.admin.service;

import com.p0st1t.p0st1t.board.admin.domain.AdminVO;
import com.p0st1t.p0st1t.board.admin.domain.Criteria;
import com.p0st1t.p0st1t.board.admin.mapper.AdminMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.FieldError;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService {
    private final AdminMapper adminMapper;

    @Override
    public AdminVO get(Long bno) {
        return adminMapper.read(bno);
    }

    @Override
    public List<AdminVO> getListWithPaging(Criteria cri) {
        return adminMapper.getListWithPaging(cri);
    }


    @Override
    public int getTotalCount(Criteria cri) {
        return adminMapper.getTotalCount(cri);
    }

    @Override
    public int getUserCount(Criteria cri) {
        return adminMapper.getUserCount(cri);
    }

    @Override
    public int viewCount(Long bno) {
        return adminMapper.BoardViewCount(bno);
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
    public void delete(String bno) {
        adminMapper.delete(bno);
    }

    @Override
    public List<AdminVO> isMemberTest(Criteria cri) {
        return adminMapper.isMember(cri);
    }

    @Override
    public void userDelete(String user_id) {
        adminMapper.userDelete(user_id);
    }


}
