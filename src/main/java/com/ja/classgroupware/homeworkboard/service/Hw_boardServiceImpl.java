package com.ja.classgroupware.homeworkboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ja.classgroupware.base.persistence.Hw_boardDAO;
import com.ja.classgroupware.base.vo.Hw_boardVO;
import com.ja.classgroupware.homeworkboard.domain.Criteria;
import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;

@Service("Hw_boardService")
public abstract class Hw_boardServiceImpl implements Hw_boardService {
	@Autowired
	private Hw_boardDAO hw_boardMapper;
	
	@Override
	public void regist(Hw_boardVO vo) throws Exception {
		hw_boardMapper.insert(vo);
	}
	

	@Override
	public Hw_boardVO read(int hw_idx) throws Exception {
		return hw_boardMapper.selectByIdx(hw_idx);
	}

	@Override
	public void update(Hw_boardVO vo) throws Exception {
		hw_boardMapper.update(vo);
	}

	@Override
	public void delete(int hw_idx) throws Exception {
		hw_boardMapper.delete(hw_idx);
	}

	@Override
	public List<Hw_boardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return hw_boardMapper.selectAll();
	}

	@Override
	public List<Hw_boardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hw_boardMapper.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hw_boardMapper.countPaging(cri);
	}

	@Override
	public List<Hw_boardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hw_boardMapper.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hw_boardMapper.listSearchCount(cri);
	}

}
