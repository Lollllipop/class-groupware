package com.ja.classgroupware.board.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.persistence.AlertDAO;
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

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String readAll(Model model) throws Exception {
		String page = "entity/open_board/open_board_list";
		
		// 로직적으로 받아올것임 실제론
		int class_idx = 1;
		
		model.addAttribute("posts", openBoardService.getAll(class_idx, boardSeparator));
		model.addAttribute("totalCount", openBoardService.getTotalCount());
		
		return page;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String make(RedirectAttributes rttr) throws Exception {
		
		
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/openboard";
	}
	
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.GET)
	public String readDetail(@PathVariable("bo_idx") Integer bo_idx, Model model) throws Exception {
		String page = "entity/open_board/open_board_detail";
		
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
