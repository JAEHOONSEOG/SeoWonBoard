package com.seowon.domain;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageMaker {

	private int totalCount;
	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;

	// Maximum counts for displaying pageNumber 
	private int displayPageNum = 5;
	
	private Criteria cri;
	
	public Criteria getCri() {
		return cri;
	}
	public void setCri(Criteria cri) {
		this.cri = cri;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		
		calcData();
	}
	
	/* 
	 * Calculate pages
	 * */
	private void calcData() {
		endPage = (int)(Math.ceil(cri.page/(double)displayPageNum))*displayPageNum;
		
		startPage = (endPage - displayPageNum) + 1;
		
		// recalculate endPage
		int tempEndPage = (int)(Math.ceil(totalCount/(double)cri.getPerPageNum()));
		
		if(endPage > tempEndPage)
			endPage = tempEndPage;
		
		prev = startPage == 1 ? false : true;
		
		next = endPage * cri.getPerPageNum() >= totalCount ? false : true;
	}
	
	// Create query string for URI for paging process 
//	public String makeQuery(int page) {
//		UriComponents uriComponents =
//				UriComponentsBuilder.newInstance()
//				.queryParam("page", page)
//				.queryParam("perPageNum", cri.getPerPageNum())
//				.build();
//		return uriComponents.toUriString();
//	}
	// Create query string for URI for paging process
	public String makeSearch(int page) {
		UriComponents uriComponents =
				UriComponentsBuilder.newInstance()
				.queryParam("page", page)
				.queryParam("perPageNum", cri.getPerPageNum())
				.queryParam("searchType", ((SearchCriteria)cri).getSearchType())
				.queryParam("keyword", ((SearchCriteria)cri).getKeyword())
				.build();
		return uriComponents.toUriString();
	}
	
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	
	@Override
	public String toString() {
		return "PageMaker [totalCount=" + totalCount + ", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + "]";
	}
}
