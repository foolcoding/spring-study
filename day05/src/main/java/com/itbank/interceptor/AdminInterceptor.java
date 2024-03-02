package com.itbank.interceptor;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.itbank.model.MemberDTO;

public class AdminInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		
		MemberDTO dto = (MemberDTO) session.getAttribute("login");
		
		if(dto == null || !dto.getUserid().equals("admin")) {
			request.setAttribute("msg", "관리자만 접근 가능합니다");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/views/alert.jsp").forward(request, response);
			return false;
		}
		
		return true;
	}
	
}
