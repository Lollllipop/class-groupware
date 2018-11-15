package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.SchedulerVO;

public interface SchedulerDAO {
	
	public void insert(SchedulerVO vo) throws Exception;

	public SchedulerVO selectByIdx(int scheduler_idx) throws Exception;

	public List<SchedulerVO> selectAll() throws Exception;

	public void update(SchedulerVO vo) throws Exception;

	public void delete(int scheduler_idx) throws Exception;
	
}
