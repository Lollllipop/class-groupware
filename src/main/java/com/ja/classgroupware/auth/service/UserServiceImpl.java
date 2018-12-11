package com.ja.classgroupware.auth.service;

import java.util.Date;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.ja.classgroupware.base.vo.UsersVO;
import com.ja.classgroupware.auth.domain.LoginDTO;
import com.ja.classgroupware.base.persistence.UsersDAO;

@Service
public class UserServiceImpl implements UserService {

   @Inject
   private UsersDAO dao;

   @Override
   public UsersVO login(LoginDTO dto) throws Exception {
	   
	   System.out.println(dto + "23123123");
	   
	  
      return dao.login(dto);
   }

   @Override
   public void keepLogin(String user_id, String sessionId, Date next) throws Exception {

      dao.keepLogin(user_id, sessionId, next);

   }
   
   @Override
   public UsersVO checkLoginBefore(String value) {

      return dao.checkUserWithSessionKey(value);
   }

   @Override
   public void insert(UsersVO vo) throws Exception {
      
      dao.insert(vo);
   }

   @Override
   public void select(UsersVO vo) throws Exception {
      
      
   }

   @Override
   public UsersVO logins(LoginDTO dto) throws Exception {
      
      return null;
   }

   @Override
   public void keepLogins(String user_id, String sessionId, Date next) {
      
      
   }

   @Override
   public UsersVO checkUserWithSessionKey(String value) {
      
      return null;
   }

   public UsersVO selectByEmail(String user_email) throws Exception {
      return dao.selectByEmail(user_email);
   }
   
   public UsersVO selectById(String user_id) throws Exception {
      return dao.selectById(user_id);
   }
}