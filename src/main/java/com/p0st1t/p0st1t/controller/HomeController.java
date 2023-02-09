package com.p0st1t.p0st1t.controller;

import com.p0st1t.p0st1t.board.myBoard.service.MyBoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.time.LocalDateTime;
import java.util.Date;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final MyBoardService service;

    @GetMapping("/")
    public String redirectHome() {
        System.out.println(LocalDateTime.now().plusMinutes(1L));
        return "redirect:/index";
    }

    @GetMapping("/index")
    public String home(Model model) {
        model.addAttribute("boardCnt", service.getBoardCnt());
        model.addAttribute("userCnt", service.getUserCnt());
        return "index";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }
}
