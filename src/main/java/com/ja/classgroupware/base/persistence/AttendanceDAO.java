package com.ja.classgroupware.base.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ja.classgroupware.attendance.domain.AttendanceDTO;
import com.ja.classgroupware.base.vo.AttendanceVO;

public interface AttendanceDAO {
	
	public AttendanceVO selectByIdx(int attendace_idx) throws Exception;
	
	public List<AttendanceVO> selectAll() throws Exception;
	
	public void update(AttendanceVO vo) throws Exception;
	
	public void delete(int attendace_idx) throws Exception;
	
	
	
	//custom
	public void insert(AttendanceDTO check) throws Exception;
	
	public ArrayList<AttendanceDTO> selectList(Map<String, Object> paramMap) throws Exception;
	
	public ArrayList<AttendanceDTO> selectDetail(Map<String, Object> paramMap) throws Exception;

	public ArrayList<AttendanceDTO> selectAttendanceList(Map<String, Object> paramMap) throws Exception;
	

}
