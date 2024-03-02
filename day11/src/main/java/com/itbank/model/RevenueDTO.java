package com.itbank.model;

import java.util.Date;

//IDX       NOT NULL NUMBER 
//GOODS_IDX NOT NULL NUMBER 
//SELLDATE           DATE   
//QUANTITY  NOT NULL NUMBER 
//CANCEL             NUMBER 

public class RevenueDTO {

	private int idx;
	private int goods_idx;
	private Date sellDate;
	private int quantity;
	private int cancel;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getGoods_idx() {
		return goods_idx;
	}
	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}
	public Date getSellDate() {
		return sellDate;
	}
	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getCancel() {
		return cancel;
	}
	public void setCancel(int cancel) {
		this.cancel = cancel;
	}
	
}
