package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.User_classVO;

@Repository
public class User_classDAOImpl implements User_classDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.user_classMapper";

	@Override
	public void insert(User_classVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public User_classVO selectByIdx(int class_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", class_idx);
	}

	@Override
	public List<User_classVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(User_classVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int class_idx) throws Exception {
		session.delete(namespace + ".delete", class_idx);
	}

}
