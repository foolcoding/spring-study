package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired MemberDAO dao;
	
	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}

	public int getMember(MemberDTO dto) {
		return dao.join(dto);
	}

	public int delete(String userid) {
		return dao.delete(userid);
	}

}
