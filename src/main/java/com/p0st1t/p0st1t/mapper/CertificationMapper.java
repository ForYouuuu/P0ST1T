package com.p0st1t.p0st1t.mapper;

import com.p0st1t.p0st1t.dto.*;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CertificationMapper {

    public List<CertificationVO> getList();

    public List<CertificationVO> getSearchList(String search);

    public List<CertificationVO> getTagList(String[] areaList, String[] gradeList);

    public CertificationVO getCertById(int id);

    public List<CertEligibilityVO> getCertEligibility(String grade);

    public List<CertScheduleVO> getCertSchedule(String grade);

    public List<PilgiSubjectVO> getPilgiSubject(String qname);

    public SilgiSubjectVO getSilgiSubject(int id);

    public String findQid(String qname);

    public int saveCfirm(Long userId, String qid);

    public List<UserCfirm> getUserCfirm(Long userId);

    public void signout(Long userId);
    public int signout2(Long userId);
}
