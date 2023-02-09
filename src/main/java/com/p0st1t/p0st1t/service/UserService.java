package com.p0st1t.p0st1t.service;

import com.p0st1t.p0st1t.dto.LoginDto;
import com.p0st1t.p0st1t.dto.UserDto;
import com.p0st1t.p0st1t.entity.EmailToken;
import com.p0st1t.p0st1t.entity.User;
import com.p0st1t.p0st1t.jwt.TokenProvider;
import com.p0st1t.p0st1t.mail.service.EmailSendService;
import com.p0st1t.p0st1t.repository.EmailTokenRepository;
import com.p0st1t.p0st1t.repository.UserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.UUID;

@Service
@Slf4j
public class UserService {

    private final UserRepository userRepository;
    private final EmailTokenRepository emailTokenRepository;
    private final EmailSendService emailSendService;
    private final TokenProvider tokenProvider;
    private final PasswordEncoder passwordEncoder;

    public UserService(UserRepository userRepository, EmailTokenRepository emailTokenRepository, EmailSendService emailSendService, TokenProvider tokenProvider, PasswordEncoder passwordEncoder) {
        this.userRepository = userRepository;
        this.emailTokenRepository = emailTokenRepository;
        this.emailSendService = emailSendService;
        this.tokenProvider = tokenProvider;
        this.passwordEncoder = passwordEncoder;
    }

    @Transactional
    public void signup(UserDto userDto) {
        if (userRepository.findByEmail(userDto.getEmail()).orElse(null) != null) {
            throw new RuntimeException("이미 가입되어 있는 유저입니다.");
        }

        User user = User.builder()
                .email(userDto.getEmail())
                .password(passwordEncoder.encode(userDto.getPassword()))
                .name(userDto.getName())
                .nickname(userDto.getNickname())
                .auth(false)
                .roles(Collections.singletonList("ROLE_USER"))
                .build();

        userRepository.save(user);

        sendEmailToken(userDto.getEmail());

    }


    public boolean login(LoginDto loginDto, HttpServletResponse response) {
        User user = userRepository.findByEmail(loginDto.getEmail()).orElseThrow(() -> new IllegalArgumentException("아이디 또는 비밀번호가 일치하지 않습니다."));
        if (!passwordEncoder.matches(loginDto.getPassword(), user.getPassword())) {
            throw new IllegalArgumentException("아이디 또는 비밀번호가 일치하지 않습니다.");
        }
        if (user.isAuth()) {
            String accessToken = tokenProvider.createAccessToken(user.getUsername(), user.getRoles());
            String refreshToken = tokenProvider.createRefreshToken(user.getUsername(), user.getRoles());

            Cookie cookie1 = new Cookie("accessToken", "Bearer " + accessToken);
            cookie1.setPath("/");
            cookie1.setMaxAge(60 * 60 * 24);
            cookie1.setHttpOnly(true);
            cookie1.setSecure(true);
            response.addCookie(cookie1);

            Cookie cookie2 = new Cookie("refreshToken", "Bearer " + refreshToken);
            cookie2.setPath("/");
            cookie2.setMaxAge(60 * 60 * 24);
            cookie2.setHttpOnly(true);
            cookie2.setSecure(true);
            response.addCookie(cookie2);

            return true;
        }
        return false;
    }

    public boolean emailCheck(String email) {
        if (userRepository.findByEmail(email).orElse(null) == null) {
            return true;
        } else return false;
    }

    public boolean nicknameCheck(String nickname) {
        if (userRepository.findByNickname(nickname).orElse(null) == null) {
            return true;
        } else return false;
    }

    @Transactional
    public void sendEmailToken(String email) {
        EmailToken emailToken =
                EmailToken.builder()
                        .id(passwordEncoder.encode(email))
                        .expTime(LocalDateTime.now().plusMinutes(15L))
                        .userId(email)
                        .build();

        log.info("saveEmailtoken");
        emailTokenRepository.save(emailToken);

        String link = "https://p0st1t.com/confirm-email?emailTokenId=" + emailToken.getId() + "&email=" + email;
        emailSendService.sendMail(link, email);

    }

    @Transactional
    public boolean verifyEmail(String emailTokenId) {
        EmailToken emailToken = emailTokenRepository.findByIdAndExpTimeAfter(emailTokenId, LocalDateTime.now()).orElse(null);
        if (emailToken == null) {
            return false;
        }
        String userId = emailToken.getUserId();
        User user = userRepository.findByEmail(userId).get();
        user.setAuth(true);
        userRepository.save(user);

        return true;
    }

    public boolean isEmailAuth(String email) {
        User user = userRepository.findByEmail(email).orElse(null);
        if (user.isAuth()) {
            return true;
        }
        return false;
    }

    public void resendEmailToken(String email) {
        sendEmailToken(email);
    }


    public boolean findPwd(String email) {
        User user = userRepository.findByEmail(email).orElse(null);

        if (user != null) {
            String tempPwd = UUID.randomUUID().toString().replace("-", "");
            tempPwd = tempPwd.substring(0, 10);

            emailSendService.sendPwdMail(tempPwd, email);
            user.setPassword(passwordEncoder.encode(tempPwd));
            userRepository.save(user);

            return true;
        }

        return false;
    }

    public boolean checkPwd(String pwd, User user) {
        if (passwordEncoder.matches(pwd, user.getPassword())) {
            return true;
        }
        return false;
    }

    @Transactional
    public void modifyProfile(UserDto userDto, User user) {
        System.out.println(userDto.getEmail() != user.getEmail());
        if (!userDto.getEmail().equals(user.getEmail())) {
            //변경 메일 보내야됨
            emailSendService.sendModMail(user.getEmail(), userDto.getEmail());
        }
        user.setNickname(userDto.getNickname());
        user.setName(userDto.getName());
        userRepository.save(user);
    }

    @Transactional
    public boolean modifyEmail(String email, String newEmail) {
        User user = userRepository.findByEmail(email).orElse(null);
        if (user != null) {
            user.setEmail(newEmail);
            userRepository.save(user);
            return true;
        }
        return false;
    }

    public String findNicknameById(Long userId) {
        return userRepository.findByUserId(userId).orElse(null).getNickname();
    }

    @Transactional
    public boolean modifyPwd(String oldPwd, String newPwd, User user) {
        if (checkPwd(oldPwd, user)) {
            user.setPassword(passwordEncoder.encode(newPwd));
            userRepository.save(user);
            return true;
        }
        return false;
    }

}
