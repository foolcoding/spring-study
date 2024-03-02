package com.itbank.controller;

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
	
	@Autowired MemberService ms;

	@GetMapping("/login")
	public void login() {}
	
	@PostMapping("/login")
	public String login(MemberDTO dto, HttpSession session) {
		MemberDTO login = ms.login(dto);
		session.setAttribute("login", login);
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
	public ModelAndView join(MemberDTO dto) {
		ModelAndView mav = new ModelAndView("alert");
		int row = ms.getMember(dto);
		String msg = "회원가입";
		String url = "/member/login";
		mav.addObject("msg", msg);
		mav.addObject("url", row != 0 ? url : "");
		return mav;
	}
	
	@GetMapping("/delete/{userid}")
	public ModelAndView delete(@PathVariable("userid") String userid) {
		ModelAndView mav = new ModelAndView("alert");
		int row = ms.delete(userid);
		String msg = "회원탈퇴";
		String url = "/";
		mav.addObject("msg", msg);
		mav.addObject("url", row != 0 ? url : "");
		return mav;
	}
	
}
