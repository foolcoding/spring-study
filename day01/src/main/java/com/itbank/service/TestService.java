package com.itbank.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.repository.Test2DAO;
import com.itbank.repository.TestDAO;
import com.itbank.repository.Test3DAO;

@Service
public class TestService {

//	@Autowired private TestDAO testDAO;		// jdbcTemplate
//	@Autowired private Test2DAO test2DAO;	// sqlSessionTemplate (myBatis)
	@Autowired private Test3DAO test3DAO;	// mapper auto injection (myBatis-spring)
	
	public String getDBversion() {
		return test3DAO.selectBanner();
	}

	public java.sql.Date getSysdate() {
		return test3DAO.selectSysdate();
	}


}
