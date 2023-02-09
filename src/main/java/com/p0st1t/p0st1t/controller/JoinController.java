package com.p0st1t.p0st1t.controller;

import com.p0st1t.p0st1t.entity.User;
import com.p0st1t.p0st1t.service.UserService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@RequiredArgsConstructor
@Controller
@Slf4j
public class JoinController {

    private final UserService userService;

    @PostMapping("/emailCheck")
    @ResponseBody
    public boolean emailCheck(String email) {
        return userService.emailCheck(email);
    }

    @PostMapping("/nicknameCheck")
    @ResponseBody
    public boolean nicknameCheck(String nickname) {
        return userService.nicknameCheck(nickname);
    }


    @GetMapping("/confirm-email")
    public String confirmEmail(@RequestParam String emailTokenId, @RequestParam String email, Model model) {
        if (userService.verifyEmail(emailTokenId)) {
            return "emailSuccess";
        }
        model.addAttribute("email", email + "'");
        return "emailFailed";
    }

    @PostMapping("/resendEmail")
    public String resendEmailToken(@RequestParam String email) {
        log.info("email={}", email);
        userService.resendEmailToken(email);
        return "emailToken";
    }


    @PostMapping("/isEmailAuth")
    @ResponseBody
    public boolean isEmailAuth(@RequestParam String email) {
        Boolean emailAuth = userService.isEmailAuth(email);
        if (emailAuth) {
            return true;
        }
        return false;
    }


}
