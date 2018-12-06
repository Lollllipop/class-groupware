package com.ja.classgroupware.base.util;

import com.ja.classgroupware.base.domain.PageInfo;
import com.ja.classgroupware.base.domain.PagingNavInfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class PageMaker {

	private PageInfo 	pageInfo;
	private int 		count;
	private int 		totalCount;
	private int 		totalPageCount;
	private int 		currentPage;
	private int 		currentPageUnit;
	private int 		totalPageUnit;
	
	public PageMaker(PageInfo pageInfo, int totalCount) {
		this.pageInfo 		= pageInfo;
		this.totalCount 	= totalCount;
		this.count 			= pageInfo.getMax() - pageInfo.getOffset();
		this.totalPageCount = totalCount % count == 0 ? (totalCount / count) : (totalCount / count) + 1;
		this.currentPage 	= pageInfo.getMax() / count;
 	}
	
	public PagingNavInfo make() {
		PagingNavInfo pagingNavInfo = new PagingNavInfo();
		
		pagingNavInfo.setPrev(makeIsPrev());
		pagingNavInfo.setNext(makeIsNext());
		pagingNavInfo.setFirstPage(makeIsFirstPage());
		pagingNavInfo.setLastPage(makeIsLastPage());
		pagingNavInfo.setStartPage(makeStartPage());
		pagingNavInfo.setEndPage(makeEndPage());
		pagingNavInfo.setPageInfo(pageInfo);
		pagingNavInfo.setPostsCount(makePostsCount());
		
		pagingNavInfo.setPrevPageOffset(makePrevPageOffset());
		pagingNavInfo.setPrevPageMax(makePrevPageMax());
		pagingNavInfo.setNextPageOffset(makeNextPageOffset());
		pagingNavInfo.setNextPageMax(makeNextPageMax());
		
		pagingNavInfo.setFirstPageOffset(makeFirstPageOffset());
		pagingNavInfo.setFirstPageMax(makeFirstPageMax());
		pagingNavInfo.setLastPageOffset(makeLastPageOffset());
		pagingNavInfo.setLastPageMax(makeLastPageMax());
		
		pagingNavInfo.setOffset(makeOffset());
		pagingNavInfo.setMax(makeMax());
		
		pagingNavInfo.setCurrentPage(makeCurrentPage());
		
		
		return pagingNavInfo;
	}

	private int makeCurrentPage() {
		return currentPage;
	}

	private int makeLastPageMax() {
		return totalPageCount * count;
	}

	private int makeLastPageOffset() {
		return (totalPageCount * count) - count;
	}

	private int makeFirstPageMax() {
		return count;
	}

	private int makeFirstPageOffset() {
		return 0;
	}

	private int makeNextPageMax() {
		return ((currentPageUnit + 1) * count * 10) + count;
	}

	private int makeNextPageOffset() {
		return (currentPageUnit + 1) * count * 10;
	}

	private int makePrevPageMax() {
		return (currentPageUnit * count * 10);
	}

	private int makePrevPageOffset() {
		return currentPageUnit * count * 10 - count;
	}

	public boolean makeIsPrev() {
		return currentPage > 10 ? true : false;
	}
	
	public boolean makeIsNext() {
		int currentPageUnit = ((currentPage - 1) / 10);
		int totalPageUnit	= totalPageCount / 10;
		
		return totalPageUnit > currentPageUnit ? true : false;
	}
	
	public boolean makeIsFirstPage() {
		return currentPage > 10 ? true : false;
	}
	
	public boolean makeIsLastPage() {
		currentPageUnit = (currentPage - 1) / 10;
		totalPageUnit	= totalPageCount / 10;
		
		return totalPageUnit > currentPageUnit ? true : false;
	}
	
	public int makeStartPage() {
		return (currentPageUnit * 10) + 1;
	}
	
	public int makeEndPage() {
		if (totalPageUnit == currentPageUnit) {
			return totalPageCount;
		} else {
			return (currentPageUnit * 10) + 10;
		}
	}
	
	private int makePostsCount() {
		return count;
	}
	
	private int makeMax() {
		return (count * 10 * currentPageUnit) + count;
	}

	private int makeOffset() {
		return count * 10 * currentPageUnit;
	}
	
}
