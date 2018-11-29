package com.ja.classgroupware.attendance.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.attendance.domain.AttendanceDTO;
import com.ja.classgroupware.attendance.domain.AttendanceListDTO;
import com.ja.classgroupware.attendance.service.AttendanceService;
import com.ja.classgroupware.base.persistence.AttendanceDAO;
import com.ja.classgroupware.base.vo.AttendanceVO;
import com.ja.classgroupware.base.vo.ClassVO;

@Controller
@RequestMapping("/attendance")
public class AttendanceController {

	@Autowired
	private AttendanceService attendanceService;
	
	
	/**
	 * @throws Exception
	 */
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String attendanceGET(Model model) throws Exception {
		String page = "entity/attendance/attendance_teacher";
		
		int class_idx = 1;
		/*ArrayList<AttendanceDTO> list = attendanceService.selectList(class_idx);*/
		
		
		Date today = new Date();
		SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
		String dateText = date.format(today);
		
		ArrayList<AttendanceDTO> list = attendanceService.selectAttendanceList(dateText, class_idx);
		ClassVO classList = attendanceService.selectClass(class_idx);
		
		model.addAttribute("list", list);
		model.addAttribute("classList", classList);

		return page;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String attendancePOST(AttendanceDTO check, AttendanceDTO attendance_date, Model model) throws Exception {
		
		
		for(int i=0; i<check.getCheck().size();i++) {
			check.getCheck().get(i).setAttendance_date(attendance_date.getAttendance_date());
		}
		
		attendanceService.insert(check);
		
		return "redirect:/attendance";
		
	}
	
	@RequestMapping(value = "/{user_idx}", method = RequestMethod.GET)
	public String attendanceDetail(@PathVariable("user_idx") int user_idx, Model model) throws Exception {
		String page = "entity/attendance/attendance_student";
		
		int class_idx = 1;
		
		ArrayList<AttendanceDTO> list = attendanceService.selectDetail(class_idx, user_idx);
		ClassVO classList = attendanceService.selectClass(class_idx);
		
		model.addAttribute("list", list);
		model.addAttribute("classList", classList);

		return page;
	}

}