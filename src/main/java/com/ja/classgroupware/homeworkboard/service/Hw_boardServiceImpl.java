package com.ja.classgroupware.homeworkboard.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ja.classgroupware.base.persistence.Hw_boardDAO;
import com.ja.classgroupware.base.vo.Hw_boardVO;
import com.ja.classgroupware.homeworkboard.domain.Criteria;
import com.ja.classgroupware.homeworkboard.domain.SearchCriteria;

@Service("hw_boardSerivce")
public class Hw_boardServiceImpl implements Hw_boardService {
	
	@Autowired
	private Hw_boardDAO hwboardMapper;
	
	@Override
	
	public void regist(Hw_boardVO vo) throws Exception {
		//hwboardMapper.insert(vo);
	}

	@Override
	public Hw_boardVO read(int hw_idx) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Hw_boardVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int hw_idx) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<Hw_boardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Hw_boardVO> listPage(int page) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Hw_boardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Hw_boardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	

	/*@Override
	public Hw_boardVO read(int hw_idx) throws Exception {
		return hwboardMapper.selectByIdx(hw_idx);
	}

	@Override
	public void update(Hw_boardVO vo) throws Exception {
		hwboardMapper.update(vo);
	}

	@Override
	public void delete(int hw_idx) throws Exception {
		hwboardMapper.delete(hw_idx);
	}

	@Override
	public List<Hw_boardVO> listAll() throws Exception {
		// TODO Auto-generated method stub
		return hwboardMapper.selectAll();
	}

	@Override
	public List<Hw_boardVO> listCriteria(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hwboardMapper.listCriteria(cri);
	}

	@Override
	public int countPaging(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hwboardMapper.countPaging(cri);
	}

	@Override
	public List<Hw_boardVO> listSearch(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hwboardMapper.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		// TODO Auto-generated method stub
		return hwboardMapper.listSearchCount(cri);
	}*/

}
