package com.p0st1t.p0st1t.board.reply.mapper;


import com.p0st1t.p0st1t.board.freeboard.domain.Criteria;
import com.p0st1t.p0st1t.board.reply.domain.ReplyVO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ReplyMapper {

    public int insert(ReplyVO vo);

    public ReplyVO read(Long bno);

    public int delete(Long rno);

    public int update(ReplyVO reply);

    public int getTotal(Long bno);


    /*
     * MyBatis는 두 개 이상의 데이터를 파라미터로 전달하기 위해
     * 1) 별도의 객체로 구성하거나 2) Map 이용 방식 3) Param을 이용해 이름을 사용하는 방식이 있다.
     * @Param 의 속성값은 MyBatis에서 SQL을 이용할 때#{}의 이름으로 사용 가능
     */
    public List<ReplyVO> getListWithPaging(
            @Param("cri") Criteria cri,
            @Param("bno") Long bno);

    public int getCountByBno(Long bno);


}
