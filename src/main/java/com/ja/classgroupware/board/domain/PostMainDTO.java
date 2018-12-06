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
public class PostMainDTO {
	
	private int 	bo_idx;
	private int 	user_idx;
	private String 	user_name;
	private String 	bo_title;
	private String 	bo_content;
	private Date 	bo_writedate;
	private Date 	bo_updatedate;
	private String 	bo_isnotice;
	private String 	bo_role;
	private int 	bo_views;
	private int 	bo_comments;
	
}
