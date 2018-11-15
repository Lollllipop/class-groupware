package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.CommentsVO;

@Repository
public class CommentsDAOImpl implements CommentsDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.commentsMapper";
	
	@Override
	public void insert(CommentsVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}
	@Override
	public CommentsVO selectByIdx(int comment_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", comment_idx);
	}
	@Override
	public List<CommentsVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}
	@Override
	public void update(CommentsVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}
	@Override
	public void delete(int comment_idx) throws Exception {
		session.delete(namespace + ".delete", comment_idx);
	}
}