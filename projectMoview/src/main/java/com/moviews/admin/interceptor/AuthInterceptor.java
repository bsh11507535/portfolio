package com.moviews.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter {
	private void saveDest(HttpServletRequest request) {
	String url = request.getRequestURI();
	String query = request.getQueryString();
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		if(request.getMethod().equals("GET")){
			request.getSession().setAttribute("dest", url + query);
		}
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("userVO") == null) {
			System.out.println("Current user is not logined");
			saveDest(request);
			response.sendRedirect("/admin");
			return false;
		}
		return true;
	}
}
