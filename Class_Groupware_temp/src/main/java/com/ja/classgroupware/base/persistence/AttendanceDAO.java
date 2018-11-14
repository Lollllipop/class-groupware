package com.ja.classgroupware.base.persistence;

import java.sql.Date;
import java.util.List;

import com.ja.classgroupware.base.vo.AttendanceVO;

public interface AttendanceDAO {

	public void insert(AttendanceVO vo) throws Exception;
	
	public AttendanceVO selectByIdx(int attendace_idx) throws Exception;
	
	public List<AttendanceVO> selectAll() throws Exception;
	
	public void update(AttendanceVO vo) throws Exception;
	
	public void delete(int attendace_idx) throws Exception;
	

}
