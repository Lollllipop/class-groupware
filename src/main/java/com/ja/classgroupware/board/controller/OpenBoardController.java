package com.ja.classgroupware.board.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ja.classgroupware.base.persistence.AlertDAO;
import com.ja.classgroupware.board.service.OpenBoardService;

@Controller
@RequestMapping("/openboard")
public class OpenBoardController {
	
	@Autowired
	private OpenBoardService openBoardService;
	
	@Value("${separator.openboard}")
	private String boardSeparator;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		String page = "entity/open_board/open_board_list";
		
		// 로직적으로 받아올것임 실제론
		int class_idx = 1;
		
		model.addAttribute("boards", openBoardService.getAllList(class_idx, boardSeparator));
		model.addAttribute("totalCount", openBoardService.getTotalCount());
		
		return page;
	}
	
}
