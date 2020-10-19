package com.corona.green.common.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LogAop {

	// 메소드 3개

	public void beforeLog(JoinPoint join) {
		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("--------------AOP Start---------------");

		Object[] args = join.getArgs();
		if (args != null) {
			logger.info("method : " + join.getSignature().getName());
			for (int i = 0; i < args.length; i++) {
				logger.info(i + "번째 : " + args[i]);
			}
		}
	}

	/*
	 * getTarget() : 대상객체 getArgs() : 대상 파라미터들 getSignature() : 대상 메서드 정보
	 * getTarget() : 누구를 호출하고 있는지 , 대상객체
	 * getArgs() : 대상 파라미터들 
	 * getSignature() : 대상 메서드 정보
	 */

	public void afterLog(JoinPoint join) {
		// 끝내고 싶은거다.
		Logger logger = LoggerFactory.getLogger(join.getTarget() + ""); // 로거 객체 만들었음
		logger.info("---AOP End---");

	}

	public void afterThrowingLog(JoinPoint join) {

		Logger logger = LoggerFactory.getLogger(join.getTarget() + "");
		logger.info("---AOP Error Log---");
		logger.info("error :" + join.getArgs());
		logger.info("error :" + join.toString());

	}

}
