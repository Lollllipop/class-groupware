package com.ja.classgroupware.base.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AdviceException {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(AdviceException.class);
	
	public void exceptionProcess(JoinPoint joinPoint, Exception ex) {
		String methodName 	= joinPoint.getSignature().getName();
		String path 		= joinPoint.getTarget().getClass().toString().split(" ")[1];	
		String output		= path + "." + methodName; 
		
		LOGGER.error(output);
		ex.printStackTrace();
		
		
		
		
		// 콘솔, 페이지
		// 콘솔에는 로그 띄우고
		// 페이지로는 에러 페이지 전달해줘야할 듯 (500 에러 메시지로 통일해서 전달할 것)
	}
	
}
