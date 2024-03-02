package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;

	public int checkDuplicate(HashMap<String, String> param) {
		return dao.selectCount(param);
	}

	public List<MemberDTO> getMemberList() {
		return dao.selectList();
	}
	
}
