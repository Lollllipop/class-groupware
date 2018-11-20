package com.ja.classgroupware.board.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.BoardDAO;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;

@Service
public class OpenBoardServiceImpl implements OpenBoardService {

	@Autowired
	BoardDAO boardDAO;
	
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
	public void getPageList() throws Exception {
		// TODO Auto-generated method stub
	}

}