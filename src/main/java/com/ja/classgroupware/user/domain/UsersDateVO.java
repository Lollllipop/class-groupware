package com.ja.classgroupware.user.domain;

import java.util.Date;

public class UsersDateVO {
	
	private int user_idx;
	private String user_id;
	private String user_email;
	private String user_name;
	private String user_password;
	private String user_role;
	private Date user_joindate;
	public int getUser_idx() {
		return user_idx;
	}
	public void setUser_idx(int user_idx) {
		this.user_idx = user_idx;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_role() {
		return user_role;
	}
	public void setUser_role(String user_role) {
		this.user_role = user_role;
	}
	public Date getUser_joindate() {
		return user_joindate;
	}
	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}
	
	@Override
	public String toString() {
		return "UsersDateVO [user_idx=" + user_idx + ", user_id=" + user_id + ", user_email=" + user_email
				+ ", user_name=" + user_name + ", user_password=" + user_password + ", user_role=" + user_role
				+ ", user_joindate=" + user_joindate + "]";
	}
	
}
