package com.ja.classgroupware.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.BoardDAO;
import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.board.domain.BoardDTO;

@Service
public class OpenBoardServiceImpl implements OpenBoardService {

	@Autowired
	BoardDAO boardDAO;
	
	Map<String, Object> paramMap;
		
	@Override
	public ArrayList<BoardDTO> getAllList(int class_idx, String bo_role) throws Exception {	
		paramMap = new HashMap<String, Object>();
		 
		paramMap.put("class_idx", class_idx);
		paramMap.put("bo_role", bo_role);
		
		ArrayList<BoardDTO> boards = boardDAO.selectAllList(paramMap);
		
		return boards;
	}
	
	@Override
	public int getTotalCount() throws Exception {
		return boardDAO.selectTotalCount();
	}

	@Override
	public void getPageList() throws Exception {
		// TODO Auto-generated method stub
	}

}
