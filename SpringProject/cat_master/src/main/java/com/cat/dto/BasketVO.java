package com.cat.dto;

public class BasketVO {
	private int idx;
	private String member_id;
	private int goods_idx; 
	private int quantity;
	
	private String name;
	private String img;
	private int price;
	private int sale;
	private String catecory;
	private int del;
	
	String addr1;
	String addr2;
	String addr3;
	String req;
	
	
	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	public String getReq() {
		return req;
	}

	public void setReq(String req) {
		this.req = req;
	}

	public int getGoods_idx() {
		return goods_idx;
	}

	public void setGoods_idx(int goods_idx) {
		this.goods_idx = goods_idx;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public int getSale() {
		return sale;
	}

	public void setSale(int sale) {
		this.sale = sale;
	}

	public String getCatecory() {
		return catecory;
	}

	public void setCatecory(String catecory) {
		this.catecory = catecory;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String toString() {
		return idx + member_id + goods_idx ;
		
	}
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getGood_id() {
		return goods_idx;
	}
	public void setGood_id(int good_id) {
		this.goods_idx = good_id;
	}
	public int getQuanity() {
		return quantity;
	}
	public void setQuanity(int quanity) {
		this.quantity = quanity;
	}
	
}
