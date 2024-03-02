package com.itbank.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.itbank.model.BoardDTO;

@Repository
public interface BoardDAO {

	List<BoardDTO> selectList();

	BoardDTO selectOne(int idx);

	int insert(BoardDTO dto);

	int delete(int idx);

	int update(BoardDTO dto);

}
