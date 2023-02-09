package com.p0st1t.p0st1t.board.freeboard.service;


import com.p0st1t.p0st1t.board.freeboard.mapper.LikeMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class LikeServiceImpl implements LikeService {
    private final LikeMapper mapper;


    @Override
    public void insertLike(Long bno, String id) throws Exception {
        mapper.insertLike(bno, id);
    }

    @Override
    public void deleteLike(Long bno, String id) throws Exception {
        mapper.deleteLike(bno, id);
    }

    @Override
    public int alreadyLike(Long bno, String id) throws Exception {
        return mapper.alreadyLike(bno, id);
    }

    @Override
    public void plusLike(Long bno) throws Exception {
        mapper.likePlus(bno);
    }

    @Override
    public void minusLike(Long bno) throws Exception {
        mapper.likeMinus(bno);
    }
}
