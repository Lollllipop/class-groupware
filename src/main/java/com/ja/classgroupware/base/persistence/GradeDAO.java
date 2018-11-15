package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.GradeVO;

public interface GradeDAO {
	
	public void insert(GradeVO vo) throws Exception;

	public GradeVO selectByIdx(int grade_idx) throws Exception;

	public List<GradeVO> selectAll() throws Exception;

	public void update(GradeVO vo) throws Exception;

	public void delete(int grade_idx) throws Exception;
	
}
