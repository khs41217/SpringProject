package com.cat.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpSession;

import com.cat.dto.MemberVO;

public interface MemberService {
	void sendHtmlEmail(String text,String id);
	void directoryCreate(String id);
	String encryptionPw(String pw);
	int login(String id, String pw);
	int changePw(String id);
	void insertMember(MemberVO mVo);
	int checkId(String id);
	int checkPhone(String phone);
	MemberVO search_id_rs(String name, String phone);
	MemberVO getMember(String id);
	String changeProfile(String id, String profile);
	void autologin(HttpSession session, Cookie[] cookie);
}
