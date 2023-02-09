package com.p0st1t.p0st1t.board.freeboard.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface LikeMapper {

    public void insertLike(Long bno, String id);
    public void deleteLike(Long bno, String id);
    public int alreadyLike(Long bno, String id);
    public void likePlus(Long bno);
    public void likeMinus(Long bno);
}
