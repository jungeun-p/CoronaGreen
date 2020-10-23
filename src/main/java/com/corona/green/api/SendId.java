package com.corona.green.api;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendId {

	public SendId() {
		
	}
	
	public boolean IdSend(String id,String email) throws AddressException, MessagingException {
		 	boolean check = true;
		 	// SMTP 서버 설정
		    final String host = "smtp.gmail.com"; // 사용할 smtp host, naver라면 smtp.naver.com
		    final String accountId = "dndrldzk@gmail.com";
		    final String accountPwd = "qndhkz45";
		    final int port = 465; // SMTP 포트
		     
			String receiver = email; // 받는사람 이메일
		    String sender = accountId; // 보내는사람 이메일
		     
		    // Property 정보 생성
		    Properties props = System.getProperties();
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", port);
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.ssl.enable", "true");
		    props.put("mail.smtp.ssl.trust", host);
		     
		    // 사용자 인증
		    Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		        protected javax.mail.PasswordAuthentication getPasswordAuthentication(){
		            return new javax.mail.PasswordAuthentication(accountId, accountPwd);
		        }
		    });
		    session.setDebug(true);
		     
		    Message mimeMessage = new MimeMessage(session); //MimeMesage 생성
		    mimeMessage.setFrom(new InternetAddress(sender)); // 보내는 EMAIL (정확히 적어야 SMTP 서버에서 인증 실패되지 않음)
		    mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(receiver)); 
		     
		    // Message Setting
		    mimeMessage.setSubject("[CoronaGreen] 아이디 찾기");
		    mimeMessage.setText("회원님의 아이디는 " + id + " 입니다.");
		    Transport.send(mimeMessage); // Transfer
		    
		    return check;
	}
}
