package com.cat.www;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartRequest;

import com.cat.dto.MemberVO;
import com.cat.service.MemberService;

@Controller
public class MemberController {
	private static final String PROFILE_PATH = "C:\\springwork\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp1\\wtpwebapps\\CatPresident\\resources\\profile";
	@Autowired
	MemberService memberService;
	
	
	@RequestMapping(value="loginForm.member")
	public String member() {
		
		return "member/login";
	}	
	@RequestMapping(value="search_idForm.member")
	public String search_idFormMember(){
		return "member/search_id";
	}
	@ResponseBody
	@RequestMapping(value="login.member")
	public Integer login(String user_id, String user_pw, String rememberMe,HttpSession session,HttpServletResponse response) throws IOException {
		int loginRs= memberService.login(user_id, memberService.encryptionPw(user_pw));
		if(loginRs==1) {
			session.setAttribute("loginUser", user_id);
			if(rememberMe.equals("true")) {
				Cookie c= new Cookie("loginUser",user_id);
				c.setMaxAge(365*24*60*60);
				response.addCookie(c);
			}else {
				Cookie c=new Cookie("loginUser","");
				c.setMaxAge(0);
				response.addCookie(c);
			}
		}
		return loginRs;
	}
	@RequestMapping(value="logout.member")
	public void logout(HttpSession session,HttpServletResponse response) {
		session.removeAttribute("loginUser");
		Cookie c=new Cookie("loginUser","");
        c.setMaxAge(0);
        response.addCookie(c);
        return;
	}					
	@RequestMapping(value="Sign_upForm.member")
	public String Sign_upForm() {
		return "member/Sign_up";
	}
	@ResponseBody
	@RequestMapping(value="insertMember.member")
	public void intsertMember(MemberVO mVo) {
		mVo.setPw(memberService.encryptionPw(mVo.getPw()));
		mVo.setProfile("profile-empty.svg");
		memberService.insertMember(mVo);			
		return;
	}
	@ResponseBody
	@RequestMapping(value="checkId")
	public int checkId(String user_id) {
		return memberService.checkId(user_id);
	}
	@ResponseBody
	@RequestMapping(value="checkPhone")
	public int checkPhone(String user_phone) {
		return memberService.checkPhone(user_phone);
	}
	@RequestMapping(value="upload_profile")
	public void upload_profile(HttpSession session) {
		String id=(String) session.getAttribute("loginUser");
	}
	@RequestMapping(value="search_idForm")
	public String serch_idForm() {
		return "member/search_id";
	}
	@RequestMapping(value="search_pwForm")
	public String search_pwForm() {
		return "member/search_pw";
	}
	@ResponseBody
	@RequestMapping(value="search_id")
	public JSONObject search_id(String name, String phone) {
		MemberVO mVo=memberService.search_id_rs(name, phone);
		JSONObject json = new JSONObject();
		if(mVo==null) {
			json.put("id", "nothing");
			json.put("joindate", "nothing");
		}else {
			json.put("id", mVo.getId());
			json.put("joindate", mVo.getJoindate());
		}
		return json;
	}
	@RequestMapping(value="search_id_rs")
	public String search_id_rs() {

		return "member/search_id_rs";
	}
	@ResponseBody
	@RequestMapping(value="search_pw_rs")
	public int search_pw_rs(String id) {
		return memberService.changePw(id);
	}

//	public String uploadProfile(HttpServletRequest request, String id) {
//
//		int size = 1024 * 1024 * 10;
//		String path = PROFILE_PATH + id;
//		
//		MemberVO member = memberService.getMember(id);
//		
//		File olderFile = new File(path, member.getProfile());
//		
//		olderFile.delete();
//		
//		String originalFileName = "";
//		
//		try {
//			MultipartRequest multi = new MultipartRequest(request, path, size, "utf-8", new DefaultFileRenamePolicy());
//
//			Enumeration files = multi.getFileNames();
//	        String str = (String)files.nextElement();
//	        originalFileName = multi.getOriginalFileName(str);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		memberService.changeProfile(id, originalFileName);
//		
//		return originalFileName;
//	}
}
