package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.ReviewDTO;
import com.itbank.service.ReviewService;

@Controller
@RequestMapping("/review")
public class ReviewController {

	@Autowired private ReviewService rs;
	
	@GetMapping("/list/{page}")
	public ModelAndView list(@PathVariable("page") int page, String search) {
		ModelAndView mav = new ModelAndView("/review/list");
		
		if(search==null) {search="";}
		int reviewCount = rs.selectCount(search);
		Paging paging = new Paging(page, reviewCount);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<ReviewDTO> list = rs.selectList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		return mav;
	}
	
	@GetMapping("/add")
	public void add() {}
	
	@PostMapping("/add")
	public String add(ReviewDTO dto) {
		int row = rs.add(dto);
		System.out.println(row != 0 ? "작성성공" : "작성실패" );
		return "redirect:/review/list/1";
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView info(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/review/view");
		ReviewDTO dto = rs.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = rs.delete(idx);
		System.out.println(row != 0 ? "삭제성공" : "삭제실패");
		return "redirect:/review/list/1";
	}
}
