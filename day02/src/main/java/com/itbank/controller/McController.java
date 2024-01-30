package com.itbank.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.Mc.McDTO;
import com.itbank.member.MemberDTO;
import com.itbank.service.McService;

@Controller
public class McController {

	@Autowired private McService ms;
	
	@GetMapping("/")
	public ModelAndView selectList() {
		ModelAndView mav = new ModelAndView("mc");
		List<McDTO> list = ms.getMcList();
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/{category}")
	public ModelAndView selectList(@PathVariable("category") String category) {
		ModelAndView mav = new ModelAndView("mc");
		List<McDTO> list = ms.getMcListByCategory(category);
		mav.addObject("list", list);
		return mav;
	}
	
	@PostMapping("/")
	public ModelAndView memberSearchList(@RequestParam HashMap<String, String> paramMap) {
		ModelAndView mav = new ModelAndView("mc");
		List<McDTO> list = ms.getMcSearchList(paramMap);
		mav.addObject("list", list);
		return mav;
	}
	
	@GetMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("mc-add");
		return mav;
	}
	
	@PostMapping("/add")
	public ModelAndView add(McDTO dto) {
		ModelAndView mav = new ModelAndView("redirect:/");
		int row = ms.add(dto);
		System.out.println(row != 0 ? "추가성공" : "추가실패");
		return mav;
	}
	
	@GetMapping("/delete/{idx}")
	public ModelAndView delete(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("alert");
		int row = ms.delete(idx);
		String message = row != 0 ? "삭제 성공" : "삭제 실패";
		String url = "/";
		mav.addObject("message", message);
		mav.addObject("url", url);
		return mav;
	}
	
	@GetMapping("/one/{idx}")
	public ModelAndView one(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("one");
		McDTO dto = ms.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("modify");
		McDTO dto = ms.selectOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public ModelAndView modify(McDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		int row = ms.modify(dto);
		String message = row != 0 ? "수정 성공" : "수정 실패";
		String url = "/one/"+ dto.getIdx();
		mav.addObject("message", message);
		mav.addObject("url", url);
		return mav;
	}
}
