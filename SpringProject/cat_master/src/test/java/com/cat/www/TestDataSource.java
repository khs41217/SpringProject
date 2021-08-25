package com.cat.www;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cat.dao.MemberDAO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestDataSource {
	@Autowired
	private MemberDAO dao;
	
	
	//아이디 중복check
	//1 중복된 아이디 없음
	//-1중복된 아이디
	//0 서버오류
	@Test
	public void testcheckId() throws Exception {
		String id="boss_25@naver.com";
		int result=dao.checkId(id);
		System.out.println(result);
		
	}
	@Test
	public void testCheckPhone() {
		int rs=dao.checkPhone("010-5146-7383");
		System.out.println(rs);
	}
	
	
}
