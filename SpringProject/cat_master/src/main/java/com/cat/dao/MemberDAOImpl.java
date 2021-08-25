package com.cat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.dto.MemberVO;
@Repository
public class MemberDAOImpl implements MemberDAO {
	
	@Autowired
	
	MemberDAO memberDAO;
	@Autowired
	private SqlSession sqlSession;
	
	public  MemberDAO getMemberDAO() {
		return memberDAO;
	}
	//아이디 중복check
	//1 중복된 아이디 없음
	//-1중복된 아이디
	//0 서버오류
	@Override
	public int checkId(String id) {
		int result=0;
		try {
			int id2=sqlSession.selectOne("com.cat.mappers.MemberMappers.check_id", id);
			if(id2==1) {
				return -1;
			}else {
				return 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	@Override
	public int login(String member_id, String member_pw) {
//		로그인
//		-2:아이디없음
//		-1:서버오류
//		0:비밀번호틀림
//		1:성공
		String pwd=null;
		try {
			pwd=sqlSession.selectOne("com.cat.mappers.MemberMappers.login", member_id);
			
			if(pwd!=null) {
				return pwd.equals(member_pw)? 1:0;
			}else {
				return -2;
			}
	
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}
	}
	@Override
	public MemberVO getMember(String id) {
		MemberVO mVo=null;
		try {
			mVo=(MemberVO)sqlSession.selectOne("com.cat.mappers.MemberMappers.getMember", id);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mVo;
	}
	@Override
	public void insertMember(MemberVO mVo) {
		try {
			sqlSession.insert("com.cat.mappers.MemberMappers.insertMember", mVo);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public MemberVO selectMember(String id) {
		MemberVO member = null;
		try {
			member = sqlSession.selectOne("com.cat.mappers.MemberMappers.selectMember", id); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return member;
	}
	@Override
	public int deleteMember(String id) {
		int state = 0;
		try {
			state = sqlSession.delete("com.cat.mappers.MemberMappers.deleteMember", id); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return state;
	}
	@Override
	public int updateProfile(Map<String, String> info) {
		int state = 0;
		try {
			state = sqlSession.update("com.cat.mappers.MemberMappers.updateProfile", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}
		return state;
	}
	@Override
	public int checkPhone(String phone) {
		int result=0;
	       try {
	    	   int phone2=sqlSession.selectOne("com.cat.mappers.MemberMappers.checkPhone", phone);
				if(phone2==1) {
					result= -1;
				}else {
					result= 1;
				}
	       }catch(Exception e) {
	          e.printStackTrace();
	       }
	       return result;
	}
	@Override
	public void changePw(String changePw, String id) {
		HashMap map=new HashMap();
		map.put("changePw", changePw);
		map.put("id", id);
		try {
			sqlSession.update("com.cat.mappers.MemberMappers.changePw",map);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	@Override
	public MemberVO search_id_rs(String name,String phone) {
		MemberVO mVo=new MemberVO();
		HashMap map=new HashMap();
		map.put("name", name);
		map.put("phone", phone);
		try {
			mVo=sqlSession.selectOne("com.cat.mappers.MemberMappers.search_id_rs", map);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return mVo;
	}
}
