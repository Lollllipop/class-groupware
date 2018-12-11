package com.ja.classgroupware.classlist.service;

import java.util.List;

import com.ja.classgroupware.base.vo.ClassVO;


public interface BoardService {

	public int insert(ClassVO board) throws Exception;

	public List<ClassVO> selectAll() throws Exception;

	public int delete(int class_idx) throws Exception;

	public ClassVO read(int class_idx) throws Exception;
	
	public int update(ClassVO board) throws Exception;
}
