package com.ja.classgroupware.base.persistence;

import java.util.Date;
import java.util.List;

//import org.springframework.beans.factory.annotation.Autowired;

import com.ja.classgroupware.auth.domain.LoginDTO;
import com.ja.classgroupware.base.vo.UsersVO;





public interface UsersDAO {
	
	
	/*@Autowired
	private UserMapper UserMapper;*/
	
	public void insert(UsersVO vo) throws Exception;

	public UsersVO selectByIdx(int class_idx) throws Exception;

	public List<UsersVO> selectAll() throws Exception;

	public void update(UsersVO vo) throws Exception;

	public void delete(int class_idx) throws Exception;
	
	//public UsersVO login(UsersVO dto) throws Exception; //login 블로그 예제
	
	public UsersVO login(LoginDTO dto) throws Exception; //login 수업 예제
	
	public void keepLogin(String user_id, String sessionId, Date next);

	public UsersVO checkUserWithSessionKey(String value);

	public UsersVO selectByEmail(String user_email) throws Exception;
	
	
	
}
