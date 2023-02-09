package com.p0st1t.p0st1t.board.admin.controller;

import com.p0st1t.p0st1t.board.admin.domain.Criteria;
import com.p0st1t.p0st1t.board.admin.domain.PageDTO;
import com.p0st1t.p0st1t.board.admin.service.AdminService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequiredArgsConstructor
@Log4j2
@RequestMapping("/admin/*")
public class AdminController {

    private final AdminService service;


    @GetMapping("/boardlist")
    public void adminlist(Model model, Criteria cri) throws Exception {
        model.addAttribute("list", service.getListWithPaging(cri));
        int total = service.getTotalCount(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }

    @GetMapping("/userlist")
    public void testInfo(Model model, Criteria cri) {
        model.addAttribute("user", service.isMemberTest(cri));
        int total = service.getUserCount(cri);
        model.addAttribute("pageMaker", new PageDTO(cri, total));

    }

    @RequestMapping(value = "/delete")
    public String ajaxTest(HttpServletRequest request, Criteria cri) {

        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for (int i = 0; i < size; i++) {
            service.delete(ajaxMsg[i]);
        }
        return "redirect:boardlist" + cri.getListLink();
    }

    @RequestMapping(value = "/userDelete")
    public String ajaxTest2(HttpServletRequest request, Criteria cri) {
        String[] ajaxMsg = request.getParameterValues("valueArr");
        int size = ajaxMsg.length;
        for (int i = 0; i < size; i++) {
            service.userDelete(ajaxMsg[i]);
        }
        return "redirect:userlist";
    }

    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, Model model, @ModelAttribute("cri") Criteria cri) {
        model.addAttribute("list", service.getListWithPaging(cri));
        model.addAttribute("vo", service.get(bno));
        int total = service.getTotalCount(cri);
        service.viewCount(bno);
        model.addAttribute("pageMaker", new PageDTO(cri, total));
    }


}
