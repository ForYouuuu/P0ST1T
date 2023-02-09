package com.p0st1t.p0st1t.service;

import com.p0st1t.p0st1t.dto.*;
import com.p0st1t.p0st1t.mapper.CertificationMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CertificationService {

    private final CertificationMapper mapper;

    public List<CertificationVO> getList() {
        return mapper.getList();
    }

    public List<CertificationVO> getSearchList(String search) {
        return mapper.getSearchList(search);
    }

    public List<CertificationVO> getTagList(String[] areaList, String[] gradeList) {
        return mapper.getTagList(areaList, gradeList);
    }

    public CertificationVO getCertById(int id) {
        return mapper.getCertById(id);
    }

    public List<CertEligibilityVO> getCertEligibility(String grade) {
        return mapper.getCertEligibility(grade);
    }

    public List<CertScheduleVO> getCertSchedule(String grade) {
        return mapper.getCertSchedule(grade);
    }

    public List<PilgiSubjectVO> getPilgiSubject(String qname) {
        return mapper.getPilgiSubject(qname);
    }

    public SilgiSubjectVO getSilgiSubject(int id) {
        return mapper.getSilgiSubject(id);
    }

    public String findQid(String qname) {
        return mapper.findQid(qname);
    }

    public int saveCfirm(Long userId, String qid) {
        return mapper.saveCfirm(userId, qid);
    }

    public List<UserCfirm> getUserCfirm(Long userId) {
        return mapper.getUserCfirm(userId);
    }

    @Transactional
    public int signout(Long userId) {
        mapper.signout(userId);
        return mapper.signout2(userId);
    }

}
