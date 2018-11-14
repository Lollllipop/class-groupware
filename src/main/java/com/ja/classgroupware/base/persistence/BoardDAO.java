package com.ja.classgroupware.base.persistence;

import java.util.List;

import com.ja.classgroupware.base.vo.BoardVO;

public interface BoardDAO {

	public void insert(BoardVO vo) throws Exception;

	public BoardVO selectByIdx(int bo_idx) throws Exception;

	public List<BoardVO> selectAll() throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(int bo_idx) throws Exception;
}
