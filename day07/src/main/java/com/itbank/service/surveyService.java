package com.itbank.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.itbank.component.FileComponent;
import com.itbank.model.UploadDTO;
import com.itbank.model.AnswerDTO;
import com.itbank.model.SurveyDTO;
import com.itbank.model.Upload1DTO;
import com.itbank.repository.surveyDAO;

@Service
public class surveyService {

	@Autowired private surveyDAO dao;
	@Autowired private FileComponent fc;
	
	private String saveDirectory = "C:\\upload";

	public int selectCount(String search) {
		return dao.selectCount(search);
	}

	public List<SurveyDTO> selectList(HashMap<String, Object> map) {
		return dao.selectList(map);
	}

	public SurveyDTO selectOne(int idx) {
		return dao.selectUploadOne(idx);
	}
	
	public surveyService() {
		File dir = new File(saveDirectory);
		if(dir.exists() == false) {
			dir.mkdirs();
		}
	}
	
	public int uploadMultiple(SurveyDTO survey, UploadDTO upload) {
		int row = 0;

		List<MultipartFile> list = upload.getUpload();
		
		String ori = "";
		String result = "";
		for(MultipartFile f : list) {
			ori += f.getOriginalFilename() + ":";
			result += fc.upload(f) + ":";
		}
		ori = ori.substring(0, ori.length() - 1);
		result = result.substring(0, result.length() - 1);
		upload.setOriginalFileName(ori);
		upload.setStoreFileName(result);
		
		row = dao.insertSurvey(survey);
		int idx = dao.getSurvey_seq();
		SurveyDTO dto = dao.selectOne(idx);
		
		upload.setSv_idx(dto.getIdx());
		dao.insertUpload(upload);
		return row;
	}

	public int insertAnswer(AnswerDTO dto) {
		return dao.insertAnswer(dto);
	}

	public List<AnswerDTO> selectResult(int idx) {
		return dao.selectResult(idx);
	}

	public int delete(int idx) {
		UploadDTO dto = dao.selectOneUpload(idx);
		File f = new File(saveDirectory, dto.getStoreFileName());
		if(f.exists()) {
			f.delete();
		}
		dao.deleteUpload(idx);
		dao.deleteAnswer(idx);
		return dao.delete(idx);
	} 
	
}
