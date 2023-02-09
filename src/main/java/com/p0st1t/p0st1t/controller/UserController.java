package com.p0st1t.p0st1t.controller;

import com.p0st1t.p0st1t.board.myBoard.domain.PageDTO;
import com.p0st1t.p0st1t.board.myBoard.domain.ProfileCriteria;
import com.p0st1t.p0st1t.board.myBoard.service.MyBoardService;
import com.p0st1t.p0st1t.dto.LoginDto;
import com.p0st1t.p0st1t.dto.UserDto;
import com.p0st1t.p0st1t.entity.User;
import com.p0st1t.p0st1t.service.CertificationService;
import com.p0st1t.p0st1t.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
@Slf4j
public class UserController {

    private final UserService userService;
    private final MyBoardService myBoardService;
    private final CertificationService certificationService;


    @GetMapping("/signup")
    public String signupForm(@ModelAttribute UserDto userDto) {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@Valid @ModelAttribute UserDto userDto, BindingResult bindingResult) {

        if (bindingResult.hasErrors()) {
            return "signup";
        }
        try {
            userService.signup(userDto);
        } catch (RuntimeException e) {
            bindingResult.addError(new FieldError("userDto", "email", e.getMessage()));
        }
        if (bindingResult.hasErrors()) {
            return "signup";
        }

        return "emailToken";
    }


    @GetMapping("/login")
    public String loginForm(@ModelAttribute LoginDto loginDto) {
        return "login";
    }

    @PostMapping("/login")
    public String login(@Valid @ModelAttribute LoginDto loginDto, BindingResult bindingResult, HttpServletResponse response, @RequestParam(required = false) String redirectURL) {
        if (redirectURL == null) {
            try {
                if (userService.login(loginDto, response)) {
                    return "redirect:/index";
                }
            } catch (Exception e) {
                bindingResult.addError(new FieldError("loginDto", "email", e.getMessage()));
                return "login";
            }
            return "emailToken";
        } else {
            try {
                if (userService.login(loginDto, response)) {
                    return "redirect:" + redirectURL;
                }
            } catch (Exception e) {
                bindingResult.addError(new FieldError("loginDto", "email", e.getMessage()));
                return "login";
            }
            return "emailToken";
        }

    }


    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response) {

        Cookie[] cookies = request.getCookies();

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                log.info("cookie={}", cookie);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                cookie.setHttpOnly(true);
                cookie.setSecure(true);
                response.addCookie(cookie);
            }
        }
        log.info("deletecookie");

        return "redirect:/";
    }

    @GetMapping("/findPwd")
    public String findPwdForm() {
        return "findPwd";
    }

    @PostMapping("/findPwd")
    @ResponseBody
    public boolean findPwd(@RequestParam String email) {
        if (userService.findPwd(email)) {
            return true;
        }
        return false;
    }

    @GetMapping("/profile")
    public String getProfile(Model model, @AuthenticationPrincipal User user, ProfileCriteria cri, @RequestParam(required = false) String isBoardList, @RequestParam(required = false) String isReplyList) {
        model.addAttribute("user", user);
        model.addAttribute("isBoardList", isBoardList);
        model.addAttribute("isReplyList", isReplyList);
        model.addAttribute("blist", myBoardService.getListWithPaging(user.getUserId(), cri));
        model.addAttribute("rlist", myBoardService.getRepListWithPaging(user.getUserId(), cri));
        int bTotal = myBoardService.getTotalCount(user.getUserId());
        int rTotal = myBoardService.getTotalRepCount(user.getUserId());
        model.addAttribute("bpageMaker", new PageDTO(cri, bTotal));
        model.addAttribute("rpageMaker", new PageDTO(cri, rTotal));
        return "profile";
    }

    @GetMapping("/checkCert")
    public String checkCert() {
        return "checkCert";
    }

    @PostMapping("/checkPwd")
    @ResponseBody
    public boolean checkPwd(@RequestParam String pwd, @AuthenticationPrincipal User user) {
        log.info("pwd={}", pwd);
        return userService.checkPwd(pwd, user);
    }

    @PostMapping("/modifyProfile")
    @ResponseBody
    @ResponseStatus(value = HttpStatus.OK)
    public String modifyProfile(@ModelAttribute UserDto userDto, @AuthenticationPrincipal User user) {
        userService.modifyProfile(userDto, user);
        return "ok";
    }

    @GetMapping("/modifyEmail")
    public String modifyEmail(@RequestParam String email, @RequestParam String newEmail) {
        if (userService.modifyEmail(email, newEmail)) {
            return "modEmailSuccess";
        }
        return "modEmailFailed";
    }

    @PostMapping("/modifyPwd")
    @ResponseBody
    public boolean modifyProfile(@RequestParam String oldPwd, @RequestParam String newPwd, @AuthenticationPrincipal User user) {
        return userService.modifyPwd(oldPwd, newPwd, user);
    }

    @GetMapping("/singout")
    @ResponseBody
    public String singout(@AuthenticationPrincipal User user) {
        if (certificationService.signout(user.getUserId()) > 0) {
            return "탈퇴가 완료되었습니다.";
        }
        return "오류가 발생했습니다.";
    }
}
