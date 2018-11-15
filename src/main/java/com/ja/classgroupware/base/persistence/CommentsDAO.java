package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.CommentsVO;

public interface CommentsDAO {
	
	public void insert(CommentsVO vo) throws Exception;

	public CommentsVO selectByIdx(int comment_idx) throws Exception;

	public List<CommentsVO> selectAll() throws Exception;

	public void update(CommentsVO vo) throws Exception;

	public void delete(int comment_idx) throws Exception;
}
