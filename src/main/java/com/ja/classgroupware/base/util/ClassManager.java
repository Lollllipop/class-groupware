package com.ja.classgroupware.base.util;

import javax.servlet.http.HttpServletRequest;

public class ClassManager {
	
	HttpServletRequest request;
	
	ClassManager(HttpServletRequest request) {
		this.request = request;
	}
	
	public int getClassIdx() {
		return 1;
	}
	
	public int getUserIdx() {
		return 1;
	}
	
	public String getUserName() {
		return null;
	}
	
}
