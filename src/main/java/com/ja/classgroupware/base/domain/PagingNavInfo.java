package com.ja.classgroupware.base.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class PagingNavInfo {
	
	// 바로 다음 10개의 페이지로 이동 가능한지 여부
	private boolean 	isPrev;
	private boolean 	isNext;
	// 맨 처음과 맨 마지막 페이지로 이동 가능한지
	private boolean 	isFirstPage;
	private boolean 	isLastPage;
	// 현재 페이지 범위의 시작과 끝
	private int 		startPage;	
	private int 		endPage;
	
	private int 		postsCount;
	private PageInfo 	pageInfo;
	
	private int 		prevPageOffset;
	private int 		prevPageMax;
	private int 		nextPageOffset;
	private int 		nextPageMax;
	
	private int 		firstPageOffset;
	private int 		firstPageMax;
	private int 		lastPageOffset;
	private int 		lastPageMax;
	
	private int 		offset;
	private int			max;
	
	private int 		currentPage;
	
}
