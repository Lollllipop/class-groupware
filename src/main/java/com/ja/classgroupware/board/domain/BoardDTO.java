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
public class BoardDTO {
	
	private int bo_idx;
	private int user_idx;
	private String bo_title;
	private Date bo_writedate;
	private String bo_isnotice;
	private String bo_role;
	private int bo_views;
	private String user_name;
	
}
