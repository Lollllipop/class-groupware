package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.Hw_boardVO;

public interface Hw_boardDAO {
	
	public void insert(Hw_boardVO vo) throws Exception;

	public Hw_boardVO selectByIdx(int hw_idx) throws Exception;

	public List<Hw_boardVO> selectAll() throws Exception;

	public void update(Hw_boardVO vo) throws Exception;

	public void delete(int hw_idx) throws Exception;
	
}
