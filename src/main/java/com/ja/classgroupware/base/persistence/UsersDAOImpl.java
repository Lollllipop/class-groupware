package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.UsersVO;

@Repository
public class UsersDAOImpl implements UsersDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.classMapper";

	@Override
	public void insert(UsersVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public UsersVO selectByIdx(int user_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", user_idx);
	}

	@Override
	public List<UsersVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(UsersVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int user_idx) throws Exception {
		session.delete(namespace + ".delete", user_idx);
	}

}
