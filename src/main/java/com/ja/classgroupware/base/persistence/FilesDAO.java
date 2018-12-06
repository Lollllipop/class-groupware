package com.ja.classgroupware.base.persistence;

import java.util.ArrayList;
import java.util.List;

import com.ja.classgroupware.base.vo.FilesVO;
import com.ja.classgroupware.board.domain.ThumbnailDTO;

public interface FilesDAO {

	public void insert(FilesVO vo) throws Exception;

	public FilesVO selectByIdx(int file_idx) throws Exception;

	public List<FilesVO> selectAll() throws Exception;

	public void update(FilesVO vo) throws Exception;

	public void delete(int file_idx) throws Exception;

	public void deleteWithFileLink(String file_link) throws Exception;

	public ArrayList<ThumbnailDTO> selectByBoIdx(Integer bo_idx) throws Exception;
}
