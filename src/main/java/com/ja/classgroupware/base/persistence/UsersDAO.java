package com.ja.classgroupware.base.persistence;

import java.util.Date;
import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;

import com.ja.classgroupware.auth.domain.LoginDTO;
import com.ja.classgroupware.base.vo.UsersVO;
import com.ja.classgroupware.user.domain.MyPostsVO;
import com.ja.classgroupware.user.domain.UsersDateVO;




public interface UsersDAO {
   
   // 회원가입, 로그인
   
   //public UsersVO login(UsersVO dto) throws Exception; //login 블로그 예제
   public void insert(UsersVO vo) throws Exception;
   
   public UsersVO login(LoginDTO dto) throws Exception; //login 수업 예제
   
   public void keepLogin(String user_id, String sessionId, Date next);

   public UsersVO checkUserWithSessionKey(String value);

   public UsersVO selectByEmail(String user_email) throws Exception;
   
   public UsersVO selectById(String user_id) throws Exception;
   
   // 마이페이지
   public UsersDateVO selectByIdx(int user_idx) throws Exception;

   public List<MyPostsVO> selectPosts(int user_idx) throws Exception;

   public void update(UsersDateVO vo) throws Exception; 
   
   
}