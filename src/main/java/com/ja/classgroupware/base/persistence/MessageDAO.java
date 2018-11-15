package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.MessageVO;

public interface MessageDAO {

	public void insert(MessageVO vo) throws Exception;

	public MessageVO selectByIdx(int message_idx) throws Exception;
	
	public List<MessageVO> selectAll() throws Exception; 
	
	public void delete(int message_idx) throws Exception;

	//public void updateState(int message_idx) throws Exception; 읽었는지 상태 확인하는
}
