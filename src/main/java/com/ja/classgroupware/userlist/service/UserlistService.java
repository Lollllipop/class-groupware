package com.ja.classgroupware.userlist.service;

import java.util.List;
import java.util.Map;

import com.ja.classgroupware.base.vo.User_classVO;
import com.ja.classgroupware.userlist.domain.UserlistVO;

public interface UserlistService {

  public void regist(User_classVO user_class) throws Exception;

  public void modify(Map map) throws Exception;

  public void remove(Map map) throws Exception;

  public List<UserlistVO> listAll(Integer class_idx) throws Exception;

}