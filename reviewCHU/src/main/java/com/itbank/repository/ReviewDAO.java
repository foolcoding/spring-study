package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import com.itbank.model.ReviewDTO;

public interface ReviewDAO {

	List<ReviewDTO> selectList(HashMap<String, Object> map);

	int selectCount(String search);

	int add(ReviewDTO dto);

	ReviewDTO selectOne(int idx);

	int delete(int idx);

}
