package com.seowon.domain;

public class Criteria {

	int page;
	int perPageNum;

	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	

	/* 
	 * Set Page 
	 * @Param page
	 * */
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}

	/* 
	 * Set perPageNum
	 * @Param perPageNum
	 *  */
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}

	public int getPage() {
		return page;
	}
	
	/* 
	 * method for MyBatis Sql Mapper
	 *  */
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	/* 
	 * method for MyBatis Sql Mapper
	 * return value is the second parameter of limit statement of MySql 
	 *  */
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
}
