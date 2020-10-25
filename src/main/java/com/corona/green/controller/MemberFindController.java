package com.corona.green.controller;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.corona.green.api.SendCode;
import com.corona.green.api.SendId;
import com.corona.green.api.UserSha256;
import com.corona.green.model.biz.MemberBiz;
import com.corona.green.model.dto.MemberDto;

@Controller
public class MemberFindController {

	Logger logger = LoggerFactory.getLogger(MemberLoginController.class);

	@Autowired
	private MemberBiz biz;

	@RequestMapping("find.do")
	public String findForm(Model model) {
		return "green_find";
	}

	@RequestMapping("emailsend.do")
	@ResponseBody
	public boolean emailChk(@RequestParam("email") String email) throws AddressException, MessagingException {
		int res = biz.EmailCheck(email);
		MemberDto dto = biz.EmailCheckId(email);
		boolean check = false;
		if (res > 0) {
			SendId sendid = new SendId();
			return sendid.IdSend(dto.getId(), email);
		} else {
			return check;
		}
	}

	@RequestMapping("emailsendcode.do")
	@ResponseBody
	public String emailCode(MemberDto dto) throws AddressException, MessagingException {
		int res = biz.EmailIdCheck(dto);
		if (res > 0) {
			SendCode code = new SendCode();
			return code.getCode(dto.getEmail());
		} else {
			return "NO";
		}
	}

	@RequestMapping("changepw.do")
	public String ChangePwForm(@RequestParam("id") String id, Model model) {
		model.addAttribute("id", id);
		return "green_changepw";
	}

	@RequestMapping("changepwres.do")
	public String ChangePwRes(MemberDto dto, Model model) {
		System.out.println("아이디 : " + dto.getId() + "비밀번호 : " + dto.getPw());
		String encryPassword = UserSha256.encrypt(dto.getPw());
		System.out.println(encryPassword);
		dto.setPw(encryPassword);
		
		int res = 0;
		res = biz.ChangePw(dto);
		
		if (res > 0) {
			model.addAttribute("msg","비밀번호 변경이 완료되었습니다.");
			model.addAttribute("url","/main.do");
		}
		return "redirect";
	}
}
