package com.p0st1t.p0st1t.board.admin.mapper;
import com.p0st1t.p0st1t.board.admin.domain.AdminVO;
import com.p0st1t.p0st1t.board.admin.domain.Criteria;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface AdminMapper {

    public AdminVO read(Long bno);
    public int getDelete(Long bno);
    public List<AdminVO> getListWithPaging(Criteria cri);
    public void delete(String bno);
    public int getTotalCount(Criteria cri);
    public int getUserCount(Criteria cri);
    public int BoardViewCount(Long bno);
    public List<AdminVO> isMember(Criteria cri);
    public void userDelete(String user_id);

}
