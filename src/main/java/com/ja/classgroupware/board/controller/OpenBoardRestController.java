package com.ja.classgroupware.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.DateConverter;
import com.ja.classgroupware.base.util.FileUploadManager;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.base.vo.FilesVO;
import com.ja.classgroupware.board.domain.BoardDTO;
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
		
		ArrayList<BoardDTO> posts 			= openBoardService.getPageList(pageInfo, class_idx, boardSeparator);
		int 				totalCount 		= openBoardService.getTotalCount();
		
		pageMaker = new PageMaker(pageInfo, totalCount);
		
		PagingNavInfo 		pagingNavInfo 	= pageMaker.make();
		
		for (int i = 0; i < posts.size(); i++) {
			posts.get(i).setView_idx(totalCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + i));
			posts.get(i).setBo_convertedwritedate(dateConverter.convert(posts.get(i).getBo_writedate()));
		}
		
		datas.put("posts", posts);
		datas.put("pagingNavInfo", pagingNavInfo);
		
		return datas;
	}
	
	@RequestMapping(value="/image",  method = RequestMethod.POST)
	public UploadedLinkDTO addImage(MultipartFile file, HttpServletRequest request) throws Exception {
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
	
}
