package com.ja.classgroupware.board.domain;

import java.sql.Date;
import java.util.ArrayList;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CommentDTO {
	
	private int comment_idx;
	private int comm_parent_idx;
	private int bo_idx;
	private int user_idx;
	private String user_name;
	private String comm_content;
	private Date comm_writedate;
	private String comm_role;
	private String comm_convertedwritedate;
	private ArrayList<CommentDTO> reComments;
	
	public boolean hasParent() {
		if (this.getComm_parent_idx() == 0) {
			return false;
		} else {
			return true;
		}
	}
	
}
