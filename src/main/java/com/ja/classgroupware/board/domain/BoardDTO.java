package com.ja.classgroupware.board.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BoardDTO implements Comparable<BoardDTO>{
	
	private int 	bo_idx;
	private int 	view_idx;
	private int 	user_idx;
	private String 	bo_title;
	private Date 	bo_writedate;
	private String 	bo_isnotice;
	private String 	bo_role;
	private int 	bo_views;
	private String 	user_name;
	private int 	bo_comments;
	private String 	bo_convertedwritedate;
	private String 	bo_hasfiles;
	
	@Override
	public int compareTo(BoardDTO post) {
		if (bo_idx < post.getBo_idx()) {
			return 1;
		} else if (bo_idx == post.getBo_idx()){
			return 0;
		} else {
			return -1;
		}
	}
	
}
