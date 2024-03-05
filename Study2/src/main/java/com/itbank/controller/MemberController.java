package com.itbank.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.itbank.model.MemberDTO;
import com.itbank.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	@Autowired private MemberService memberService;
	
	@GetMapping("list")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView();
		List<MemberDTO> list = memberService.getList();
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	@GetMapping("/{idx}")
	public ModelAndView info(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/info");
		MemberDTO dto = memberService.getOne(idx);
		
		mav.addObject("dto", dto);
		return mav;
	}
	
	@GetMapping("/modify/{idx}")
	public ModelAndView modify(@PathVariable("idx") int idx) {
		ModelAndView mav = new ModelAndView("/member/modify");
		MemberDTO dto = memberService.getOne(idx);
		
		mav.addObject("dto", dto);
		return mav;
	}
	
	@PostMapping("/modify/{idx}")
	public String modify(MemberDTO dto) {
		int row = memberService.update(dto);
		System.out.println(row!=0 ? "수정성공":"수정실패");
		return "redirect:/member/list";
	}
	
	@GetMapping("/delete/{idx}")
	public String delete(@PathVariable("idx") int idx) {
		int row = memberService.delete(idx);
		System.out.println(row!=0 ? "삭제성공":"삭제실패");
		return "redirect:/member/list";
	}
	
	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session){
		dto = memberService.login(dto);
		session.setAttribute("login", dto);
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/join")
	public void join() {}
	
	@PostMapping("/join")
	public String join(MemberDTO dto) {
		int row = memberService.add(dto);
		System.out.println(row!=0 ? "가입성공":"가입실패");
		return "redirect:/member/login";
	}
}
