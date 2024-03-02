package com.itbank.model;

import org.springframework.web.multipart.MultipartFile;

//IDX       NOT NULL NUMBER         
//TITLE     NOT NULL VARCHAR2(200)  
//IMG       NOT NULL VARCHAR2(4000) 
//PRICE     NOT NULL NUMBER         
//INVENTORY          NUMBER   

public class GoodsDTO {
	
	private int idx;
	private String title;
	private String img;
	private int price;
	private String inventory;
	
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getInventory() {
		return inventory;
	}
	public void setInventory(String inventory) {
		this.inventory = inventory;
	}
	public MultipartFile getUpload() {
		return upload;
	}
	public void setUpload(MultipartFile upload) {
		this.upload = upload;
	}
	

}
