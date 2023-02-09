package com.p0st1t.p0st1t.jwt;


import lombok.RequiredArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@RequiredArgsConstructor
public class JwtAuthenticationFilter extends OncePerRequestFilter {

    private final TokenProvider tokenProvider;


    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String accessToken = tokenProvider.resolveAccessToken((HttpServletRequest) request);
        String refreshToken = tokenProvider.resolveRefreshToken((HttpServletRequest) request);

        try {
            if (accessToken != null && tokenProvider.validateToken(accessToken)) {
                Authentication authentication = tokenProvider.getAuthentication(accessToken);
                System.out.println(authentication.getPrincipal());
                SecurityContextHolder.getContext().setAuthentication(authentication);
            } else if (refreshToken != null && tokenProvider.validateToken(refreshToken)) {
                String userPk = tokenProvider.getUserPk(refreshToken);
                List<String> roles = tokenProvider.getRoles(refreshToken);
                String newAccessToken = tokenProvider.createAccessToken(userPk, roles);
                Authentication authentication = tokenProvider.getAuthentication(newAccessToken);

                Cookie cookie = new Cookie("accessToken", "Bearer " + newAccessToken);
                cookie.setPath("/");
                cookie.setMaxAge(60 * 60 * 24);
                cookie.setHttpOnly(true);
                cookie.setSecure(true);
                response.addCookie(cookie);
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        } catch (UsernameNotFoundException e) {
            Cookie[] cookies = request.getCookies();

            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    cookie.setMaxAge(0);
                    cookie.setPath("/");
                    cookie.setHttpOnly(true);
                    cookie.setSecure(true);
                    response.addCookie(cookie);
                }
            }
            response.sendRedirect("/");
            return;
        }
        filterChain.doFilter(request, response);
    }
}
