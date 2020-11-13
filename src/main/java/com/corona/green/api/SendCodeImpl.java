package com.corona.green.api;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class SendCodeImpl implements SendCode{

	
	@Autowired
	private JavaMailSender mailSender;
	
	public String getCode(String email) throws Exception{
		RandomCode code = new RandomCode();
	    String randomcode = code.excuteGenerate();
	    MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("[CoronaGreen] 비밀번호 변경 코드");
		sendMail.setText("코드 : " + randomcode);

		sendMail.setFrom("dndrldzk@gmail.com", "GreenCorona");
		sendMail.setTo(email);
		sendMail.send();
	    
	    return randomcode;
	}
}
