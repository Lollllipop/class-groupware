package com.ja.classgroupware.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.domain.SearchInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.DateConverter;
import com.ja.classgroupware.base.util.FileUploadManager;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.base.vo.FilesVO;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.CommentDTO;
import com.ja.classgroupware.board.domain.UploadedLinkDTO;
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
	private DateConverter 	dateConverter;


	@RequestMapping(value="", method= RequestMethod.GET)
	public Map<String,	Object> readAll(@ModelAttribute("cri") PageInfo pageInfo, HttpServletRequest request) throws Exception {
		Map<String,	Object> datas = new HashMap<String, Object>();
		
		classManager 	= new ClassManager(request);
		int class_idx 	= classManager.getClassIdx();
		dateConverter 	= new DateConverter();
		
		String searchValue 		= request.getParameter("searchvalue");
		String searchType 		= request.getParameter("searchtype");
		SearchInfo searchInfo 	= new SearchInfo(searchValue, searchType);
		
		ArrayList<BoardDTO> posts = openBoardService.getPageList(pageInfo, searchInfo, class_idx, boardSeparator);

		int selectedPostsCount = openBoardService.getSelectedPostsCount(searchType, searchValue);
		
		pageMaker = new PageMaker(pageInfo, selectedPostsCount);
		
		PagingNavInfo 		pagingNavInfo 	= pageMaker.make();
		
		for (int i = 0, j = 0; i < posts.size(); i++, j++) {
			posts.get(i).setBo_convertedwritedate(dateConverter.convert(posts.get(i).getBo_writedate()));
			posts.get(i).setBo_isNew(posts.get(i).getBo_convertedwritedate().equals("방금 전") ? "true" : "false");
			
			if (posts.get(i).getBo_isnotice().equals("true")) {
				j--;
				continue;
			}
			
			posts.get(i).setView_idx(selectedPostsCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + j));
		}
		
		datas.put("posts", posts);
		datas.put("pagingNavInfo", pagingNavInfo);
		
		return datas;
	}
	
	@RequestMapping(value="/image",  method = RequestMethod.POST)
	public UploadedLinkDTO addImage(MultipartFile file, HttpServletRequest request) throws Exception {
		/**
		 * 게시글 작성시 이미지와 게시글이 따로 올라가도록 설계가 되어있는데 (에디터 사용의 특성상)
		 * 이미지가 옹라가고 게시글이 오류로 인해 안올라갈 경우를 해결할 transaction을 걸고 싶으나 
		 * 마땅히 방도가 생각이 안남. 그냥 로직적으로 처리라도 해야하는게 맞을듯 시간이 나면 (리팩토링 대상임)
		 */
		UploadedLinkDTO uploadedLinkDTO = new UploadedLinkDTO();
		
		FileUploadManager fileUploadManager = new FileUploadManager();
		
		fileUploadManager.setPath("openboard", request);
		fileUploadManager.upload(file);
		
		classManager = new ClassManager(request);
		
		FilesVO filesVO = new FilesVO();
		filesVO.setClass_idx(classManager.getClassIdx());
		filesVO.setFile_link(fileUploadManager.getUploadedLink());
		filesVO.setFile_name(file.getOriginalFilename());
		filesVO.setFile_role(boardSeparator);
		
		openBoardService.addPostImage(filesVO);
		
		String uploadedLink = fileUploadManager.getUploadedLink();
		
		uploadedLinkDTO.setLink(uploadedLink);

		return uploadedLinkDTO;
	}
	
	@RequestMapping(value="/image",  method = RequestMethod.DELETE)
	public void removeImage(@RequestBody Map<String, String> json, HttpServletRequest request) throws Exception {
		String fileLink = json.get("src");
		
		// DB에 삭제
		openBoardService.removePostImage(fileLink);
		
		// 물리 파일 삭제
		FileUploadManager fileUploadManager = new FileUploadManager();
		fileUploadManager.setRealPath(request);
		fileUploadManager.delete(fileLink);
	}

	@RequestMapping(value="/recommandSeachKeyword",  method = RequestMethod.GET)
	public ArrayList<String> readRecommandSeachKeyword(
			@RequestParam String debouncedsearchkeyword, 
			@RequestParam String searchtype,
			HttpServletRequest request) throws Exception {
		
		return openBoardService.getKeyword(searchtype, debouncedsearchkeyword);
	}
	
	@RequestMapping(value="/{bo_idx}/comments/{comment_idx}",  method = RequestMethod.PATCH)
	public void updateComment(
			@PathVariable("bo_idx") Integer bo_idx,
			@PathVariable("comment_idx") Integer comment_idx,
			@RequestBody Map<String, String> json,
			HttpServletRequest request) throws Exception {
		
		openBoardService.updateComment(comment_idx, json.get("comm_content"));
	}
	
	@RequestMapping(value="/{bo_idx}/comments/{comm_parent_idx}/recomments/new",  method = RequestMethod.POST)
	public void makeReComment(
			@PathVariable("bo_idx") Integer bo_idx,
			@PathVariable("comm_parent_idx") Integer comm_parent_idx,
			@RequestBody Map<String, String> json,
			HttpServletRequest request) throws Exception {
		
		CommentDTO commentDTO = new CommentDTO();
		
		classManager 		= new ClassManager(request);
		int user_idx 		= classManager.getUserIdx();
		
		// 해당 board의 commets 갯수 1 증가 시킴
		openBoardService.addOneAtComments(bo_idx);
		
		// 값 셋팅
		commentDTO.setBo_idx(bo_idx);
		commentDTO.setComm_content(json.get("comm_content"));
		commentDTO.setComm_role(boardSeparator);
		commentDTO.setUser_idx(user_idx);
		commentDTO.setComm_parent_idx(comm_parent_idx);
		
		// 커멘트 생성
		openBoardService.addReComment(commentDTO);
	}
	
	
}
