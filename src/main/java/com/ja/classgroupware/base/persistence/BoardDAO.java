package com.ja.classgroupware.base.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.board.domain.BoardDTO;

public interface BoardDAO {
	
	// pure
	public void insert(BoardVO vo) throws Exception;

	public BoardVO selectByIdx(int bo_idx) throws Exception;

	public List<BoardVO> selectAll() throws Exception;

	public void update(BoardVO vo) throws Exception;

	public void delete(int bo_idx) throws Exception;
	
	// mixed
	public ArrayList<BoardDTO> selectAllList(Map<String, Object> paramMap) throws Exception;
	
	// etc
	public int selectTotalCount() throws Exception;

}
