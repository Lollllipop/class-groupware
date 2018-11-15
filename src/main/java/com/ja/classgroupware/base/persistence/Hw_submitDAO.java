package com.ja.classgroupware.base.persistence;

import java.util.List;
import com.ja.classgroupware.base.vo.Hw_submitVO;

public interface Hw_submitDAO {
	
	public void insert(Hw_submitVO vo) throws Exception;
	
	public Hw_submitVO selectByIdx(int hw_idx) throws Exception;
	
	public List<Hw_submitVO> selectAll() throws Exception;

	public void update(Hw_submitVO vo) throws Exception;

	public void delete(int hw_idx) throws Exception;
	
}
	
