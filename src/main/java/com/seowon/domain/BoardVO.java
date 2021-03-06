package com.seowon.domain;

import java.util.Arrays;
import java.util.Date;

public class BoardVO {

	private Integer bno;
	private String category;
	private String title;
	private String content;
	private String writer;
	private Date regDate;
	private int viewCnt;
	
	private String[] files;
	
	public String[] getFiles() {
		return files;
	}
	
	public void setFiles(String[] files) {
		this.files = files;
	}

	public Integer getBno() {
		return bno;
	}
	
	public void setBno(Integer bno) {
		this.bno = bno;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getWriter() {
		return writer;
	}
	
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public int getViewCnt() {
		return viewCnt;
	}
	
	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [bno=" + bno + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", regDate=" + regDate + ", viewCnt=" + viewCnt + ", files="
				+ Arrays.toString(files) + "]";
	}

}
