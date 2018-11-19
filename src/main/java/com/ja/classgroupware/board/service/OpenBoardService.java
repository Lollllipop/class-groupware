package com.ja.classgroupware.board.service;

import java.util.ArrayList;

import com.ja.classgroupware.board.domain.BoardDTO;

public interface OpenBoardService {

	public ArrayList<BoardDTO> getAllList(int class_idx, String bo_role) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public void getPageList() throws Exception;

}
