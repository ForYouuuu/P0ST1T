package com.p0st1t.p0st1t.board.freeboard.controller;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.freeboard.domain.FreeBoardVO;
import com.p0st1t.p0st1t.board.freeboard.domain.PageDTO;
import com.p0st1t.p0st1t.board.freeboard.service.FreeBoardService;
import com.p0st1t.p0st1t.board.freeboard.service.LikeService;
import com.p0st1t.p0st1t.entity.User;
import com.p0st1t.p0st1t.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/freeboard/*")
public class FreeBoardController {

    private final FreeBoardService service;
    private final LikeService service2;

    @GetMapping("/list")
    public void list(Model model, Criteria cri) throws Exception {
        log.info("list. . .");
        log.info("[" + cri.getType() + "]");

        model.addAttribute("list", service.getListWithPaging(cri));
        int total = service.getTotalCount(cri);

        log.info(total);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
        model.addAttribute("notice", service.notice()); // 공지사항 출력
    }

    @GetMapping("/register")
    public void register(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("user", user);
    }

    @PostMapping("/register")  // 유효성 추가
    public String afterRegister(@Valid FreeBoardVO freeBoardVO, Errors errors, Model model, @AuthenticationPrincipal User user) {
        if (errors.hasErrors()) {
            model.addAttribute("boardVO", freeBoardVO); //실패시 입력 데이터 유지
            model.addAttribute("user", user);
            // 유효성 통과 못한 필드와 메시지를 핸들링
            Map<String, String> validatorResult = service.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            return "/freeboard/register";
        }     //Errors 객체 VO에 binding된 필드의 유효성 검사오류에 대한 정보를  errors.hasErrors 저장하고 노출
        freeBoardVO.setWriterid(user.getUserId());
        service.register(freeBoardVO);
        return "redirect:/freeboard/list?sort=";
    }


    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri, @AuthenticationPrincipal User user) throws Exception {


        model.addAttribute("vo", service.get(bno));
        model.addAttribute("user", user);
        model.addAttribute("list", service.getListWithPaging(cri));
        if (user != null) {
            int isLIke = service2.alreadyLike(bno, Long.toString(user.getUserId()));
            if (isLIke > 0) {
                model.addAttribute("isLiked", true);
            }
        }
        int total = service.getTotalCount(cri);
        service.viewCount(bno);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

    }

    @PostMapping("/modify")
    public String modify(@Valid FreeBoardVO bVo, Errors errors, RedirectAttributes ras, @ModelAttribute("cri") Criteria cri, Model model, @AuthenticationPrincipal User user) {
        log.info("modify..." + bVo);
        int cnt = 0;

        if (bVo.getWriterid() == user.getUserId()) {
            cnt = service.modify(bVo);
        }

        if (errors.hasErrors()) {
            model.addAttribute("vo", bVo);

            // 유효성 통과 못한 필드와 메시지 핸들링
            Map<String, String> validatorResult = service.validateHandling(errors);
            for (String key : validatorResult.keySet()) {
                model.addAttribute(key, validatorResult.get(key));
            }
            return "/freeboard/modify";
        }
        if (cnt == 1) {
            ras.addFlashAttribute("result", "수정 성공");
        }
        return "redirect:/freeboard/list" + cri.getListLink();
    }

    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, RedirectAttributes ras, @ModelAttribute("cri") Criteria cri, @AuthenticationPrincipal User user) {
        log.info("remove...");
        boolean result = false;
        if (service.get(bno).getWriterid() == user.getUserId()) {
            result = service.delete(bno);
        }
        if (result) {
            ras.addFlashAttribute("result", "삭제 성공");
        }
        return "redirect:/freeboard/list" + cri.getListLink();
    }

    @ResponseBody
    @RequestMapping(value = "/get", method = RequestMethod.POST)
    public int updateLike(Long bno, String id) throws Exception {

        int likeCheck = service2.alreadyLike(bno, id);
        if (likeCheck == 0) {
            //좋아요 처음누름
            service2.insertLike(bno, id); //like테이블 삽입
            service2.plusLike(bno);
        } else if (likeCheck == 1) {
            service2.deleteLike(bno, id); //like테이블 삭제
            service2.minusLike(bno);
        }
        return likeCheck;
    }


}
