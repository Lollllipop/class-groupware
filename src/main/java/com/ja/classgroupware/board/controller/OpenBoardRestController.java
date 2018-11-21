package com.ja.classgroupware.board.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.service.OpenBoardService;

@RestController
@RequestMapping("/openboardajax")
public class OpenBoardRestController {
	
	@Autowired
	private OpenBoardService openBoardService;
	
	@Value("${separator.openboard}")
	private String boardSeparator;
	
	private ClassManager 	classManager;
	private PageMaker 		pageMaker;

	@RequestMapping(value="", method= RequestMethod.GET)
	public Map<String,	Object> readAll(@ModelAttribute("cri") PageInfo pageInfo, HttpServletRequest request) throws Exception {
		Map<String,	Object> datas = new HashMap<String, Object>();
		 
		classManager 	= new ClassManager(request);
		int class_idx 	= classManager.getClassIdx();
		
		ArrayList<BoardDTO> posts 			= openBoardService.getPageList(pageInfo, class_idx, boardSeparator);
		int 				totalCount 		= openBoardService.getTotalCount();
		
		pageMaker = new PageMaker(pageInfo, totalCount);
		
		PagingNavInfo 		pagingNavInfo 	= pageMaker.make();
		
		for (int i = 0; i < posts.size(); i++) {
			posts.get(i).setView_idx(totalCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + i));
		}
		
		datas.put("posts", posts);
		datas.put("pagingNavInfo", pagingNavInfo);
		
		return datas;
	}
	
}
