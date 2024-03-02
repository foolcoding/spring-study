package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UploadDTO {
	private int idx;
	private int sv_idx;
	private List<MultipartFile> upload;
	private String originalFileName;
	private String storeFileName;
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
	public List<MultipartFile> getUpload() {
		return upload;
	}
	public void setUpload(List<MultipartFile> upload) {
		this.upload = upload;
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
	
}
