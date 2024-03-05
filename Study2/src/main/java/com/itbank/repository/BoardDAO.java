package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.component.Paging;
import com.itbank.model.BoardDTO;

@Repository
public interface BoardDAO {

	List<BoardDTO> selectList();

	BoardDTO selectOne(int idx);

	int insert(BoardDTO dto);

	int delete(int idx);

	int update(BoardDTO dto);

	int selectCount(String search);

//	List<BoardDTO> pageList(Paging paging, String search);

	List<BoardDTO> pageList(HashMap<String, Object> map);

}
