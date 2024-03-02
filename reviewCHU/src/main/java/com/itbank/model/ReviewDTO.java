package com.itbank.model;

import java.sql.Date;
import org.springframework.web.multipart.MultipartFile;

//IDX        NOT NULL NUMBER         
//TITLE      NOT NULL VARCHAR2(1000) 
//WRITER     NOT NULL VARCHAR2(200)  
//CONTENT    NOT NULL VARCHAR2(4000) 
//UPLOADDATE          DATE           
//IMG        NOT NULL VARCHAR2(4000) 

public class ReviewDTO {

	private int idx;
	private String title;
	private String writer;
	private String content;
	private Date uploadDate;
	private String img;
	
	private MultipartFile upload;

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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public MultipartFile getUpload() {
		return upload;
	}

	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	
	
}
