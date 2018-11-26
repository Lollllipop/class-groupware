package com.ja.classgroupware.base.util;

import javax.servlet.http.HttpServletRequest;

public class ClassManager {
	
	HttpServletRequest request;
	
	public ClassManager(HttpServletRequest request) {
		this.request = request;
	}
	
	public int getClassIdx() {
//		int class_idx = (int) request.getSession().getAttribute("class_idx");
		int class_idx = 1;
		return class_idx;
	}
	
	public int getUserIdx() {
//		int user_idx = (int) request.getSession().getAttribute("user").getUser_idx();
		int user_idx = 1;
		return user_idx;
	}

	public String getUserRole() {
//		String user_role = (int) request.getSession().getAttribute("user").getUser_idx();
		String user_role = "student";
		return user_role;
	}
	
}
