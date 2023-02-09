package com.p0st1t.p0st1t.mail.service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

@Service
@RequiredArgsConstructor
@Slf4j
public class EmailSendService {

    private final JavaMailSender javaMailSender;

    @Async
    public void sendMail(String link, String email) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("[P0ST 1T] 가입 인증 메일입니다.");
            String htmlMsg = "<div style=margin:0;padding:0>"
                    +"<h3>인증링크 안내입니다.</h3>"
                    +"<div>아래 버튼을 클릭해서 회원가입을 완료해주세요.</div>"
                    +"<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\""+link+"\">"
	                +"<p style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #02b875; line-height: 45px; vertical-align: middle; font-size: 16px;\">메일 인증</p>"
	                +"</a>"
                    +"</div>";
            messageHelper.setText(htmlMsg, true);
            messageHelper.setTo(email);


        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        javaMailSender.send(message);
    }

    @Async
    public void sendPwdMail(String tempPwd, String email) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("[P0ST 1T] 임시 비밀번호입니다.");
            String htmlMsg = "<div style=margin:0;padding:0>"
                    +"<h3>임시 비밀번호 발급 안내</h3>"
                    +"<div>발급된 임시 비밀번호로 로그인 후 마이페이지 메뉴에서 비밀번호를 변경해주세요.</div>"
                    +"<div>임시 비밀번호 : "+tempPwd+"</div></div>";
            messageHelper.setText(htmlMsg, true);
            messageHelper.setTo(email);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        javaMailSender.send(message);
    }

    @Async
    public void sendModMail(String email, String newEmail) {
        MimeMessage message = javaMailSender.createMimeMessage();
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
            messageHelper.setSubject("[P0ST 1T] 이메일 변경 링크입니다.");
            String htmlMsg =  "<div style=margin:0;padding:0>"
                    +"<h3>이메일 변경 링크입니다.</h3>"
                    +"<div>아래 버튼을 클릭시 이메일이 변경됩니다.</div>"
                    +"<div>본인의 요청이 아닌경우 POST 1T에 문의해주세요.</div>"
                    +"<a style=\"color: #FFF; text-decoration: none; text-align: center;\" href=\"https://p0st1t.com/user/modifyEmail?email="+email+"&newEmail="+newEmail+"\">"
                    +"<p style=\"display: inline-block; width: 210px; height: 45px; margin: 30px 5px 40px; background: #02b875; line-height: 45px; vertical-align: middle; font-size: 16px;\">메일 변경</p>"
                    +"</a>"
                    +"</div>";
            messageHelper.setText(htmlMsg, true);
            messageHelper.setTo(newEmail);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
        javaMailSender.send(message);
    }
}
