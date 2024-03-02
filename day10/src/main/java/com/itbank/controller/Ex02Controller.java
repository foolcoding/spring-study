package com.itbank.controller;

import java.util.Random;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Ex02Controller {
	
	private Random ran = new Random();
	private int n1;
	private int n2;
	
	@GetMapping("/ex02")
	public ModelAndView ex02() {
		ModelAndView mav = new ModelAndView();
		n1 = ran.nextInt(10) + 1;
		n2 = ran.nextInt(10) + 1;
		mav.addObject("n1", n1);
		mav.addObject("n2", n2);
		return mav;
	}
	
	@GetMapping(value="/ex02Ajax", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String ex02Ajax(int user) {
		int answer = n1 + n2;
		return (answer == user) ? "정답입니다" : "틀렸습니다";
	}
	
}
