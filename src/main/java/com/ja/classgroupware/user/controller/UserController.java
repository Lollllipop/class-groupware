package com.ja.classgroupware.user.controller;

import java.util.*;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.user.domain.UsersDateVO;
import com.ja.classgroupware.user.service.UserService;

@Controller
public class UserController {

private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Inject
	private UserService service;
	
	@RequestMapping(value = "/myPage", method = RequestMethod.GET)
	  public String listAll(Model model) throws Exception {
		String page = "/entity/user/my_page";
		int user_idx=1;
	    logger.info("show all list......................");
	    model.addAttribute("list", service.listAll(user_idx));
	    model.addAttribute("usersVO",service.read(user_idx));
	    
	    return page;
	  }
	
	@RequestMapping(value = "/myPage/modify", method = RequestMethod.GET)
	public  String modifyGET(int user_idx, Model model) throws Exception {
		String page = "/entity/user/my_page_modify";
		model.addAttribute("usersVO",service.read(user_idx));
		return page;
	}
	
	
	@RequestMapping(value ="/myPage/modify", method = RequestMethod.POST)
	public String modifyPOST( UsersDateVO users, Model model, RedirectAttributes rttr) throws Exception {
	
		logger.info("mod post............");
		service.modify(users);
		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/myPage";
	}
	
}