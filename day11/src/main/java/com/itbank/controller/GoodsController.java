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
import com.itbank.model.GoodsDTO;
import com.itbank.service.GoodsService;

@Controller
@RequestMapping("/goods")
public class GoodsController {
	
	@Autowired private GoodsService gs;

	@GetMapping("/list/{page}")
	public ModelAndView list(@PathVariable("page") int page, String search) {
		ModelAndView mav = new ModelAndView("/goods/list");

		if(search==null) {search="";}
		int goodsCount = gs.selectCount(search);
		Paging paging = new Paging(page, goodsCount);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
		List<GoodsDTO> list = gs.selectList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("alert");
		int row = gs.delete(idx);
		mav.addObject("msg", "상품 추가");
		mav.addObject("url", row != 0 ? "/goods/list/1" : "");
		return mav;
	}
	
	@GetMapping("/add")
	public void add() {}
	
	@PostMapping("/add")
	public ModelAndView add(GoodsDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		int row = gs.add(dto);
		mav.addObject("msg", "상품 추가");
		mav.addObject("url", row != 0 ? "/goods/list/1" : "");
		return mav;
	}
	
	@GetMapping("/view/{idx}")
	public ModelAndView list(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/goods/view");
		GoodsDTO dto = gs.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/update+/{idx}")
	public String update1(@PathVariable("idx") int idx){
		int row = gs.update1(idx);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/goods/view/{idx}";
	}
	
	@GetMapping("/update-/{idx}")
	public String update2(@PathVariable("idx") int idx){
		int row = gs.update2(idx);
		System.out.println(row != 0 ? "성공" : "실패");
		return "redirect:/goods/view/{idx}";
	}
	
	
}
