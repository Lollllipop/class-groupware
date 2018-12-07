package com.ja.classgroupware.scheduler.controller;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ja.classgroupware.base.vo.SchedulerVO;
import com.ja.classgroupware.scheduler.service.SchedulerService;

@Controller
@RequestMapping("/scheduler")
public class SchedulerController {
	
	@Autowired
	private SchedulerService schedulerService;
	
	/**
	 * @throws Exception
	 */
	@RequestMapping(value = "/st", method = RequestMethod.GET)
	public String scheduler_student(Model model) throws Exception {
		String page = "entity/scheduler/scheduler_student";
		
		int class_idx = 1;
		
		ArrayList<SchedulerVO> list = schedulerService.selectAll(class_idx);
		
		model.addAttribute("list", list);
		
 		return page;
	}
	
	@RequestMapping(value = "/tch", method = RequestMethod.GET)
	public String scheduler_teacher(Model model) throws Exception {
		String page = "entity/scheduler/scheduler_teacher";
		
		int class_idx = 1;
		
		ArrayList<SchedulerVO> list = schedulerService.selectAll(class_idx);
		
		model.addAttribute("list", list);
		
 		return page;
	}
	
	@RequestMapping(value = "/tch/date={scheduler_startdate}", method = RequestMethod.GET)
	public String scheduler_writeGET(@PathVariable("scheduler_startdate") Date scheduler_startdate, Model model) throws Exception {
		String page = "entity/scheduler/scheduler_write";
		
		model.addAttribute("scheduler_startdate", scheduler_startdate); 
		
 		return page;
	}
	
	@RequestMapping(value = "/tch/idx={scheduler_idx}", method = RequestMethod.GET)
	public String scheduler_updateGET(@PathVariable("scheduler_idx") int scheduler_idx, Model model) throws Exception {
		String page = "entity/scheduler/scheduler_update";
		
		SchedulerVO list = schedulerService.selectDetail(scheduler_idx);
		
		model.addAttribute("list", list); 
		
 		return page;
	}
	
	@RequestMapping(value = "/tch/insert", method = RequestMethod.POST)
	public String scheduler_writePOST(SchedulerVO schedulerdvo, Model model) throws Exception {
		String page = "entity/scheduler/scheduler_write";
		schedulerService.insert(schedulerdvo);
		return page;
	}
	
	@RequestMapping(value = "/tch/update", method = RequestMethod.POST)
	public String scheduler_updatePOST(SchedulerVO schedulerdvo, Model model) throws Exception {
		String page = "entity/scheduler/scheduler_update";
		schedulerService.update(schedulerdvo);
		return page;
	}
	
	@RequestMapping(value = "/tch/delete", method = RequestMethod.POST)
	public String scheduler_deletePOST(int scheduler_idx, Model model) throws Exception {
		String page = "entity/scheduler/scheduler_update";
		schedulerService.delete(scheduler_idx);
		return page;
	}
}
