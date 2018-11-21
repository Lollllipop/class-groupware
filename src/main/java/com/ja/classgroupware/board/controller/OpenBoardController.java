package com.ja.classgroupware.board.controller;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.service.OpenBoardService;

// board : 게시판
// post : 게시글
// posts : 게시글 여러개

@Controller
@RequestMapping("/openboard")
public class OpenBoardController {
	
	@Autowired
	private OpenBoardService openBoardService;
	
	@Value("${separator.openboard}")
	private String boardSeparator;
	
	private ClassManager 	classManager;
	private PageMaker 		pageMaker;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String readAll(@ModelAttribute("pageInfo") PageInfo pageInfo, Model model, HttpServletRequest request) throws Exception {
		String page 	= "entity/open_board/open_board_list";
		classManager 	= new ClassManager(request);
		int class_idx 	= classManager.getClassIdx();
		
		ArrayList<BoardDTO> posts 			= openBoardService.getPageList(pageInfo, class_idx, boardSeparator);
		int 				totalCount 		= openBoardService.getTotalCount();
		
		// 페이지메이커 생성
		pageMaker = new PageMaker(pageInfo, totalCount);
		
		// 페이지 정보 생성
		PagingNavInfo 		pagingNavInfo 	= pageMaker.make();
		
		for (int i = 0; i < posts.size(); i++) {
			posts.get(i).setView_idx(totalCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + i));
		}
		
		// 공지
		
		// 페이지 정보 view로 전달
		model.addAttribute("posts", posts);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("pagingNavInfo", pagingNavInfo);
		
		return page;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String make(RedirectAttributes rttr) throws Exception {
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/openboard";
	}
	
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.GET)
	public String readDetail(@PathVariable("bo_idx") Integer bo_idx, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/open_board/open_board_detail";
		
		openBoardService.addOneAtViews(bo_idx);
		
		model.addAttribute("prevPage", request.getHeader("referer"));
		// 총 3개를 model에 담으면 됨
		// 리스트 디테일
		model.addAttribute("post", openBoardService.getDetail(bo_idx));
		// 첨부된 파일들
		// 댓글들
		
		return page;
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String regist(Model model) throws Exception {
		String page = "entity/open_board/open_board_write";
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value = "/uploadfiles", method = RequestMethod.POST)
	public ResponseEntity<String> upload(MultipartFile file) throws Exception {
		ResponseEntity<String> entity = null;
		System.out.println(file.getOriginalFilename());
		return entity;
	}
	
}
