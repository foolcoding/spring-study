package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;



@Repository
public interface MemberDAO {

	@Select("select count(*) from member where userid = #{userid}")
	int selectCount(HashMap<String, String> param);

	@Select("select * from member order by id")
	List<MemberDTO> selectList();
	
}
