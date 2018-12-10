package com.ja.classgroupware.attendance.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.ja.classgroupware.attendance.domain.AttendanceDTO;
import com.ja.classgroupware.base.vo.AttendanceVO;
import com.ja.classgroupware.base.vo.ClassVO;

public interface AttendanceService {

	public ArrayList<AttendanceDTO> selectList(int class_idx) throws Exception;
	
	public ArrayList<AttendanceDTO> selectAttendanceList(String dateText, int class_idx) throws Exception;

	public ArrayList<AttendanceDTO> selectDetail(int class_idx, int user_idx) throws Exception;
	
	public void insert(AttendanceDTO check) throws Exception;

	public ClassVO selectClass(int class_idx) throws Exception;
	
}