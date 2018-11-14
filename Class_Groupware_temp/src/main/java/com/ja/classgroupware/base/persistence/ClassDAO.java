package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.ClassVO;

public interface ClassDAO {
	public void insert(ClassVO vo) throws Exception;

	//ÇÊ¿äÇÑÁø ¸ð¸£°ÙÀ¸³ª °Á ¸¸µé¾îµÒ
	public ClassVO selectByIdx(int class_idx) throws Exception;

	public List<ClassVO> selectAll() throws Exception;

	public void update(ClassVO vo) throws Exception;

	public void delete(int class_idx) throws Exception;
}
