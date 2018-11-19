package com.ja.classgroupware.alert.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ja.classgroupware.base.persistence.AlertDAO;
import com.ja.classgroupware.base.vo.AlertVO;

@Controller
public class HomeController {
	
	@Autowired
	private AlertDAO boardMapper;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * @throws Exception
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		return "template";
	}
	
}
