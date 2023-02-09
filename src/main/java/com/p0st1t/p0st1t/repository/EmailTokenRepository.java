package com.p0st1t.p0st1t.repository;

import com.p0st1t.p0st1t.entity.EmailToken;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDateTime;
import java.util.Optional;

@Repository
public interface EmailTokenRepository extends JpaRepository<EmailToken, String> {
    Optional<EmailToken> findByIdAndExpTimeAfter(String emailTokenId, LocalDateTime now);
}
