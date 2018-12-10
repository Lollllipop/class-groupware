package com.ja.classgroupware.base.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter 			// 각 필드에 대한 getter 자동 생성
@Setter				// 각 필드에 대한 setter 자동 생성
@NoArgsConstructor	// 파라미터가 하나도 없는 기본 생성자 자동 생성
@AllArgsConstructor	// 모든 필드를 파라미터로 가지는 생성자 자동 생성
public class ClassVO {

	private int class_idx;
	private String class_name;
	private String class_about;
	private Date class_startdate;
	private Date class_enddate;
	
	public int getClass_idx() {
		return class_idx;
	}
	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}
	public String getClass_name() {
		return class_name;
	}
	public void setClass_name(String class_name) {
		this.class_name = class_name;
	}
	public String getClass_about() {
		return class_about;
	}
	public void setClass_about(String class_about) {
		this.class_about = class_about;
	}
	public Date getClass_startdate() {
		return class_startdate;
	}
	public void setClass_startdate(Date class_startdate) {
		this.class_startdate = class_startdate;
	}
	public Date getClass_enddate() {
		return class_enddate;
	}
	public void setClass_enddate(Date class_enddate) {
		this.class_enddate = class_enddate;
	}
	@Override
	public String toString() {
		return "ClassVO [class_idx=" + class_idx + ", class_name=" + class_name + ", class_about=" + class_about
				+ ", class_startdate=" + class_startdate + ", class_enddate=" + class_enddate + "]";
	}
	
	
}
