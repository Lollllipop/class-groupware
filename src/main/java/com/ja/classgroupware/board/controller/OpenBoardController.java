package com.ja.classgroupware.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.domain.SearchInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.base.util.DateConverter;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;
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
	private DateConverter 	dateConverter;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String readAll(@ModelAttribute("pageInfo") PageInfo pageInfo, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/open_board/open_board_list";
		
		classManager 	= new ClassManager(request);
		int class_idx 	= classManager.getClassIdx();
		dateConverter 	= new DateConverter();
		
		String searchValue 		= request.getParameter("searchvalue");
		String searchType 		= request.getParameter("searchtype");
		SearchInfo searchInfo 	= new SearchInfo(searchValue, searchType);
		
		ArrayList<BoardDTO> posts = openBoardService.getPageList(pageInfo, searchInfo, class_idx, boardSeparator);
		
		int selectedPostsCount = openBoardService.getSelectedPostsCount(searchType, searchValue);
		
		pageMaker = new PageMaker(pageInfo, selectedPostsCount);
		
		PagingNavInfo pagingNavInfo = pageMaker.make();
		
		for (int i = 0, j = 0; i < posts.size(); i++, j++) {
			if (posts.get(i).getBo_isnotice().equals("true")) {
				posts.get(i).setBo_convertedwritedate(dateConverter.convert(posts.get(i).getBo_writedate()));
				j--;
				continue;
			}
			
			posts.get(i).setView_idx(selectedPostsCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + j));
			posts.get(i).setBo_convertedwritedate(dateConverter.convert(posts.get(i).getBo_writedate()));
		}
		
		model.addAttribute("posts", posts);
		model.addAttribute("totalCount", selectedPostsCount);
		model.addAttribute("searchInfo", searchInfo);
		model.addAttribute("pagingNavInfo", pagingNavInfo);
		
		return page;
	}
	
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String make(RedirectAttributes rttr, MultipartHttpServletRequest mrequest) throws Exception {
		rttr.addFlashAttribute("msg", "SUCCESS");
		
		BoardVO post = new BoardVO();
		post.setBo_title(mrequest.getParameter("bo_title"));
		post.setUser_idx(Integer.parseInt(mrequest.getParameter("user_idx")));
		post.setClass_idx(Integer.parseInt(mrequest.getParameter("class_idx")));
		post.setBo_content(mrequest.getParameter("bo_content"));
		post.setBo_role(mrequest.getParameter("bo_role"));
		post.setBo_isnotice(mrequest.getParameter("bo_isnotice") == null ? "false" : "true");
		post.setBo_hasfiles(mrequest.getParameter("bo_hasfiles").equals("false") ? "false" : "true");

		openBoardService.addPostContent(post);

		return "redirect:/openboard";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String regist(Model model, HttpServletRequest request) throws Exception {
		String page = "entity/open_board/open_board_write";
		
		classManager 		= new ClassManager(request);
		int 	class_idx 	= classManager.getClassIdx();
		int 	user_idx 	= classManager.getUserIdx();
		String 	user_name 	= classManager.getUserName();
		String 	user_role 	= classManager.getUserRole();
		
		model.addAttribute("class_idx", 	class_idx);
		model.addAttribute("user_idx", 		user_idx);
		model.addAttribute("user_name", 	user_name);
		model.addAttribute("bo_role", 		boardSeparator);
		model.addAttribute("prevPage", 		request.getHeader("referer"));
		model.addAttribute("hasNoticeAuth", user_role.equals("student") ? false : true );
		
		return page;
	}
	
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.GET)
	public String readDetail(@PathVariable("bo_idx") Integer bo_idx, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/open_board/open_board_detail";
		
		classManager = new ClassManager(request);
		int user_idx = classManager.getUserIdx();
		
		// 조회수 증가 시킴
		openBoardService.addOneAtViews(bo_idx);
		
		// 이전에 있던 리스트 페이지 위치를 위한 정보
		model.addAttribute("prevPage", request.getHeader("referer"));
		
		// TODO 총 3개를 model에 담으면 됨
		
		// 리스트 디테일
		PostMainDTO postMainDTO = openBoardService.getDetail(bo_idx);
		model.addAttribute("post", postMainDTO);
		
		// 작성자 본인인지 아닌지 구분하기 위한 정보
		boolean  isAuthor = postMainDTO.getUser_idx() == user_idx ? true : false;
		model.addAttribute("isAuthor", isAuthor);
		
		// 첨부된 파일들
		// 댓글들
		
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.DELETE)
	public String removePost(@PathVariable("bo_idx") Integer bo_idx, HttpServletRequest request) throws Exception {
		openBoardService.removePost(bo_idx);
		// TODO 파일 실제로 삭제할 것
		// TODO 삭제된 메세지 띄우기 위해서 데이터 더 보내야 함
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.PATCH)
	public String updatePost(@PathVariable("bo_idx") Integer bo_idx, @RequestBody BoardVO boardVO, HttpServletRequest request) throws Exception {		
		if (boardVO.getBo_isnotice() == null) {
			boardVO.setBo_isnotice("false");
		}
		
		openBoardService.updatePost(boardVO);

		return "";
	}
	
	@RequestMapping(value = "/{bo_idx}/edit", method = RequestMethod.GET)
	public String getUpdatePostView(@PathVariable("bo_idx") Integer bo_idx, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/open_board/open_board_update";
		
		classManager 		= new ClassManager(request);
		String 	user_role 	= classManager.getUserRole();
		
		PostMainDTO postMainDTO = openBoardService.getDetail(bo_idx);
		
		model.addAttribute("post", postMainDTO);
		model.addAttribute("hasNoticeAuth", user_role.equals("student") ? false : true);
		
		return page;
	}
	
}
