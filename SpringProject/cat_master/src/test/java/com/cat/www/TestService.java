package com.cat.www;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cat.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestService {
	@Autowired
	MemberService ms;
	
	
	@Test
	public void testSendEmail() {
		String text="test";
		String id="boss_25@naver.com";
		ms.sendHtmlEmail(text, id);
		System.out.println("발송완료");
	}
	@Test
	public void testDrictory() {
		ms.directoryCreate("test");
	}
	@Test
	public void testCheckID() {
		int rs=ms.checkId("test@t");
		System.out.println(rs);
	}
}
