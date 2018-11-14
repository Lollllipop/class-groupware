package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.AlertVO;

public interface AlertDAO {
	
	//알림에 update랑 selectByIdx는 필요없을거 같아서 안만듬
	
	public void insert(AlertVO vo) throws Exception;

	public List<AlertVO> selectAll() throws Exception;

	public void delete(int alert_idx) throws Exception;

	// 알람 페이징
	//public List<AlertVO> listPage(int page) throws Exception;

	//public List<AlertVO> listCriteria(Criteria cri) throws Exception;

	//public int countPaging(Criteria cri) throws Exception;

}
