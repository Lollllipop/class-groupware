package com.ja.classgroupware.base.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ja.classgroupware.base.vo.SchedulerVO;

public interface SchedulerDAO {


	/*public List<SchedulerVO> selectAll() throws Exception;*/

	/*custom*/
	public ArrayList<SchedulerVO> selectAll(Map<String, Object> paramMap) throws Exception;
	
	public void insert(SchedulerVO schedulerdvo) throws Exception;
	
	public void update(SchedulerVO schedulerdvo) throws Exception;
	
	public SchedulerVO selectDetail(int scheduler_idx) throws Exception;
	
	public void delete(int scheduler_idx) throws Exception;
	
}
