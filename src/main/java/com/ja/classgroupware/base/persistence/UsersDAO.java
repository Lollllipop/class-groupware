package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.user.domain.MyPostsVO;
import com.ja.classgroupware.user.domain.UsersDateVO;

public interface UsersDAO {
	public UsersDateVO selectByIdx(int user_idx) throws Exception;

	public List<MyPostsVO> selectPosts(int user_idx) throws Exception;

	public void update(UsersDateVO vo) throws Exception; 
}
