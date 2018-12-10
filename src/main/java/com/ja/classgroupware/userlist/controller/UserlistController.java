package com.ja.classgroupware.userlist.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.*;
import java.util.Map;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.vo.User_classVO;
import com.ja.classgroupware.userlist.domain.UserlistVO;
import com.ja.classgroupware.userlist.service.UserlistService;

@Controller
public class UserlistController {

	private static final Logger logger = LoggerFactory.getLogger(UserlistController.class);
	
	@Inject
	private UserlistService service;
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		System.out.println("개선 성공!!!!!!!!!!!!");
		
		return "/entity/user_list/user_list";
	}
	
	
	@RequestMapping(value = "/userList/register", method = RequestMethod.GET)
	  public void registerGET(User_classVO user_class, Model model) throws Exception {

	    logger.info("register get ...........");
	  }
	
	@RequestMapping(value = "/userList/register", method = RequestMethod.POST)
	  public String registPOST(User_classVO user_class, RedirectAttributes rttr) throws Exception {

	    logger.info("regist post ...........");
	    logger.info(user_class.toString());

	    service.regist(user_class);

	    rttr.addFlashAttribute("msg", "SUCCESS");
	    // 수강신청 후에는 마이페이지나 클래스리스트가 좋을 듯함
	    return "redirect:/userList/listAll";
	    //return "redirect:/user_list/user_list";
	  }
	
	@RequestMapping(value = "/userList/listAll", method = RequestMethod.GET)
	  public String listAll(Model model) throws Exception {
		String page = "/entity/user_list/user_list";
		int class_idx=1;
	    logger.info("show all list......................");
	    model.addAttribute("list", service.listAll(class_idx));
	    
	    return page;
	  }
	
	  @RequestMapping(value = "/userList/remove", method = RequestMethod.POST)
	  public String remove(@RequestParam("user_idx") int user_idx, RedirectAttributes rttr) throws Exception {
		  int class_idx=1;
		  
		  
		  Map<String, Object> parameters = new HashMap<String, Object>();
		    parameters.put("h", user_idx);
		    parameters.put("h2", class_idx);

	    service.remove(parameters);

	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/userList/listAll";
	  }
	
	  @RequestMapping(value = "/userList/modify", method = RequestMethod.POST)
	  public String modify(@RequestParam("user_idx") int user_idx, RedirectAttributes rttr) throws Exception {
		  int class_idx=1;
	    logger.info("mod post............");
	    
	    Map<String, Object> parameters = new HashMap<String, Object>();
	    parameters.put("h", user_idx);
	    parameters.put("h2", class_idx);
	    
	    service.modify(parameters);
	    rttr.addFlashAttribute("msg", "SUCCESS");

	    return "redirect:/userList/listAll";
	  }
	
	
}