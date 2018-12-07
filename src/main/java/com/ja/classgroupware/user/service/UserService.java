package com.ja.classgroupware.user.service;

import java.util.List;

import com.ja.classgroupware.user.domain.MyPostsVO;
import com.ja.classgroupware.user.domain.UsersDateVO;

public interface UserService {

  public UsersDateVO read(Integer user_idx) throws Exception;	
	
  public void modify(UsersDateVO users) throws Exception;
  
  public List<MyPostsVO> listAll(Integer user_idx) throws Exception;
  
}