package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.ClassVO;

public interface ClassDAO {
	
	public void insert(ClassVO vo) throws Exception;

	//selectbyidx는 필요없을거 같기도 한데 걍 만들어둠
	public ClassVO selectByIdx(int class_idx) throws Exception;

	public List<ClassVO> selectAll() throws Exception;

	public void update(ClassVO vo) throws Exception;

	public void delete(int class_idx) throws Exception;
}
