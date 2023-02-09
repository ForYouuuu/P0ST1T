package com.p0st1t.p0st1t.board.admin.service;

import com.p0st1t.p0st1t.board.admin.domain.AdminVO;
import com.p0st1t.p0st1t.board.admin.domain.Criteria;
import org.springframework.validation.Errors;

import java.util.List;
import java.util.Map;

public interface AdminService {
    //  public List<AdminVO> getList(Criteria cri);
    public List<AdminVO> getListWithPaging(Criteria cri);
    public int getTotalCount(Criteria cri);
    public int viewCount(Long bno);
    public Map<String, String> validateHandling(Errors errors);
    public void delete(String bno);
    public List<AdminVO> isMemberTest(Criteria cri);
    public void userDelete(String user_id);
    public AdminVO get(Long bno);
    public int getUserCount(Criteria cri);

}
