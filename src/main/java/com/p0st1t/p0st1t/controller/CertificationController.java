package com.p0st1t.p0st1t.controller;

import com.p0st1t.p0st1t.dto.CertificationVO;
import com.p0st1t.p0st1t.entity.User;
import com.p0st1t.p0st1t.service.CertificationService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/certinfo")
public class CertificationController {

    private final CertificationService service;

    @GetMapping("/list")
    public String list(@RequestParam(value = "tag", defaultValue = "") String tag, Model model) {
        log.info("tag={}", tag);
        model.addAttribute("tag", tag);
        model.addAttribute("list", service.getList());
        model.addAttribute("professional", service.getCertSchedule("기술사"));
        model.addAttribute("engineer", service.getCertSchedule("기사"));
        model.addAttribute("industrial", service.getCertSchedule("산업기사"));
        model.addAttribute("craftsman", service.getCertSchedule("기능사"));
        return "certList";
    }

    @GetMapping("/searchList")
    @ResponseBody
    public List<CertificationVO> searchList(@RequestParam String search) {
        return service.getSearchList(search);
    }

    @GetMapping("/tagList")
    @ResponseBody
    public List<CertificationVO> tagList(@RequestParam(value = "areaList[]", defaultValue = "", required = false) String[] areaList, @RequestParam(value = "gradeList[]", defaultValue = "", required = false) String[] gradeList) {
        return service.getTagList(areaList, gradeList);
    }

    @GetMapping("/details/{id}")
    public String getDetails(@PathVariable("id") int id, Model model) {
        CertificationVO cert = service.getCertById(id);
        model.addAttribute("cert", cert);
        model.addAttribute("eligibility", service.getCertEligibility(cert.getGrade()));
        model.addAttribute("schedule", service.getCertSchedule(cert.getGrade()));
        model.addAttribute("pilgi", service.getPilgiSubject(cert.getQname()));
        log.info("qname={}", cert.getQname());
        log.info("pilgi={}", service.getPilgiSubject(cert.getQname()));
        model.addAttribute("silgi", service.getSilgiSubject(cert.getId()));
        return "certDetails";
    }

    @PostMapping("/saveCfirm")
    @ResponseBody
    public int saveCfirm(@AuthenticationPrincipal User user, @RequestParam String qname) {
        log.info("qname={}", qname);
        String qid = service.findQid(qname);
        return service.saveCfirm(user.getUserId(), qid);
    }

}
