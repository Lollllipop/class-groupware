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
	
	private PageInfo 	pageInfo;
	
	// 바로 다음 10개의 페이지로 이동 가능한지 여부
	private boolean 	isPrev;
	private boolean 	isNext;
	// 맨 처음과 맨 마지막 페이지로 이동 가능한지
	private boolean 	isFirstPage;
	private boolean 	isLastPage;
	// 현재 페이지 범위의 시작과 끝
	private int 		startPage;	
	private int 		endPage;
	// 한 페이지의 게시물 갯수
	private int 		postsCount;
	// 이전 페이지 리스트의 시작 정보
	private int 		prevPageOffset;
	private int 		prevPageMax;
	// 다음 페이지 리스트의 시작 정보
	private int 		nextPageOffset;
	private int 		nextPageMax;
	// 맨 처음 페이지의 정보
	private int 		firstPageOffset;
	private int 		firstPageMax;
	// 맨 마지막 페이지의 정보
	private int 		lastPageOffset;
	private int 		lastPageMax;
	// 현재 페이지 리스트의 시작 정보
	private int 		offset;
	private int			max;
	// 현재 페이지 번호
	private int 		currentPage;
	
}
