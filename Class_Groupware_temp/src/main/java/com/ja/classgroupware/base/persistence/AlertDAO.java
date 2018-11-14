package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.AlertVO;

public interface AlertDAO {
	
	//�˸��� update�� selectByIdx�� �ʿ������ ���Ƽ� �ȸ���
	
	public void insert(AlertVO vo) throws Exception;

	public List<AlertVO> selectAll() throws Exception;

	public void delete(int alert_idx) throws Exception;

	// �˶� ����¡
	//public List<AlertVO> listPage(int page) throws Exception;

	//public List<AlertVO> listCriteria(Criteria cri) throws Exception;

	//public int countPaging(Criteria cri) throws Exception;

}
