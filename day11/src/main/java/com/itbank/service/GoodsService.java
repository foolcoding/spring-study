package com.itbank.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itbank.model.GoodsDTO;
import com.itbank.repository.GoodsDAO;

@Service
public class GoodsService {

	@Autowired private GoodsDAO dao;
	
	private String saveDirectory = "C:\\upload";
	
	public GoodsService() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public int add(GoodsDTO dto) {
		String img = dto.getUpload().getOriginalFilename();

		File f = new File(saveDirectory, img);
		try {
			dto.getUpload().transferTo(f);
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		dto.setImg(img);
		
		return dao.insert(dto);
	}
	
	public List<GoodsDTO> selectList(HashMap<String, Object> map) {
		return dao.selectList(map);
	}

	public GoodsDTO selectOne(int idx) {
		return dao.selectOne(idx);
	}

	public int delete(int idx) {
		return dao.delete(idx);
	}

	public int update1(int idx) {
		return dao.update1(idx);
	}

	public int update2(int idx) {
		return dao.update2(idx);
	}

	public int selectCount(String search) {
		return dao.selectCount(search);
	}

}
