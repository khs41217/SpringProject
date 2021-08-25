package com.cat.dto;

public class MemberVO {
	
	private String id;
	private String pw;
	private String name;
	private String phone;
	private String joindate;
	private String profile;
	private String addr1;
	private String addr2;
	private String addr3;

	public MemberVO() {}
	public MemberVO(String id, String pw, String name, String phone, String joindate, String profile, String addr1,
			String addr2, String addr3) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.joindate = joindate;
		this.profile = profile;
		this.addr1 = addr1;
		this.addr2 = addr2;
		this.addr3 = addr3;
	}
	
	public MemberVO(String id, String pw, String name, String phone) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pw=" + pw + ", name=" + name + ", phone=" + phone + ", joindate=" + joindate
				+ ", profile=" + profile + ", addr1=" + addr1 + ", addr2=" + addr2 + ", addr3=" + addr3 + "]";
	}
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getJoindate() {
		return joindate;
	}
	public void setJoindate(String joindate) {
		this.joindate = joindate;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
}
