package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.ClassVO;

@Repository
public class ClassDAOImpl implements ClassDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.classMapper";

	@Override
	public void insert(ClassVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public ClassVO selectByIdx(int class_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", class_idx);
	}

	@Override
	public List<ClassVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(ClassVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int class_idx) throws Exception {
		session.delete(namespace + ".delete", class_idx);
	}

}
