package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.member.MemberDTO;

@Repository
public interface MemberDAO {

	@Select("select * from member")
	List<MemberDTO> selectList();

	// pstmt에 대응하는 두개의 표현식이 있다
	// ${}는 따옴표를 무조건 넣지 않는다
	// #{}는 자료형에 따라 따옴표를 적절하게 처리해준다
	@Select("select * from member"
			+ " where ${searchType} like '%' || #{searchKeyword} || '%'")
	List<MemberDTO> selectSearchList(HashMap<String, String> paramMap);

	@Insert("insert into member (userid, userpw, username, email, birth) "
			+ "values (#{userid}, #{userpw}, #{username}, #{email}, #{birth})")
	int insert(MemberDTO dto);

	@Delete("delete from member where userid = #{userid}")
	int delete(String userid);
	
}
