package com.ja.classgroupware.base.persistence;

import java.util.List;
import java.util.Map;

import com.ja.classgroupware.base.vo.User_classVO;
import com.ja.classgroupware.userlist.domain.UserlistVO;

public interface User_classDAO {
	
	public void insert(User_classVO vo) throws Exception;

	public List<UserlistVO> selectByClass(int class_idx) throws Exception;

	public void update(Map map) throws Exception;

	public void delete(Map map) throws Exception;
	
}
