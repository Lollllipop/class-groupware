package com.ja.classgroupware.userlist.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.User_classDAO;
import com.ja.classgroupware.base.vo.User_classVO;
import com.ja.classgroupware.userlist.domain.UserlistVO;

@Service
public class UserlistServiceImpl implements UserlistService {
	
	@Inject
	private User_classDAO dao;

	@Override
	public void regist(User_classVO user_class) throws Exception {
		dao.insert(user_class);
	}

	@Override
	public void modify(Map map) throws Exception {

		dao.update( map);
	}

	@Override
	public void remove(Map map) throws Exception {

		dao.delete(map);
	}

	@Override
	public List<UserlistVO> listAll(Integer class_idx) throws Exception {
		return dao.selectByClass(class_idx);
	}
	
	
}