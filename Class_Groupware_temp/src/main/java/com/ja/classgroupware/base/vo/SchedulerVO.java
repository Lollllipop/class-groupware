package com.ja.classgroupware.base.vo;

import java.sql.Date;

public class SchedulerVO {

	private int scheduler_idx;
	private int class_idx;
	private String scheduler_content;
	private Date scheduler_startdate;
	private Date scheduler_enddate;

	public SchedulerVO(int scheduler_idx, int class_idx, String scheduler_content, Date scheduler_startdate,
			Date scheduler_enddate) {
		super();
		this.scheduler_idx = scheduler_idx;
		this.class_idx = class_idx;
		this.scheduler_content = scheduler_content;
		this.scheduler_startdate = scheduler_startdate;
		this.scheduler_enddate = scheduler_enddate;
	}

	public int getScheduler_idx() {
		return scheduler_idx;
	}

	public void setScheduler_idx(int scheduler_idx) {
		this.scheduler_idx = scheduler_idx;
	}

	public int getClass_idx() {
		return class_idx;
	}

	public void setClass_idx(int class_idx) {
		this.class_idx = class_idx;
	}

	public String getScheduler_content() {
		return scheduler_content;
	}

	public void setScheduler_content(String scheduler_content) {
		this.scheduler_content = scheduler_content;
	}

	public Date getScheduler_startdate() {
		return scheduler_startdate;
	}

	public void setScheduler_startdate(Date scheduler_startdate) {
		this.scheduler_startdate = scheduler_startdate;
	}

	public Date getScheduler_enddate() {
		return scheduler_enddate;
	}

	public void setScheduler_enddate(Date scheduler_enddate) {
		this.scheduler_enddate = scheduler_enddate;
	}

}
