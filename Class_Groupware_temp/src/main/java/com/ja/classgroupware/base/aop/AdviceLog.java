package com.ja.classgroupware.base.aop;

import org.aspectj.lang.JoinPoint;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AdviceLog {

	private static final Logger LOGGER = LoggerFactory.getLogger(AdviceLog.class);
	
	public void methodStartLog(JoinPoint joinPoint) {
		String methodName 	= joinPoint.getSignature().getName();
		String path 		= joinPoint.getTarget().getClass().toString().split(" ")[1];	
		String output		= path + "." + methodName; 
		
		LOGGER.info(output);
	}
	
}
