package com.ja.classgroupware.base.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PageInfo {
	
	private int 	offset 	= 0;
	private int		max 	= 10;
	private String 	sort 	= "bo_idx";
	private String 	order 	= "DESC";
	
}
