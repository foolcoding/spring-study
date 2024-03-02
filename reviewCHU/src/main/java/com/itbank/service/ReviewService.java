package com.itbank.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.ReviewDTO;
import com.itbank.repository.ReviewDAO;

@Service
public class ReviewService {

	@Autowired private ReviewDAO dao;
	@Autowired private FileComponent fc;
	private String saveDirectory = "C:\\upload";

	public List<ReviewDTO> selectList(HashMap<String, Object> map) {
		return dao.selectList(map);
	}

	public int selectCount(String search) {
		return dao.selectCount(search);
	}

	public int add(ReviewDTO dto) {
		dto.setImg(fc.upload(dto.getUpload()));
		return dao.add(dto);
	}

	public ReviewDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int delete(int idx) {
		ReviewDTO dto = dao.selectOne(idx);
		File f = new File(saveDirectory, dto.getImg());
		if(f.exists()) {
			f.delete();
		}
		return dao.delete(idx);
	}
	
	

}
