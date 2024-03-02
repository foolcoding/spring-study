package com.itbank.model;

//IDX      NOT NULL NUMBER         
//USERID   NOT NULL VARCHAR2(200)  
//USERPW   NOT NULL VARCHAR2(2000) 
//USERNAME NOT NULL VARCHAR2(200)  

public class AccountDTO {

	private int idx;
	private String userid;
	private String userpw;
	private String username;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	
}
