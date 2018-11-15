package com.ja.classgroupware.base.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.ja.classgroupware.base.vo.MessageVO;

public class MessageDAOImpl implements MessageDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.ja.classgroupware.mapper.messageMapper";

	@Override
	public void create(MessageVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	@Override
	public MessageVO readMessage(int message_idx) throws Exception {
		return session.selectOne(namespace + ".readMessage");
	}

	@Override
	/*
	 * public void updateState(int message_idx) throws Exception {
	 * session.update(namespace + ".updateState", message_idx); } 읽었는지 상태 확인하는 메소드
	 */

	public List<MessageVO> selectAll() throws Exception {
		return session.selectList(namespace + ".selectAll");
	}

	public void delete(int message_idx) throws Exception {
		session.delete(namespace + ".delete", message_idx);
	}

}
