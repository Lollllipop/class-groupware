package com.ja.classgroupware.board.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ja.classgroupware.base.persistence.AlertDAO;

@Controller
@RequestMapping("/openboard")
public class OpenBoardController {
	
	@Autowired
	private AlertDAO boardMapper;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		// throw new Exception();
		
		// 임시 코드...
/*		AlertVO alertVO = new AlertVO(2,2,2,"2",2,"2");
		boardMapper.insert(alertVO);*/
		System.out.println("개선 성공!!!!!!!!!!!!");
		//
		
		return "template";
	}
	
}
