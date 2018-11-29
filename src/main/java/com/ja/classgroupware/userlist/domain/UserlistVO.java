package com.ja.classgroupware.userlist.domain;

import java.util.Date;

public class UserlistVO {
	
	private Integer user_idx;
	private Integer class_idx;
	private String user_status;
	private Date class_joindate;
	private String user_name;
	private String user_email;
	private String user_role;
	
	public Integer getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(Integer user_idx) {
		this.user_idx = user_idx;
	}
	public Integer getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(Integer class_idx) {
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
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	
	@Override
	public String toString() {
		return "UserlistVO [user_idx=" + user_idx + ", class_idx=" + class_idx + ", user_status=" + user_status
				+ ", class_joindate=" + class_joindate + ", user_name=" + user_name + ", user_email=" + user_email
				+ ", user_role=" + user_role + "]";
	}
	
}