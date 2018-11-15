package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.GradeVO;

@Repository
public class GradeDAOImpl implements GradeDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.gradeMapper";

	@Override
	public void insert(GradeVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public GradeVO selectByIdx(int grade_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", grade_idx);
	}

	@Override
	public List<GradeVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(GradeVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int grade_idx) throws Exception {
		session.delete(namespace + ".delete", grade_idx);
	}

}
