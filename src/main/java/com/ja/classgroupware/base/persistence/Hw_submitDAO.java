package com.ja.classgroupware.base.persistence;

import java.util.List;
import com.ja.classgroupware.base.vo.Hw_submitVO;
import com.ja.classgroupware.homeworkboard.domain.Criteria;
import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;

public interface Hw_submitDAO {

	public void insert(Hw_submitVO vo) throws Exception;

	public Hw_submitVO selectByIdx(int hw_idx) throws Exception;

	public List<Hw_submitVO> selectAll() throws Exception;

	public void update(Hw_submitVO vo) throws Exception;

	public void delete(int hw_idx) throws Exception;

	public List<Hw_submitVO> listAll() throws Exception;

	public List<Hw_submitVO> listPage(int page) throws Exception;

	public List<Hw_submitVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<Hw_submitVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void addAttach(String fullName) throws Exception;

	public List<String> getAttach(Integer bno) throws Exception;

	public void deleteAttach(Integer bno) throws Exception;

	public void replaceAttach(String fullName, Integer bno) throws Exception;

}
