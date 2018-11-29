package com.ja.classgroupware.auth.service;

import java.util.Date;

import com.ja.classgroupware.base.vo.UsersVO;
import com.ja.classgroupware.auth.domain.LoginDTO;

public interface UserService {

  public UsersVO login(LoginDTO dto) throws Exception; //로그인 강사님 예제

  public void keepLogin(String user_id, String sessionId, Date next) throws Exception;
  
  public UsersVO checkLoginBefore(String value);

  public void insert(UsersVO vo) throws Exception;
  
  public void select(UsersVO vo) throws Exception;

  public UsersVO logins(LoginDTO dto) throws Exception;

  public void keepLogins(String user_id, String sessionId, Date next);

  public UsersVO checkUserWithSessionKey(String value);

  public UsersVO selectByEmail(String user_email) throws Exception;



 
} 

