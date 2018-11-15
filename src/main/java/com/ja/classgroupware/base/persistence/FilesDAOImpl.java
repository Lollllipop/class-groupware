package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.FilesVO;

@Repository
public class FilesDAOImpl implements FilesDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.filesMapper";

	@Override
	public void insert(FilesVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public FilesVO selectByIdx(int file_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", file_idx);
	}

	@Override
	public List<FilesVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(FilesVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int file_idx) throws Exception {
		session.delete(namespace + ".delete", file_idx);
	}

}
