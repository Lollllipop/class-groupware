package com.ja.classgroupware.classlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import com.ja.classgroupware.base.persistence.ClassDAO;
import com.ja.classgroupware.base.vo.ClassVO;
import com.ja.classgroupware.classlist.domain.BoardVO;
import com.ja.classgroupware.classlist.service.BoardService;

@Service("BoardService")
public class BoardServiceImpl implements BoardService {
	@Autowired
	private ClassDAO classMapper;
	
	@Override
	public List<ClassVO> selectAll() throws Exception {
		return classMapper.selectAll();
	}

	@Override
	public int insert(ClassVO board) throws Exception {
		// TODO Auto-generated method stub
		return classMapper.insert(board);
	}

	
	@Override
	  public ClassVO read(int class_idx) throws Exception {
	    return classMapper.read(class_idx);
	  }

	@Override
	public int delete(int class_idx) throws Exception {
		// TODO Auto-generated method stub
		return classMapper.delete(class_idx);
		
	}

	@Override
	  public int update(ClassVO board) throws Exception {
		return classMapper.update(board);
	  }
	
}