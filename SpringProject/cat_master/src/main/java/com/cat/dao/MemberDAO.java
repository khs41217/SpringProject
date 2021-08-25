package com.cat.dao;

import java.util.Map;

import com.cat.dto.MemberVO;

public interface MemberDAO {
	int checkId(String id);
	int login(String member_id, String member_pw);
	MemberVO getMember(String id);
	void insertMember(MemberVO mVo);
	MemberVO selectMember(String id);
	int deleteMember(String id);
	int updateProfile(Map<String, String> info);
	int checkPhone(String phone);
	void changePw(String changePw, String id);
	MemberVO search_id_rs(String name,String phone);
}
