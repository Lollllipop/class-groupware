package com.ja.classgroupware.attendance.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ja.classgroupware.attendance.domain.AttendanceDTO;
import com.ja.classgroupware.base.persistence.AttendanceDAO;
import com.ja.classgroupware.base.persistence.ClassDAO;
import com.ja.classgroupware.base.vo.AttendanceVO;
import com.ja.classgroupware.base.vo.ClassVO;

@Service("AttendanceService")
public class AttendanceServiceImpl implements AttendanceService {
	@Autowired
	private AttendanceDAO attendanceDAO;
	
	@Autowired
	private ClassDAO classDAO;

	Map<String, Object> paramMap;

	@Override
	@Transactional
	public ArrayList<AttendanceDTO> selectList(int class_idx) throws Exception {
		
		paramMap = new HashMap<String, Object>();

		paramMap.put("class_idx", class_idx);

		ArrayList<AttendanceDTO> list = attendanceDAO.selectList(paramMap);
		
		return list;
	}

	@Override
	public ArrayList<AttendanceDTO> selectDetail(int class_idx, int user_idx) throws Exception {
		
		paramMap = new HashMap<String, Object>();

		paramMap.put("class_idx", class_idx);
		paramMap.put("user_idx", user_idx);

		ArrayList<AttendanceDTO> list = attendanceDAO.selectDetail(paramMap);

		return list;
	}

	@Override
	public ArrayList<AttendanceDTO> selectAttendanceList(String dateText, int class_idx) throws Exception {
		
		paramMap = new HashMap<String, Object>();
		ArrayList<AttendanceDTO> list = new ArrayList<AttendanceDTO>();
		
		paramMap.put("dateText", dateText);
		paramMap.put("class_idx", class_idx);

		list = attendanceDAO.selectAttendanceList(paramMap);
		
		for(int i=0; i<list.size();i++) {
			System.out.println(list.get(i).getUser_name() + "/" + list.get(i).getAttendance_event()+ "/" + list.get(i).getAttendance_idx());
		}
			
		return list;
	}

	@Override
	public void insert(AttendanceDTO check) throws Exception {
		
		for(int i=0; i<check.getCheck().size();i++) {
			attendanceDAO.insert(check.getCheck().get(i));
		}
		
	}

	@Override
	public ClassVO selectClass(int class_idx) throws Exception {
		ClassVO classList = classDAO.read(class_idx);
		
		System.out.println( classList.getClass_name() + "/" + classList.getClass_startdate() + "/" + classList.getClass_enddate() + "/" + classList.getClass_idx() + "/" );
		
		
		return classList;
	}
	
}