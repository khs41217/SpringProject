package com.cat.dto;

public class GoodsDetailsVO {
	private int idx;
	private String name;
	private int price;
	private String description;
	private String detailsimg;
	private float result_score;
	private int vote_num;
	private String type;
	
	

	public int getIdx() {
		return idx;
	}



	public void setIdx(int idx) {
		this.idx = idx;
	}



	public String getName() {
		return name;
	}



	public void setName(String name) {
		this.name = name;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getDetailsimg() {
		return detailsimg;
	}



	public void setDetailsimg(String detailsimg) {
		this.detailsimg = detailsimg;
	}



	public float getResult_score() {
		return result_score;
	}



	public void setResult_score(float result_score) {
		this.result_score = result_score;
	}



	public int getVote_num() {
		return vote_num;
	}



	public void setVote_num(int vote_num) {
		this.vote_num = vote_num;
	}



	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Override
	public String toString() {
		return this.name + " , " + this.price + " , " + this.description + " , " + this.detailsimg;
	}
}
