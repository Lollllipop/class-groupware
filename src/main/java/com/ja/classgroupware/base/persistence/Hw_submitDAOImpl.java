package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.ja.classgroupware.base.vo.Hw_submitVO;

public class Hw_submitDAOImpl implements Hw_submitDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.ja.classgroupware.mapper.hw_submitMapper";

	@Override
	public void insert(Hw_submitVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public Hw_submitVO selectByIdx(int hw_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx" ,hw_idx);
	}

	@Override
	public List<Hw_submitVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(Hw_submitVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int hw_idx) throws Exception {
		session.delete(namespace +".delete" , hw_idx);
	}

}
