package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.Mc.McDTO;
import com.itbank.controller.MemberDTO;
import com.itbank.repository.McDAO;

//enum McDonaldCategory {
//	all(null),
//	burger("버거"),
//	drink("음료");
//	
//	private String columnValue;
//	
//	McDonaldCategory(String columnValue){
//		this.columnValue = columnValue;
//	}
//	public String getColumnName() {
//		return columnValue;
//	}
//}

@Service
public class McService {

	@Autowired McDAO dao;
	
	public List<McDTO> getMcList() {
		return dao.selectList();
	}

	public int add(McDTO dto) {
		return dao.add(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public McDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int modify(McDTO dto) {
		return dao.modify(dto);
	}

	public List<McDTO> getMcListByCategory(String category) {
//		switch(category) {
//		case "all":			columnValue = null;		break;
//		case "burger":			columnValue = 버거;		break;
//		case "drink":			columnValue = 음료;		break;
//		}
//		McDonaldCategory el = McDonaldCategory.valueOf(category);
//		String columnValue = el.getColumnName();
		return dao.McListByCategory(category);
	}

	public List<McDTO> getMcSearchList(HashMap<String, String> paramMap) {
		return dao.getMcSearchList(paramMap);
	}

}
