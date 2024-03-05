package com.itbank.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;
	@Autowired private HashComponent hash; 
	
	public List<MemberDTO> getList() {
		return dao.selectList();
	}

	public MemberDTO getOne(int idx) {
		return dao.selectOne(idx);
	}

	public int update(MemberDTO dto) {
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		return dao.update(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public MemberDTO login(MemberDTO dto) {
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		return dao.login(dto);
	}

	public int add(MemberDTO dto) {
		dto.setUserpw(hash.getHash(dto.getUserpw()));
		return dao.insert(dto);
	}

}
