package com.itbank.repository;

import java.util.List;

import com.itbank.model.MemberDTO;

public interface MemberDAO {

	List<MemberDTO> selectList();

	MemberDTO selectOne(int idx);

	int update(MemberDTO dto);

	int delete(int idx);

	MemberDTO login(MemberDTO dto);

	int insert(MemberDTO dto);

}
