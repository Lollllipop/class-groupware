package com.ja.classgroupware.attendance.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.ja.classgroupware.attendance.domain.AttendanceDTO;
import com.ja.classgroupware.attendance.service.AttendanceService;

@RestController
@RequestMapping("/attendanceajax")
public class AttendanceRestController {
	
	@Autowired
	private AttendanceService attendanceService;
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public Map<String, Object> attendanceList(@RequestParam("dateText") String dateText, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Map<String, Object> datas = new HashMap<String, Object>();
		
		int class_idx = 1;
		
		ArrayList<AttendanceDTO> list = attendanceService.selectAttendanceList(dateText, class_idx);
		
		datas.put("list", list);

		return datas;
	}
	
}