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
import com.itbank.model.RevenueDTO;
import com.itbank.service.revenueService;

@Controller
@RequestMapping("/revenue")
public class RevenueController {
	
	@Autowired private revenueService rs;

	@GetMapping("/list/{page}")
	public ModelAndView list(@PathVariable("page") int page, String search) {
		ModelAndView mav = new ModelAndView("/revenue/list");

		if(search==null) {search="";}
		int revenueCount = rs.selectCount(search);
		Paging paging = new Paging(page, revenueCount);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<RevenueDTO> list = rs.selectList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;
	}
	
	@GetMapping("/add")
	public void add() {}
	
	@PostMapping("/add")
	public ModelAndView add() {
		
	}
	
	
	
}
