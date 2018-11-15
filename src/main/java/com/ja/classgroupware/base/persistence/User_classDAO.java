package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.User_classVO;

public interface User_classDAO {
	
	public void insert(User_classVO vo) throws Exception;

	public User_classVO selectByIdx(int class_idx) throws Exception;

	public List<User_classVO> selectAll() throws Exception;

	public void update(User_classVO vo) throws Exception;

	public void delete(int class_idx) throws Exception;
	
}
