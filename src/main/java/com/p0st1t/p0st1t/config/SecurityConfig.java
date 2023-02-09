package com.p0st1t.p0st1t.config;

import com.p0st1t.p0st1t.jwt.JwtAuthenticationEntryPoint;
import com.p0st1t.p0st1t.jwt.JwtAuthenticationFilter;
import com.p0st1t.p0st1t.jwt.TokenProvider;
import lombok.RequiredArgsConstructor;
import org.apache.tomcat.util.http.LegacyCookieProcessor;
import org.springframework.boot.web.embedded.tomcat.TomcatServletWebServerFactory;
import org.springframework.boot.web.server.WebServerFactoryCustomizer;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {

    private final TokenProvider tokenProvider;
    private final JwtAuthenticationEntryPoint jwtAuthenticationEntryPoint;

    @Bean
    AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public WebSecurityCustomizer configure() {
        return (web) -> web.ignoring().antMatchers(
                "/h2-console/**",
                "/favicon.ico",
                "/error"
        );
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
                .csrf().disable()
                .httpBasic().disable()
                .exceptionHandling()
                .accessDeniedPage("/WEB-INF/view/error/4xx.jsp")
                .authenticationEntryPoint(jwtAuthenticationEntryPoint)
                .and()
                .sessionManagement()
                .sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .authorizeRequests()
                .antMatchers("/").permitAll()
                .antMatchers("/user/signup").permitAll()
                .antMatchers("/user/login").permitAll()
                .antMatchers("/user/findPwd").permitAll()
                .antMatchers("/user/modifyEmail").permitAll()
                .antMatchers("/index").permitAll()
                .antMatchers("/emailCheck").permitAll()
                .antMatchers("/nicknameCheck").permitAll()
                .antMatchers("/confirm-email").permitAll()
                .antMatchers("/emailToken").permitAll()
                .antMatchers("/resendEmail").permitAll()
                .antMatchers("/isEmailAuth").permitAll()
                .antMatchers("/certinfo/**").permitAll()
                .antMatchers("/noticeboard/list").permitAll()
                .antMatchers("/freeboard/list").permitAll()
                .antMatchers("/qnaboard/list").permitAll()
                .antMatchers("/reviewboard/list").permitAll()
                .antMatchers("/inquireboard/list").permitAll()
                .antMatchers("/noticeboard/get").permitAll()
                .antMatchers("/freeboard/get").permitAll()
                .antMatchers("/qnaboard/get").permitAll()
                .antMatchers("/reviewboard/get").permitAll()
                .antMatchers("/inquireboard/get").permitAll()
                .antMatchers("/resources/**").permitAll()
                .antMatchers("/replies/pages/**").permitAll()
                .antMatchers("/replies/cnt").permitAll()
                .antMatchers("/replies/new").permitAll()
                .antMatchers("/privacyAgree.jsp").permitAll()
                .antMatchers("/marketingAgree.jsp").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/about").permitAll()
                .anyRequest().authenticated()
                .and()
                .addFilterBefore(jwtAuthenticationFilter(), UsernamePasswordAuthenticationFilter.class);
        return http.build();
    }

    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter(tokenProvider);
    }

    @Bean
    public WebServerFactoryCustomizer<TomcatServletWebServerFactory> cookieProcessorCustomizer() {
        return (factory) -> factory
                .addContextCustomizers((context) -> context.setCookieProcessor(new LegacyCookieProcessor()));
    }


}
