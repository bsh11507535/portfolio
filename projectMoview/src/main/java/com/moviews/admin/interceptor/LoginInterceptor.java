package com.moviews.admin.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.moviews.domain.UserVO;
import com.moviews.dto.UserInfoDto;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		UserVO userVO = (UserVO) modelMap.get("userVO");
		UserInfoDto loginDto = (UserInfoDto) modelMap.get("userInfoDto");
//		String resultRecaptcha = (String) modelMap.get("resultRecaptcha");
		String resultRecaptcha = "true";
		if(resultRecaptcha!=null){
			if (resultRecaptcha.equals("true")) {
				if (userVO != null) {
					if (loginDto.getUserPass().equals(userVO.getUserPass())) {
						session.setAttribute("userVO", userVO);
						Object dest = session.getAttribute("dest");
						response.sendRedirect(dest != null ? (String)dest:"/admin/userList");
					} else if (!loginDto.getUserPass().equals(userVO.getUserMail())) {
						System.out.println("비밀번호가 틀립니다??");
						response.sendRedirect("/admin");
					}
				} else {	
					System.out.println("아이디가 없습니다");
					response.sendRedirect("/admin");
				}
			} else {
				System.out.println("recaptcha false");
				response.sendRedirect("/admin");
			}
		}
//		} else {
//			System.out.println("recaptcha null");
//			response.sendRedirect("/admin");
//		}

	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("userVO") != null) {
			System.out.println("Clear Login Data");
			session.removeAttribute("userVO");
		}
		return true;
	}
}
