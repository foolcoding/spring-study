package com.itbank.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(500)  
//WRITER    NOT NULL VARCHAR2(100)  
//WRITEDATE          DATE           
//QUESTION  NOT NULL VARCHAR2(4000) 
//VIEWCOUNT          NUMBER   

public class SurveyDTO {

	private int idx;
	private String title;
	private String writer;
	private Date writeDate;
	private String question;
	private int viewCount;
	private String memoA;
	private String memoB;
	private String originalFileName;
	private String storeFileName;

	public String getMemoA() {
		return memoA;
	}
	public void setMemoA(String memoA) {
		this.memoA = memoA;
	}
	public String getMemoB() {
		return memoB;
	}
	public void setMemoB(String memoB) {
		this.memoB = memoB;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getStoreFileName() {
		return storeFileName;
	}
	public void setStoreFileName(String storeFileName) {
		this.storeFileName = storeFileName;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	
}
