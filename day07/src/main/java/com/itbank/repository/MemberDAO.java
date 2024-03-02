package com.itbank.repository;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.itbank.model.MemberDTO;

@Repository
public interface MemberDAO {

	@Select("select * from member where userid = #{userid} and userpw = #{userpw}")
	MemberDTO login(MemberDTO dto);

	@Insert("insert into member (userid, userpw, username, email, birth) "
			+ " values(#{userid}, #{userpw}, #{username}, #{email}, #{birth}) ")
	int join(MemberDTO dto);

	@Delete("delete member where userid = #{userid}")
	int delete(String userid);

}
