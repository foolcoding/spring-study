package com.itbank.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.MemberDTO;
import com.itbank.repository.MemberDAO;

@Service
public class MemberService {

	@Autowired private MemberDAO dao;

	public List<MemberDTO> getMemberList() {
		List<MemberDTO> list = dao.selectList();
		list.forEach(dto -> dto.setUserpw("********"));
		return list;
	}

	public MemberDTO getMember(String userid) {

		return dao.selectOne(userid);
	}

	public int add(MemberDTO dto) {
		return dao.insert(dto);
	}

	public MemberDTO login(MemberDTO dto) {
		return dao.login(dto);
	}

	public int delete(String userid) {
		return dao.delete(userid);
	}

	public int modify(MemberDTO dto) {
		return dao.update(dto);
	}

	public String resetPass(MemberDTO dto) {
		String newPassword = UUID.randomUUID().toString().replace("-", "").substring(0, 8);
		dto.setUserpw(newPassword);
		int row = dao.updatePassword(dto);
		return row != 0 ? newPassword : null;
	}
	
}
