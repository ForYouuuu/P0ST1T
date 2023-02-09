package com.p0st1t.p0st1t.entity;

import lombok.*;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "t_emailtoken")
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class EmailToken {

    @Column(name = "id", length = 100, unique = true)
    private String id;

    @Column(name = "exp_time")
    private LocalDateTime expTime;

    @Id
    @Column(name = "user_id", length = 50)
    private String userId;

}
