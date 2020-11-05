package com.corona.green.log;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;



public class SessionConfig implements HttpSessionListener {

	/*
	 * @Autowired private LogBiz biz;
	 */

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {

		// ApplicationContext wac = new
		// ClassPathXmlApplicationContext("com/corona/green/log/log-applicationContext.xml");
		// LogBiz biz = (LogBiz)wac.getBean("logbiz1");
		/*if (se != null) {
			System.out.println("se가 널이아니래!");
			System.out.println(se);

			try {
				if (biz == null) {
					System.out.println("null");
				} else {
					System.out.println("null 아님");
				}
			} catch (Exception e) {
				System.out.println("에러났대!!!");
				e.printStackTrace();
			}
		}*/
		HttpSession session = se.getSession();
		String authCode = se.getSession().getId();
		ApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(session.getServletContext());
		
		Log biz = (Log)ctx.getBean("logbiz1");
		
		if (biz != null) {
			try {
				biz.TimeLogOut(authCode);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

		//System.out.println("세션이 파괴됐다... 30분빼자");
	}
}
