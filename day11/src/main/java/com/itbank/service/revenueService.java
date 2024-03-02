package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GoodsDTO;
import com.itbank.model.RevenueDTO;
import com.itbank.repository.RevenueDAO;

@Service
public class revenueService {

	@Autowired private RevenueDAO dao;

	public int selectCount(String search) {
		return dao.selectCount(search);
	}

	public List<RevenueDTO> selectList(HashMap<String, Object> map) {
		return dao.selectList(map);
	}
	
}
