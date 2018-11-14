package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.AttendanceVO;

@Repository
public class AttendanceDAOImpl implements AttendanceDAO{
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.attendanceMapper";
	
	@Override
	public void insert(AttendanceVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);	
	}

	@Override
	public AttendanceVO selectByIdx(int attendace_idx) throws Exception {
		return session.selectOne(namespace + ".selectByIdx", attendace_idx);
	}

	@Override
	public List<AttendanceVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void update(AttendanceVO vo) throws Exception {
		session.update(namespace + ".update", vo);
	}

	@Override
	public void delete(int attendace_idx) throws Exception {
		session.delete(namespace + ".delete", attendace_idx);
	}

}
