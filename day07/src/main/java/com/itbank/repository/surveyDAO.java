package com.itbank.repository;

import java.util.HashMap;
import java.util.List;

import com.itbank.model.UploadDTO;
import com.itbank.model.AnswerDTO;
import com.itbank.model.SurveyDTO;

public interface surveyDAO {

	int selectCount(String search);

	List<SurveyDTO> selectList(HashMap<String, Object> map);

	SurveyDTO selectOne(int idx);

	int insertSurvey(SurveyDTO dto);

	int getSurvey_seq();
	
	void insertUpload(UploadDTO dto);

	SurveyDTO selectUploadOne(int idx);

	int insertAnswer(AnswerDTO dto);

	List<AnswerDTO> selectResult(int idx);

	int delete(int idx);

	void deleteUpload(int idx);

	UploadDTO selectOneUpload(int idx);

	void deleteAnswer(int idx);

	

}
