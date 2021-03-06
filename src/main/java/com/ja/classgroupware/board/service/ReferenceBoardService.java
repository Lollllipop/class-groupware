package com.ja.classgroupware.board.service;

import java.util.ArrayList;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.SearchInfo;
import com.ja.classgroupware.base.vo.BoardVO;
import com.ja.classgroupware.base.vo.FilesVO;
import com.ja.classgroupware.board.domain.BoardDTO;
import com.ja.classgroupware.board.domain.CommentDTO;
import com.ja.classgroupware.board.domain.PostMainDTO;
import com.ja.classgroupware.board.domain.ThumbnailDTO;

public interface ReferenceBoardService {

	public ArrayList<BoardDTO> getAll(int class_idx, String bo_role) throws Exception;
	
	public ArrayList<BoardDTO> getPageList(PageInfo pageInfo, SearchInfo searchInfo, int class_idx, String bo_role) throws Exception;
	
	public PostMainDTO getDetail(int bo_idx) throws Exception;
	
	public int getTotalCount() throws Exception;
	
	public void addOneAtViews(int bo_idx) throws Exception;

	public void addPostContent(BoardVO post) throws Exception;

	public void addPostImage(FilesVO filesVO) throws Exception;

	public void removePost(Integer bo_idx) throws Exception;

	public void updatePost(BoardVO boardVO) throws Exception;
	
	public int getSelectedPostsCount(String searchType, String searchValue, String boardSeparator) throws Exception;

	public ArrayList<String> getKeyword(String searchType, String debouncedSearchKeyword, String boardSeparator) throws Exception;
	
	public void addComment(CommentDTO commentDTO) throws Exception;

	public ArrayList<CommentDTO> getComments(Integer bo_idx) throws Exception;

	public void removeComment(Integer comment_idx) throws Exception;

	public void addOneAtComments(Integer bo_idx) throws Exception;

	public void updateComment(Integer comment_idx, String comm_content) throws Exception;

	public void subOneAtComments(Integer bo_idx) throws Exception;

	public void addReComment(CommentDTO commentDTO) throws Exception;

	public void removePostImage(String file_link) throws Exception;

	public void addPostFile(FilesVO filesVO) throws Exception;

	public void addPostThumbnail(FilesVO filesVO) throws Exception;

	public void removePostThumbnail(String thumbnailFileLink) throws Exception;

	public void removePostFile(String fileLink) throws Exception;

	public ArrayList<ThumbnailDTO> getThumbnails(Integer bo_idx) throws Exception;

}
