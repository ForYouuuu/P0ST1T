package com.p0st1t.p0st1t.board.freeboard.service;

public interface LikeService {

    public void insertLike(Long bno, String id) throws Exception;
    public void deleteLike(Long bno, String id) throws Exception;
    public int alreadyLike(Long bno, String id) throws Exception;
    public void plusLike(Long bno) throws Exception;
    public void minusLike(Long bno) throws Exception;
}
