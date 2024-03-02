package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.UploadDTO;
import com.itbank.model.AnswerDTO;
import com.itbank.model.SurveyDTO;
import com.itbank.service.surveyService;

@Controller
@RequestMapping("/survey")
public class SurveyController {
	
	@Autowired private surveyService ss;
	
	@GetMapping("/list/{page}")
	public ModelAndView list(@PathVariable("page") int page, String search) {
		ModelAndView mav = new ModelAndView("/survey/list");

		if(search==null) {
			search = "";
		}
		int surveyCount = ss.selectCount(search);
		Paging paging = new Paging(page, surveyCount);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<SurveyDTO> list = ss.selectList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView content(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/survey/view");
		SurveyDTO dto = ss.selectOne(idx);
		List<AnswerDTO> list = ss.selectResult(idx);
		mav.addObject("dto", dto);
		mav.addObject("list", list);
		
		return mav;
	}
	
//	@PostMapping("/view/{idx}")
//	public ModelAndView content(AnswerDTO dto) {
//		ModelAndView mav =  new ModelAndView("alert");
//		int row = 0;
//		String url = "/survey/view/{idx}";
//		String msg = "설문참여";
//		try {
//			row = ss.insertAnswer(dto);
//		} catch (SQLIntegrityConstraintViolationException e) {
//			row = -2;
//		}
//		if(row == -2) {
//			msg = "설문에 이미 참여하셨습니다";
//		}
//		mav.addObject("msg", msg);
//		mav.addObject("url", url);
//		return mav;
//	}
	
	@PostMapping("/view/{idx}")
	public String content(AnswerDTO dto) {
		int row = ss.insertAnswer(dto);
		return "redirect:/survey/view/{idx}";
	}
	
	@GetMapping("/write")
	public void upload() {}
	
	@PostMapping("/write")
	public String upload(SurveyDTO survey, UploadDTO upload) {
		int row = ss.uploadMultiple(survey, upload);
		System.out.println("등록된 레코드의 개수 : " + row);
		return "redirect:/survey/list/1";
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = ss.delete(idx);
		
		return "redirect:/survey/list/1";
	}

}
