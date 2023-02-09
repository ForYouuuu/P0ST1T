package com.p0st1t.p0st1t.board.freeboard.mapper;

import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.Map;

@RequiredArgsConstructor
public class LikeMapperImpl implements LikeMapper {
    private final SqlSession sqlSession;

    @Override
    public void insertLike(Long bno, String id) {
        Map<String, Object> map = new HashMap<>();
        map.put("Id", id);
        map.put("bno", bno);
        sqlSession.insert("likeMapper.insertLike", map);
    }

    @Override
    public void deleteLike(Long bno, String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("Id", id);
        map.put("bno", bno);
        sqlSession.delete("likeMapper.deleteLike", map);
    }

    @Override
    public int alreadyLike(Long bno, String id) {
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("Id", id);
        map.put("bno", bno);
        return sqlSession.selectOne("likeMapper.alreadyLike", map);
    }

    @Override
    public void likePlus(Long bno) {
        sqlSession.update("likeMapper.likePlus", bno);
    }

    @Override
    public void likeMinus(Long bno) {
        sqlSession.update("likeMapper.likeMinus", bno);
    }
}
