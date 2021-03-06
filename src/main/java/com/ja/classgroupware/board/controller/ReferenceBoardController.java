package com.ja.classgroupware.board.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;
import com.ja.classgroupware.base.domain.SearchInfo;
import com.ja.classgroupware.base.util.ClassManager;
import com.ja.classgroupware.base.util.DateConverter;
import com.ja.classgroupware.base.util.MediaUtils;
import com.ja.classgroupware.base.util.PageMaker;
import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.CommentDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;
import com.ja.classgroupware.board.domain.ThumbnailDTO;
import com.ja.classgroupware.board.service.ReferenceBoardService;

// board : 게시판
// post : 게시글
// posts : 게시글 여러개

@Controller
@RequestMapping("/referenceboard")
public class ReferenceBoardController {
	
	@Autowired
	private ReferenceBoardService referenceBoardService;
	
	@Value("${separator.referenceboard}")
	private String boardSeparator;
	
	private ClassManager 	classManager;
	private PageMaker 		pageMaker;
	private DateConverter 	dateConverter;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public String readAll(@ModelAttribute("pageInfo") PageInfo pageInfo, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/reference_board/reference_board_list";

		classManager 	= new ClassManager(request);
		int class_idx 	= classManager.getClassIdx();
		dateConverter 	= new DateConverter();
		
		String searchValue 		= request.getParameter("searchvalue");
		String searchType 		= request.getParameter("searchtype");
		SearchInfo searchInfo 	= new SearchInfo(searchValue, searchType);

		ArrayList<BoardDTO> posts = referenceBoardService.getPageList(pageInfo, searchInfo, class_idx, boardSeparator);
		
		int selectedPostsCount = referenceBoardService.getSelectedPostsCount(searchType, searchValue, boardSeparator);
		
		pageMaker = new PageMaker(pageInfo, selectedPostsCount);
		
		PagingNavInfo pagingNavInfo = pageMaker.make();
		
		for (int i = 0, j = 0; i < posts.size(); i++, j++) {
			posts.get(i).setBo_convertedwritedate(dateConverter.convert(posts.get(i).getBo_writedate()));
			posts.get(i).setBo_isNew(posts.get(i).getBo_convertedwritedate().equals("방금 전") ? "true" : "false");
			
			if (posts.get(i).getBo_isnotice().equals("true")) {
				j--;
				continue;
			}
			
			posts.get(i).setView_idx(selectedPostsCount - (((pagingNavInfo.getCurrentPage() - 1) * pageMaker.getCount()) + j));
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
		post.setBo_role(boardSeparator);
		post.setBo_isnotice(mrequest.getParameter("bo_isnotice") == null ? "false" : "true");
		post.setBo_hasfiles(mrequest.getParameter("bo_hasfiles").equals("false") ? "false" : "true");

		referenceBoardService.addPostContent(post);

		return "redirect:/referenceboard";
	}
	
	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String regist(Model model, HttpServletRequest request) throws Exception {
		String page = "entity/reference_board/reference_board_write";
		
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
		String page = "entity/reference_board/reference_board_detail";
		
		// 들어온 리스트로 이동하기 위한 코드
		String prevPage = null;
		
		if (request.getSession().getAttribute("updatedPostPrevPage") != null) {
			prevPage = (String) request.getSession().getAttribute("updatedPostPrevPage");
			request.getSession().removeAttribute("updatedPostPrevPage");
		} else {
			prevPage = request.getHeader("referer");
			request.getSession().setAttribute("updatedPostPrevPage", prevPage);
		}
		
		model.addAttribute("prevPage", prevPage);
		
		classManager = new ClassManager(request);
		int user_idx = classManager.getUserIdx();
		
		// 조회수 증가 시킴
		referenceBoardService.addOneAtViews(bo_idx);
		
		// 리스트 디테일
		PostMainDTO postMainDTO = referenceBoardService.getDetail(bo_idx);
		model.addAttribute("post", postMainDTO);
		
		// 파일 링크(파일링크, 썸네일링크) 리스트 보내기
		ArrayList<ThumbnailDTO> thumbnails = referenceBoardService.getThumbnails(bo_idx);
		for (ThumbnailDTO thumbnail : thumbnails) {
			thumbnail.setThumbnail_link(thumbnail.getFile_link());
			thumbnail.setFile_link(thumbnail.getThumbnail_link().replace("thumbnail_", ""));
			thumbnail.setFile_link_name(thumbnail.getFile_link().substring(thumbnail.getFile_link().lastIndexOf("/") + 1, thumbnail.getFile_link().length()));
		}
		model.addAttribute("thumbnails", thumbnails);
		
		// 작성자 본인인지 아닌지 구분하기 위한 정보
		boolean  isAuthor = postMainDTO.getUser_idx() == user_idx ? true : false;
		model.addAttribute("isAuthor", isAuthor);
		
		// 댓글들
		ArrayList<CommentDTO> comments = referenceBoardService.getComments(bo_idx);		
		
		// for 문 돌면서 date 상세하게 나타나도록 바꿔야할듯
		dateConverter 	= new DateConverter();
		
		for (int i = 0; i < comments.size(); i++) {
			comments.get(i).setComm_convertedwritedate(dateConverter.convert(comments.get(i).getComm_writedate()));
			
			// 자식을 부모의 배열에 넣고 리스트에서는 삭제해주는 작업이 필요할 듯
			if (comments.get(i).hasParent()) {
				for (int j = 0; j < i; j++) { 
					if (comments.get(i).getComm_parent_idx() == comments.get(j).getComment_idx()) {
						if (comments.get(j).getReComments() == null) {
							comments.get(j).setReComments(new ArrayList<>());
						}
						
						comments.get(j).getReComments().add(comments.get(i));
						
						comments.remove(i);
						i--;
						
						break;
					}
				}
			}
		}
		
		model.addAttribute("comments", comments);
		
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.DELETE)
	public String removePost(@PathVariable("bo_idx") Integer bo_idx, HttpServletRequest request) throws Exception {
		referenceBoardService.removePost(bo_idx);
		return "";
	}
	
	@ResponseBody
	@RequestMapping(value = "/{bo_idx}", method = RequestMethod.PATCH)
	public String updatePost(@PathVariable("bo_idx") Integer bo_idx, @RequestBody BoardVO boardVO, HttpServletRequest request) throws Exception {		
		if (boardVO.getBo_isnotice() == null) {
			boardVO.setBo_isnotice("false");
		}
		
		referenceBoardService.updatePost(boardVO);

		return "";
	}
	
	@RequestMapping(value = "/{bo_idx}/edit", method = RequestMethod.GET)
	public String getUpdatePostView(@PathVariable("bo_idx") Integer bo_idx, Model model, HttpServletRequest request) throws Exception {
		String page = "entity/reference_board/reference_board_update";
		
		classManager 		= new ClassManager(request);
		String 	user_role 	= classManager.getUserRole();
		
		PostMainDTO postMainDTO = referenceBoardService.getDetail(bo_idx);
		
		String prevPage = null;
		
		model.addAttribute("post", postMainDTO);
		model.addAttribute("hasNoticeAuth", user_role.equals("student") ? false : true);
		
		return page;
	}
	
	@RequestMapping(value = "/{bo_idx}/comments", method = RequestMethod.POST)
	public String getAfterCommentRegistredView(
			@PathVariable("bo_idx") Integer bo_idx, 
			@RequestParam(value = "comm_content")String comm_content,
			Model model, 
			HttpServletRequest request) throws Exception {
		String page = "redirect:/referenceboard/" + bo_idx;
		
		CommentDTO commentDTO = new CommentDTO();
		
		classManager 		= new ClassManager(request);
		int user_idx 		= classManager.getUserIdx();
		
		referenceBoardService.addOneAtComments(bo_idx);
		
		commentDTO.setBo_idx(bo_idx);
		commentDTO.setComm_content(comm_content);
		commentDTO.setComm_role(boardSeparator);
		commentDTO.setUser_idx(user_idx);
		
		referenceBoardService.addComment(commentDTO);
		
		return page;
	}
	
	@ResponseBody
	@RequestMapping(value = "/{bo_idx}/comments/{comment_idx}", method = RequestMethod.DELETE)
	public String removeComment(
			@PathVariable("bo_idx") Integer bo_idx,
			@PathVariable("comment_idx") Integer comment_idx,
			Model model, 
			HttpServletRequest request) throws Exception {
		referenceBoardService.removeComment(comment_idx);
		
		referenceBoardService.subOneAtComments(bo_idx);
		
		return "";
	}
	
	@ResponseBody
	@RequestMapping("/displayfile")
	public ResponseEntity<byte[]> displayFile(String file_link, HttpServletRequest request) throws Exception{
		String realFileLink = request.getSession().getServletContext().getRealPath("") + file_link.substring(1).replace("/", "\\");
		
	    InputStream in = null; 
	    ResponseEntity<byte[]> entity = null;
	    
	    System.out.println(file_link);
	    
	    try{
	    	
	      String formatName = file_link.substring(file_link.lastIndexOf(".")+1);
	      
	      MediaType mType = MediaUtils.getMediaType(formatName);
	      
	      HttpHeaders headers = new HttpHeaders();
	      
	      in = new FileInputStream(realFileLink);
	      
	      if(mType != null){
	        headers.setContentType(mType);
	      }else{
	    	  file_link = file_link.substring(file_link.indexOf("_")+1);     
	    	  
	    	  System.out.println(file_link);
	    	  
		      headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		      headers.add("Content-Disposition", "attachment; filename=\""+ new String(file_link.getBytes("UTF-8"), "ISO-8859-1")+"\"");
	      }

	        entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers,  HttpStatus.CREATED);
	    }catch(Exception e){
	    	e.printStackTrace();
	    	entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
	    }finally{
	    	in.close();
	    }
	    
	      return entity; 
	      
	  }
	
}
