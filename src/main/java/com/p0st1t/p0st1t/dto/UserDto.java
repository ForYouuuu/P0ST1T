package com.p0st1t.p0st1t.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class UserDto {

    @Email
    @Pattern(regexp = "^(([^<>()\\[\\]\\.,;:\\s@\\\"]+(\\.[^<>()\\[\\]\\.,;:\\s@\\\"]+)*)|(\\\".+\\\"))@(([^<>()\\[\\]\\.,;:\\s@\\\"]+\\.)+[^<>()\\[\\]\\.,;:\\s@\\\"]{2,})$", message = "이메일 형식이 올바르지 않습니다.")
    private String email;

    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    @Pattern(regexp = "^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\\\(\\\\)\\-_=+])(?!.*[^a-zA-z0-9$`~!@$!%*#^?&\\\\(\\\\)\\-_=+]).{8,16}$", message = "비밀번호 조건 불만족")
    private String password;

    @NotNull
    @Size(min=1, max=10)
    private String name;

    @NotNull
    @Size(min = 2, max = 12)
    private String nickname;


}
