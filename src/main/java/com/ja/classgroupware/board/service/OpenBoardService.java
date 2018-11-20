package com.ja.classgroupware.board.service;

import java.util.ArrayList;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;

public interface OpenBoardService {

	public ArrayList<BoardDTO> getAll(int class_idx, String bo_role) throws Exception;
	
	public ArrayList<BoardDTO> getPageList(PageInfo pageInfo, int class_idx, String bo_role) throws Exception;
	
	public PostMainDTO getDetail(int bo_idx) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public void addOneAtViews(int bo_idx) throws Exception;

}
