package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.Hw_boardVO;

@Repository
public class Hw_boardDAOImpl implements Hw_boardDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.hw_boardMapper";

	@Override
	public void insert(Hw_boardVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public Hw_boardVO selectByIdx(int hw_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", hw_idx);
	}

	@Override
	public List<Hw_boardVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(Hw_boardVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int hw_idx) throws Exception {
		session.delete(namespace + ".delete", hw_idx);
	}

}
