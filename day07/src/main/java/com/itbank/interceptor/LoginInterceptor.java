package com.itbank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;


public class LoginInterceptor implements HandlerInterceptor {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		String url = request.getRequestURL().toString();
		
		if(session.getAttribute("login") == null) {
			String cpath = request.getContextPath();
			response.sendRedirect(cpath + "/member/login?url=" + url);
			System.out.println("로그인상태가 아니므로. 로그인 페이지로 이동합니다");
			return false;
		}
		return true;
	}
	
	
}
