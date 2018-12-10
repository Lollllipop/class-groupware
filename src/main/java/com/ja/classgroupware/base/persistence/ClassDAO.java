package com.ja.classgroupware.base.persistence;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.ja.classgroupware.base.vo.ClassVO;
import com.ja.classgroupware.classlist.domain.BoardVO;

@Repository("mappers/classMapper")
public interface ClassDAO {
	
	public int insert(ClassVO board) throws Exception;

	public List<ClassVO> selectAll() throws Exception;

	public int update(ClassVO board) throws Exception;

	public int delete(int class_idx) throws Exception;

	public ClassVO read(int class_idx) throws Exception;


}
