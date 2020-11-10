package com.corona.green.controller;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corona.green.api.UserSha256;
import com.corona.green.model.biz.MemberBiz;
import com.corona.green.model.dto.MemberDto;
import com.corona.green.api.PhoneCodeSend;
import com.corona.green.api.RandomCode;

@Controller
public class MemberRegistController {
	
	@Autowired
	private MemberBiz biz;
	
	Logger logger = LoggerFactory.getLogger(MemberRegistController.class);
	
	@RequestMapping("registres.do")
	public String registRes(Model model, MemberDto dto, String addr1, String addr2, String addr3) {
		logger.info("회원가입");
		String encryPassword = UserSha256.encrypt(dto.getPw());
		dto.setPw(encryPassword);
		if (addr3 == null) {
			addr3 = "";
		}
		dto.setAddress("("+addr1+") " + addr2 +" "+ addr3);
		
		biz.regist(dto);
		
		model.addAttribute("msg","환영합니다!");
		model.addAttribute("url","/main.do");
		return "redirect";
	}
	
	@RequestMapping(value="idcheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String idCheck(@RequestParam("id") String id) {
		int res= biz.IdCheck(id);
		String res1 = Integer.toString(res);
		
		return res1;
	}
	
	@RequestMapping(value="emailcheck.do", method=RequestMethod.GET)
	@ResponseBody
	public String emailCheck(@RequestParam("email") String email) {
		int res= biz.EmailCheck(email);
		String res1 = Integer.toString(res);
		
		return res1;
	}
	
	@RequestMapping(value="phonesend.do", method=RequestMethod.GET)
	@ResponseBody
	public String PhoneCodeSend(@RequestParam("phone") String phone) {
		
		PhoneCodeSend send = new PhoneCodeSend();
		RandomCode code = new RandomCode();
		String phonecode = code.excuteGenerate();
		// 시연할때는 여기 주석 풀어주자!
		send.certifiedPhoneNumber(phone, phonecode);
		
		return phonecode;
	}
	
}
