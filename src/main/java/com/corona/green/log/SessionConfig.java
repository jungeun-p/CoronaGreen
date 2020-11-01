package com.corona.green.log;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.corona.green.model.biz.LogBiz;
import com.corona.green.model.dto.LogDto;

@WebListener
public class SessionConfig implements HttpSessionListener {

	
	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

		/*
		  HttpSession session = se.getSession(); ApplicationContext wac = new
		  ClassPathXmlApplicationContext(
		  "com/corona/green/log/log-applicationContext.xml"); 
		  LogBiz biz = (LogBiz)wac.getBean("logbiz1"); 
		  LogDto dto = new LogDto(0, se.getSession().getId(), null, null, null); 
		  biz.LogOut(dto);
		 */
		System.out.println("여기까지왔구나!!");
	}
}
