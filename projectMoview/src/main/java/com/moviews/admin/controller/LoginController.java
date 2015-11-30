package com.moviews.admin.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.moviews.admin.service.AdminService;
import com.moviews.domain.UserVO;
import com.moviews.dto.UserInfoDto;
import com.moviews.util.RecaptchaCheck;

@Controller
@RequestMapping(value="/admin")
public class LoginController {
	ModelAndView mav;

	@Inject
	AdminService service;
	
	@Transactional
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public void login(UserInfoDto dto, HttpSession session, HttpServletRequest req, Model model) throws Exception{
		String resultRecaptcha=RecaptchaCheck.recaptchaCheck(req.getParameter("g-recaptcha-response"));
		UserVO vo = service.login(dto);
		model.addAttribute("userVO", vo);
		model.addAttribute("userInfoDto", dto);
		model.addAttribute("resultRecaptcha", resultRecaptcha);
	}
	
	@Transactional
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public ModelAndView logout(HttpSession session, HttpServletRequest req){
		mav=new ModelAndView();
		session.removeAttribute("userVO");//세션속 Attribute를 제거
		//session.invalidate();//세션 무효화
		mav.setViewName("redirect:/admin");
		return mav;
	}
}
