package com.itbank.model;

//IDX      NOT NULL NUMBER         
//SV_IDX   NOT NULL NUMBER         
//M_USERID NOT NULL VARCHAR2(100)  
//ANSWER   NOT NULL VARCHAR2(4000) 

public class AnswerDTO {

	private int idx;
	private int sv_idx;
	private String m_userid;
	private String answer;
	
	private int count;
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getSv_idx() {
		return sv_idx;
	}
	public void setSv_idx(int sv_idx) {
		this.sv_idx = sv_idx;
	}
	public String getM_userid() {
		return m_userid;
	}
	public void setM_userid(String m_userid) {
		this.m_userid = m_userid;
	}

	
}
