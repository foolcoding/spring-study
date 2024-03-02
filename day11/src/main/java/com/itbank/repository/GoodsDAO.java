package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.GoodsDTO;

@Repository
public interface GoodsDAO {

	List<GoodsDTO> selectList(HashMap<String, Object> map);

	GoodsDTO selectOne(int idx);

	int insert(GoodsDTO dto);

	int delete(int idx);

	int update1(int idx);

	int update2(int idx);

	int selectCount(String search);
	
}
