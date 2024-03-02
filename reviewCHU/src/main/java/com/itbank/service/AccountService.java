package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.HashComponent;
import com.itbank.model.AccountDTO;
import com.itbank.repository.AccountDAO;

@Service
public class AccountService {

	@Autowired private AccountDAO dao;
	@Autowired private HashComponent hc;
	
	public AccountDTO login(AccountDTO dto) {
		String hash = hc.getHash(dto.getUserpw());
		dto.setUserpw(hash);
		return dao.login(dto);
	}

	public int join(AccountDTO dto) {
		String hash = hc.getHash(dto.getUserpw());
		dto.setUserpw(hash);
		return dao.join(dto);
	}

}
