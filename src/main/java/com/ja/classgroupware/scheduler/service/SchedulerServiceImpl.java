package com.ja.classgroupware.scheduler.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.SchedulerDAO;
import com.ja.classgroupware.base.vo.SchedulerVO;

@Service("SchedulerService")
public class SchedulerServiceImpl implements SchedulerService {
	@Autowired
	private SchedulerDAO schedulerDAO;
	
	Map<String, Object> paramMap;

	@Override
	public ArrayList<SchedulerVO> selectAll(int class_idx) throws Exception {
		
		paramMap = new HashMap<String, Object>();
 		paramMap.put("class_idx", class_idx);
 		ArrayList<SchedulerVO> list = schedulerDAO.selectAll(paramMap);
 		
 		return list;
	}

	@Override
	public void insert(SchedulerVO schedulerdvo) throws Exception {
		schedulerDAO.insert(schedulerdvo);
	}

	@Override
	public void update(SchedulerVO schedulerdvo) throws Exception {
		schedulerDAO.update(schedulerdvo);
	}

	@Override
	public SchedulerVO selectDetail(int scheduler_idx) throws Exception {

		SchedulerVO list = schedulerDAO.selectDetail(scheduler_idx);
		
		return list;
	}

	@Override
	public void delete(int scheduler_idx) throws Exception {
		schedulerDAO.delete(scheduler_idx);
		
	}

}
