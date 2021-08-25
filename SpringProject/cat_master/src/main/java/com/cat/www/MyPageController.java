package com.cat.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cat.dto.GoodsVO;
import com.cat.dto.MemberVO;
import com.cat.dto.OrderVO;
import com.cat.dto.ReviewVO;
import com.cat.service.MainService;
import com.cat.service.MemberService;
import com.cat.service.MyPageService;


@Controller
public class MyPageController {

	@Autowired
	MyPageService myPageService;
	@Autowired
	MainService mainService;
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="main.myPage")
	public String mainMyPage(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = (String) request.getSession().getAttribute("loginUser");
		
		if(id==null) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.write("<script>alert('로그인 후 이용하실 수 있습니다.');</script>");
			out.close();
			return "main";
		}else {
			Map<String, Object> info = myPageService.myPageInfo(id);
			request.setAttribute("info", info);
			return "myPage/myPage";
		}
	}
	@RequestMapping(value="available_reviews")
	public String available_reviews(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<GoodsVO> canWriteReviewList = myPageService.getCollectionList(id, page, "review");
		request.setAttribute("canWriteReviewList", canWriteReviewList);
		return "myPage/myPage_available_reviews";
	}
	@ResponseBody
	@RequestMapping(value="more_available_reviews")
	public JSONObject more_available_reviews(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = Integer.parseInt(request.getParameter("page"));
		
		List<GoodsVO> canWriteReviewList = myPageService.getCollectionList(id, page, "review");
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(GoodsVO goods : canWriteReviewList) {
			JSONObject obj = new JSONObject();
			
			obj.put("idx", goods.getIdx());
			obj.put("reviewIdx", goods.getReviewIdx());
			obj.put("regDate", goods.getRegDate());
			obj.put("img", goods.getImg());
			obj.put("name", goods.getName());
			obj.put("price", goods.getPrice());
			
			jsonArray.add(obj);
			
		}
		
		json.put("canWriteReviewList", jsonArray);
		
		return json;
	}
	@RequestMapping(value="writeReviews")
	public String writeReviews(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<GoodsVO> writeReviewList = myPageService.getWriteReviewList(id, page);
		request.setAttribute("writeReviewList", writeReviewList);
		return "myPage/myPage_write_reviews";
	}
	@ResponseBody
	@RequestMapping(value="moreWriteReviews")
	public JSONObject moreWriteReviews(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = Integer.parseInt(request.getParameter("page"));
		
		List<GoodsVO> writeReviewList = myPageService.getWriteReviewList(id, page);
		
		JSONObject json = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		
		for(GoodsVO goods : writeReviewList) {
			JSONObject obj = new JSONObject();
			
			obj.put("idx", goods.getIdx());
			obj.put("reviewIdx", goods.getReviewIdx());
			obj.put("regDate", goods.getRegDate());
			obj.put("img", goods.getImg());
			obj.put("name", goods.getName());
			obj.put("price", goods.getPrice());
			
			jsonArray.add(obj);
			
		}
		
		json.put("writeReviewList", jsonArray);
		
		return json;
	}
	@RequestMapping(value="often_seen")
	public String often_seen(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<GoodsVO> collectionList = myPageService.getCollectionList(id, page, "often_seen");
		request.setAttribute("collection", "often_seen");
		request.setAttribute("collectionList", collectionList);
		return "myPage/myPage_collection";
	}
	@RequestMapping(value="like.myPage")
	public String like(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<GoodsVO> collectionList = myPageService.getCollectionList(id, page, "like");
		request.setAttribute("collection", "like");
		request.setAttribute("collectionList", collectionList);
		return "myPage/myPage_collection";
	}
	@RequestMapping(value="recently_viewed")
	public String recently_viewed(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<GoodsVO> collectionList = myPageService.getCollectionList(id, page, "recently");
		request.setAttribute("collection", "recently");
		request.setAttribute("collectionList", collectionList);
		return "myPage/myPage_collection";
	}
	@RequestMapping(value="moreCollection")
	public String moreCollection(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = Integer.parseInt(request.getParameter("page"));
		String type = request.getParameter("type");
		List<GoodsVO> collectionList = myPageService.getCollectionList(id, page, type);
		request.setAttribute("collectionList", collectionList);
		return "myPage/myPage_collection_more";
	}
	@RequestMapping(value="delCollection")
	public String delCollection(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = Integer.parseInt(request.getParameter("page"));
		int goodsIdx = Integer.parseInt(request.getParameter("goodsIdx"));
		String type = request.getParameter("type");
		List<GoodsVO> collectionList = myPageService.deleteCollection(goodsIdx, id, type, page);
		request.setAttribute("collectionList", collectionList);
		return "myPage/myPage_collection_more";
	}
	@RequestMapping(value="orders")
	public String orders(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = 1;
		List<OrderVO> orderList = myPageService.getOrderList(id, page);
		request.setAttribute("orderList", orderList);
		return "myPage/myPage_orders";
	}
	@RequestMapping(value="moreOrders")
	public String moreOrders(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int page = Integer.parseInt(request.getParameter("page"));
		List<OrderVO> orderList = myPageService.getOrderList(id, page);
		request.setAttribute("orderList", orderList);
		return "myPage/myPage_orders_more";
	}
	@RequestMapping(value="reviewWriteForm")
	public String reviewWriteForm(HttpServletRequest request) {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int ReviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
		String regDate = request.getParameter("regDate");
		GoodsVO goods = mainService.getGoods(idx);
		request.setAttribute("goods", goods);
		request.setAttribute("ReviewIdx", ReviewIdx);
		request.setAttribute("regDate", regDate);
		return "myPage/myPage_review";
	}
	@RequestMapping(value="reviewModifyForm")
	public String reviewModifyForm(HttpServletRequest request) {
		int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
		Map<String, Object> info = myPageService.reviewModifyForm(reviewIdx);
		request.setAttribute("info", info);
		return "myPage/myPage_review_modify";
	}
	@RequestMapping(value="insertReview")
	public void insertReview(HttpServletResponse response,HttpServletRequest request) throws IOException {
		String id = (String) request.getSession().getAttribute("loginUser");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int reviewIdx = Integer.parseInt(request.getParameter("reviewIdx"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));
		ReviewVO vo = new ReviewVO(idx, id, star, title, content);
		String state = myPageService.insertReview(vo, reviewIdx);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.write(state);
		out.close();
	}
	@RequestMapping(value="updateReview")
	public void updateReview(HttpServletResponse response,HttpServletRequest request) throws IOException {
		String id = (String) request.getSession().getAttribute("loginUser");
		int idx = Integer.parseInt(request.getParameter("idx"));
		int goodsIdx = Integer.parseInt(request.getParameter("goodsIdx")); 
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int star = Integer.parseInt(request.getParameter("star"));
		ReviewVO review = new ReviewVO(goodsIdx, id, star, title, content);
		review.setIdx(idx);
		String state = myPageService.updateReview(review);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.write(state);
		out.close();
	}
	@RequestMapping(value="update")
	public String update(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		MemberVO member = memberService.getMember(id);
		request.setAttribute("member", member);
		return "myPage/myPage_update";
	}
	@RequestMapping(value="updatePhone")
	public String updatePhone() {
		return "myPage/myPage_update_phone";
	}
	@RequestMapping(value="updatePhoneAction")
	public String updatePhoneAction(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		String phone = request.getParameter("phone");
		String state = myPageService.updatePhone(id, phone);
		MemberVO member = memberService.getMember(id);
		request.setAttribute("state", state);
		request.setAttribute("member", member);
		return "myPage/myPage_update";
	}
	@RequestMapping(value="updatePw")
	public String updatePw() {
		return "myPage/myPage_update_pw";
	}
	@RequestMapping(value="updatePwAction")
	public String updatePwAction(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		String pw = request.getParameter("pw");
		String state = myPageService.updatePw(id, memberService.encryptionPw(pw));
		MemberVO member = memberService.getMember(id);
		request.setAttribute("state", state);
		request.setAttribute("member", member);
		return "myPage/myPage_update";
	}
}
