package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.*;

@Repository
public class AlertDAOImpl implements AlertDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.alertMapper";

	@Override
	public void insert(AlertVO vo) throws Exception {
		session.insert(namespace + ".insert", vo);
	}

	@Override
	public List<AlertVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	@Override
	public void delete(int alert_idx) throws Exception {
		session.delete(namespace + ".delete", alert_idx);

	}

	/*
	 * @Override public List<AlertVO> listPage(int page) throws Exception { // TODO
	 * Auto-generated method stub return null; }
	 * 
	 * @Override public List<AlertVO> listCriteria(Criteria cri) throws Exception {
	 * // TODO Auto-generated method stub return null; }
	 * 
	 * @Override public int countPaging(Criteria cri) throws Exception { // TODO
	 * Auto-generated method stub return 0; }
	 */

}
