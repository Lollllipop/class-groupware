package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.UsersVO;

public interface UsersDAO {
	
	public void insert(UsersVO vo) throws Exception;

	public UsersVO selectByIdx(int class_idx) throws Exception;

	public List<UsersVO> selectAll() throws Exception;

	public void update(UsersVO vo) throws Exception;

	public void delete(int class_idx) throws Exception;
	
}
