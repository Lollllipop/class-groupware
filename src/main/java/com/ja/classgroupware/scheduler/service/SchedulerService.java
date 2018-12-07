package com.ja.classgroupware.scheduler.service;

import java.util.ArrayList;

import com.ja.classgroupware.base.vo.SchedulerVO;

public interface SchedulerService {
	
	public ArrayList<SchedulerVO> selectAll(int class_idx) throws Exception;
	
	public void insert(SchedulerVO schedulerdvo) throws Exception;
	
	public void update(SchedulerVO schedulerdvo) throws Exception;
	
	public SchedulerVO selectDetail(int scheduler_idx) throws Exception;
	
	public void delete(int scheduler_idx) throws Exception;
}
