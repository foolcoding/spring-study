package com.itbank.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.component.Paging;
import com.itbank.model.BoardDTO;
import com.itbank.repository.BoardDAO;

@Service
public class BoardService {
	@Autowired private BoardDAO dao;
	
	public List<BoardDTO> getList() {
		return dao.selectList();
	}

	public BoardDTO getOne(int idx) {
		return dao.selectOne(idx);
	}

	public int add(BoardDTO dto) {
		return dao.insert(dto);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int modify(BoardDTO dto) {
		return dao.update(dto);
	}

//	public List<BoardDTO> pageList(Paging paging, String search) {
//		return dao.pageList(paging, search);
//	}

	public int selectCount(String search) {
		return dao.selectCount(search);
	}

	public List<BoardDTO> pageList(HashMap<String, Object> map) {
		return dao.pageList(map);
	}
	
}
