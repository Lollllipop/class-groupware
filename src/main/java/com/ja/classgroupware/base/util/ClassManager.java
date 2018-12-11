package com.ja.classgroupware.base.util;

import javax.servlet.http.HttpServletRequest;

import com.ja.classgroupware.base.vo.UsersVO;

public class ClassManager {
	
	HttpServletRequest request;
	
	public ClassManager(HttpServletRequest request) {
		this.request = request;
	}
	
	public int getClassIdx() {
		UsersVO usersVO = (UsersVO) request.getSession().getAttribute("login");
//		int class_idx = (int) request.getSession().getAttribute("class_idx");
		int class_idx = 1;
		return class_idx;
	}
	
	public int getUserIdx() {
		UsersVO usersVO = (UsersVO) request.getSession().getAttribute("login");
		int user_idx = usersVO.getUser_idx();
		return user_idx;
	}

	public String getUserRole() {
		UsersVO usersVO = (UsersVO) request.getSession().getAttribute("login");
		String user_role = usersVO.getUser_role();
		return user_role;
	}

	public String getUserName() {
		UsersVO usersVO = (UsersVO) request.getSession().getAttribute("login");
		String user_name = usersVO.getUser_name();
		return user_name;
	}
	
}
