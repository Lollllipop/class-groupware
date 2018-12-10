package com.ja.classgroupware.user.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.UsersDAO;
import com.ja.classgroupware.user.domain.MyPostsVO;
import com.ja.classgroupware.user.domain.UsersDateVO;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Inject
	private UsersDAO dao;
	
	@Override
	public UsersDateVO read(Integer user_idx) throws Exception {
		return dao.selectByIdx(user_idx);
	}

	@Override
	public void modify(UsersDateVO users) throws Exception {
		dao.update(users);
		
	}

	@Override
	public List<MyPostsVO> listAll(Integer user_idx) throws Exception {
		return dao.selectPosts(user_idx);
	}

}