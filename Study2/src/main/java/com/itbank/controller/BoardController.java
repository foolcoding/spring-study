package com.itbank.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.component.Paging;
import com.itbank.model.BoardDTO;
import com.itbank.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;
	
//	@GetMapping("list")
//	public ModelAndView list() {
//		ModelAndView mav = new ModelAndView("/board/list");
//		List<BoardDTO> list = boardService.getList();
//		
//		mav.addObject("list", list);
//		return mav;
//	}
	
	@GetMapping("list/{page}")
	public ModelAndView list(@PathVariable("page") int page, @RequestParam(required=false) String search) {
		ModelAndView mav = new ModelAndView("/board/list");
		System.out.println(search);
		if(search==null) {search="";}
		int boardcount = boardService.selectCount(search);
		Paging paging = new Paging(page, boardcount);
		
		HashMap<String,Object> map = new HashMap<>();
		map.put("paging", paging);
		map.put("search", search);
		
//		List<BoardDTO> list = boardService.pageList(paging, search);
		List<BoardDTO> list = boardService.pageList(map);
		
		mav.addObject("list", list);
		mav.addObject("paging", paging);
		mav.addObject("search", search);
		return mav;
	}
	
	@GetMapping("/{idx}")
	public ModelAndView view(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/board/view");
		BoardDTO dto = boardService.getOne(idx);
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/write")
	public void add() {}
	
	@PostMapping("/write")
	public String add(BoardDTO dto) {
		int row = boardService.add(dto);
		System.out.println(row!=0? "작성성공":"작성실패");
		return "redirect:/board/list/1";
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = boardService.delete(idx);
		System.out.println(row!=0? "삭제성공":"삭제실패");
		return "redirect:/board/list/1";
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/board/modify");
		mav.addObject("dto", boardService.getOne(idx));
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(BoardDTO dto) {
		int row = boardService.modify(dto);
		System.out.println(row!=0? "수정성공":"수정실패");
		return "redirect:/board/{idx}";
	}
}
