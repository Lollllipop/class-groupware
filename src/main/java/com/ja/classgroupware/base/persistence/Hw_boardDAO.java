package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.Hw_boardVO;
import com.ja.classgroupware.homeworkboard.domain.Criteria;
import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;

public interface Hw_boardDAO {

	public void insert(Hw_boardVO vo) throws Exception;

	public Hw_boardVO selectByIdx(int hw_idx) throws Exception;

	public List<Hw_boardVO> selectAll() throws Exception;

	public void update(Hw_boardVO vo) throws Exception;

	public void delete(int hw_idx) throws Exception;

	public List<Hw_boardVO> listAll() throws Exception;

	public List<Hw_boardVO> listPage(int page) throws Exception;

	public List<Hw_boardVO> listCriteria(Criteria cri) throws Exception;

	public int countPaging(Criteria cri) throws Exception;

	public List<Hw_boardVO> listSearch(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;

	public void updateReplyCnt(Integer bno, int amount) throws Exception;

	public void updateViewCnt(Integer bno) throws Exception;
}
