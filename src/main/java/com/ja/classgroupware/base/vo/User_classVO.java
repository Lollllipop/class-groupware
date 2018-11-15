package com.ja.classgroupware.base.vo;

import java.util.Date;

public class User_classVO {

	private int user_idx;
	private int class_idx;
	private String user_status;
	private Date class_joindate;

	public User_classVO() {
		
	}
	
	public User_classVO(int user_idx, int class_idx, String user_status, Date class_joindate) {
		super();
		this.user_idx = user_idx;
		this.class_idx = class_idx;
		this.user_status = user_status;
		this.class_joindate = class_joindate;
	}

	public int getUser_idx() {
		return user_idx;
	}

	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	public String getUser_status() {
		return user_status;
	}

	public void setUser_status(String user_status) {
		this.user_status = user_status;
	}

	public Date getClass_joindate() {
		return class_joindate;
	}

	public void setClass_joindate(Date class_joindate) {
		this.class_joindate = class_joindate;
	}

}
