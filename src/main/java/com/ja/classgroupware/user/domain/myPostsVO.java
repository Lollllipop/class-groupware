package com.ja.classgroupware.user.domain;

public class myPostsVO {
	
	private Integer bo_idx;
	private Integer class_idx;
	private String bo_title;
	private String bo_role;
	private String class_name;
	public Integer getBo_idx() {
		return bo_idx;
	}
	public void setBo_idx(Integer bo_idx) {
		this.bo_idx = bo_idx;
	}
	public Integer getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(Integer class_idx) {
		this.class_idx = class_idx;
	}
	public String getBo_title() {
		return bo_title;
	}
	public void setBo_title(String bo_title) {
		this.bo_title = bo_title;
	}
	public String getBo_role() {
		return bo_role;
	}
	public void setBo_role(String bo_role) {
		this.bo_role = bo_role;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	
	@Override
	public String toString() {
		return "BoardVO [bo_idx=" + bo_idx + ", class_idx=" + class_idx + ", bo_title=" + bo_title + ", bo_role="
				+ bo_role + ", class_name=" + class_name + "]";
	}
	
}
