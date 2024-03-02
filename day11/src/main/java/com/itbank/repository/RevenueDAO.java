package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.RevenueDTO;

@Repository
public interface RevenueDAO {

	int selectCount(String search);

	List<RevenueDTO> selectList(HashMap<String, Object> map);

	
	
}
