package com.corona.green.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.corona.green.model.biz.MemberBiz;
import com.corona.green.model.dto.MemberDto;

@Controller
public class MemberLoginController {

	@Autowired
	private MemberBiz biz;
	
	Logger logger = LoggerFactory.getLogger(MemberLoginController.class);
	
	@RequestMapping(value="/loginform.do")
	public String loginForm() {
		logger.info("Login Page");
		return "green_login";
	}
	
	@RequestMapping("/login.do")
	public String login(MemberDto dto, Model model, HttpSession session) {
		logger.info("login");
		
		MemberDto res = biz.login(dto);
		if (res != null) {
			session.setAttribute("dto", res);
			return "redirect:main.do";
		} else {
			model.addAttribute("msg","아이디와 비밀번호를 확인해주세요.");
			model.addAttribute("url","/loginform.do");
			return "redirect";
		}
	}
	
	@RequestMapping("regist.do")
	public String naverLogin() {
		return "green_sign";
	}
	
	@RequestMapping("/logout1.do")
	public String logout(HttpSession session) {
		logger.info("로그아웃 성공");
		System.out.println("asdjlsakdjlsakdj");
		session.invalidate();
		return "redirect:main.do";
	}
	
}
