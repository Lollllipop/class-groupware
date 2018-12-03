package com.ja.classgroupware.board.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.SearchInfo;
import com.ja.classgroupware.base.persistence.BoardDAO;
import com.ja.classgroupware.base.persistence.CommentsDAO;
import com.ja.classgroupware.base.persistence.FilesDAO;
import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.base.vo.FilesVO;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.CommentDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;

@Service
public class OpenBoardServiceImpl implements OpenBoardService {

	@Autowired
	BoardDAO boardDAO;
	
	@Autowired
	FilesDAO filesDAO;
	
	@Autowired
	CommentsDAO commentsDAO;
	
	Map<String, Object> paramMap;
		
	@Override
	public ArrayList<BoardDTO> getAll(int class_idx, String bo_role) throws Exception {	
		paramMap = new HashMap<String, Object>();
		 
		paramMap.put("class_idx", class_idx);
		paramMap.put("bo_role", bo_role);

		ArrayList<BoardDTO> posts = boardDAO.selectAllList(paramMap);
		
		Collections.sort(posts); 
		
		for (int i = 0; i < posts.size(); i++) {
			posts.get(i).setView_idx(posts.size() - i);
		}
		
		return posts;
	}
	
	@Override
	public ArrayList<BoardDTO> getPageList(PageInfo pageInfo, SearchInfo searchInfo, int class_idx, String bo_role) throws Exception {
		paramMap = new HashMap<String, Object>();
		
		paramMap.put("pageInfo", pageInfo);
		paramMap.put("searchInfo", searchInfo);
		paramMap.put("class_idx", class_idx);
		paramMap.put("bo_role", bo_role);
		
		return boardDAO.selectPage(paramMap);
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return boardDAO.selectTotalCount();
	}
	
	@Override
	public PostMainDTO getDetail(int bo_idx) throws Exception {
		return boardDAO.selectDetailByIdx(bo_idx);
	}
	
	@Override
	public void addOneAtViews(int bo_idx) throws Exception {
		boardDAO.updateViewsWithPlusOne(bo_idx);
	}

	@Override
	public void addPostContent(BoardVO post) throws Exception {
		boardDAO.insert(post);
	}

	@Override
	public void addPostImage(FilesVO filesVO) throws Exception {
		filesDAO.insert(filesVO);
	}

	@Override
	public void removePost(Integer bo_idx) throws Exception {
		boardDAO.delete(bo_idx);
	}

	@Override
	public void updatePost(BoardVO boardVO) throws Exception {
		boardDAO.update(boardVO);
	}

	@Override
	public int getSelectedPostsCount(String searchType, String searchValue) throws Exception {
		paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchType", searchType);
		paramMap.put("searchValue", searchValue);
		
		int selectedPostCount = boardDAO.selectSelectedPostsCount(paramMap);
		
		return selectedPostCount;
	}

	@Override
	public ArrayList<String> getKeyword(String searchType, String debouncedSearchKeyword) throws Exception {
		paramMap = new HashMap<String, Object>();
		
		paramMap.put("searchType", searchType);
		paramMap.put("debouncedSearchKeyword", debouncedSearchKeyword);
		
		return boardDAO.selectKeyword(paramMap);
	}

	@Override
	public void addComment(CommentDTO commentDTO) throws Exception {
		boardDAO.insertComment(commentDTO);
	}

	@Override
	public ArrayList<CommentDTO> getComments(Integer bo_idx) throws Exception {
		return boardDAO.selectComments(bo_idx);
	}

	@Override
	public void removeComment(Integer comment_idx) throws Exception {
		commentsDAO.delete(comment_idx);
	}	

}
