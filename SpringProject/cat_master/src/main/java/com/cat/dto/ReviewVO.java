package com.cat.dto;

public class ReviewVO {
	int idx;
	int goods_idx;
	String member_id;
	int star;
	String title;
	String content;
	String writedate;
	String memberName;
	String memberProfile;
	
	int result_score;
	
	int rnum;
	
	public ReviewVO() {
	}
	
	public ReviewVO(int goods_idx, String member_id, int star, String title, String content, int result_score) {
		this.goods_idx = goods_idx;
		this.member_id = member_id;
		this.star = star;
		this.title = title;
		this.content = content;
		this.result_score = result_score;
	}
	public ReviewVO(int goods_idx, String member_id, int star, String title, String content) {
		this.goods_idx = goods_idx;
		this.member_id = member_id;
		this.star = star;
		this.title = title;
		this.content = content;
	}
	
	public int getResult_score() {
		return result_score;
	}

	public void setResult_score(int result_score) {
		this.result_score = result_score;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberProfile() {
		return memberProfile;
	}

	public void setMemberProfile(String memberProfile) {
		this.memberProfile = memberProfile;
	}
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
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
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

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

}
