package com.corona.green.api;


import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service
public class SendIdImpl implements SendId {

	@Autowired
	private JavaMailSender mailSender;


	public boolean IdSend(String id, String email) throws Exception {
		boolean check = true;
		// SMTP 서버 설정
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[CoronaGreen] 아이디 찾기");
		sendMail.setText("회원님의 아이디는 " + id + " 입니다.");

		sendMail.setFrom("dndrldzk@gmail.com", "GreenCorona");
		sendMail.setTo(email);
		sendMail.send();

		return check;
	}
}
