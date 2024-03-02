package com.itbank.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Ex01Controller {

	// 일반적인 스프링 컨트롤러 함수는 viewName을 반환해서, JSP로 포워딩 혹은 리다이렉트 하는 것이 목적

	@GetMapping("/ex01")
	public void ex01() {}
	
}
