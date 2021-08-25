package com.cat.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cat.dao.MainDAO;
import com.cat.dao.MemberDAO;
import com.cat.dao.MyPageDAO;
import com.cat.dto.GoodsCollectionVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.MemberVO;
import com.cat.dto.OrderVO;
import com.cat.dto.ReviewVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	@Autowired
	private MyPageDAO myPageDAO;
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MainDAO mainDAO;

	public List<OrderVO> getOrderList(String id, int page) {
		Map<String, Object> info = new HashMap<>();
		
		info.put("id", id);
		info.put("page", page);
		
		return myPageDAO.selectOrderList(info);
	}
	
	public Map<String, Object> myPageInfo(String id) {
		Map<String, Object> info = new HashMap<>();
		
		MemberVO member = memberDAO.getMember(id);
		
		int totOftenSeen = myPageDAO.totCollection(id, "oftenSeen");
		int totLike = myPageDAO.totCollection(id, "like");
		int totRecently = myPageDAO.totCollection(id, "recently");
		int totCanWriteReview = myPageDAO.totCollection(id, "review");
		int totWriteReview = myPageDAO.totMyReview(id);

		info.put("member", member);
		
		info.put("totOftenSeen", totOftenSeen);
		info.put("totLike", totLike);
		info.put("totRecently", totRecently);
		info.put("totCanWriteReview", totCanWriteReview);
		info.put("totWriteReview", totWriteReview);
		
		return info;
	}
	
	public List<GoodsVO> getCollectionList(String id, int page, String type) {

		Map<String, Object> info = new HashMap<>();
		
		info.put("id", id);
		info.put("page", page);
		info.put("type", type);
		
		return myPageDAO.selectCollectionList(info);
	}
	
	public List<GoodsVO> deleteCollection(int goodsIdx, String memberId, String type, int page) {
		
		int state = myPageDAO.deleteCollection(goodsIdx, memberId, type);

		Map<String, Object> info = new HashMap<>();
		
		info.put("id", memberId);
		info.put("page", page);
		info.put("type", type);
		
		return myPageDAO.delAfterFoundCollection(info);
	}
	
	public List<GoodsVO> getWriteReviewList(String id, int page) {

		Map<String, Object> info = new HashMap<>();
		
		info.put("id", id);
		info.put("page", page);
		
		return myPageDAO.selectMyReviewList(info);
	}
	
	public String insertReview(ReviewVO vo, int reviewIdx) {
		
		GoodsCollectionVO goodsCollection = myPageDAO.selectCollection(reviewIdx);
		
		if(!goodsCollection.getMember_id().equals(vo.getMember_id())||goodsCollection.getGoods_idx()!=vo.getGoods_idx()) {
			return "error";
		}
		
		int state = myPageDAO.insertReview(vo);
		if (state == 0) {
			return "error";
		}
		
		myPageDAO.deleteCollection(vo.getGoods_idx(), vo.getMember_id(), "review");
		myPageDAO.updateGoodsStar(vo);
		return "success";
	}
	
	public String updateReview(ReviewVO review) {
		
		ReviewVO oldReview = myPageDAO.selectReview(review.getIdx());
		
		if(!review.getMember_id().equals(oldReview.getMember_id())) {
			return "error";
		}
		
		int state = myPageDAO.updateReview(review);
		
		int newStar = review.getStar() - oldReview.getStar();
		
		review.setStar(newStar);
		
		myPageDAO.updateGoodsStarOnly(review);
		
		if (state == 0) {
			return "error";
		}
		
		return "success";
	}
	
	public Map<String, Object> reviewModifyForm(int reveiwIdx) {
		Map<String, Object> info = new HashMap<>();
		
		ReviewVO review = myPageDAO.selectReview(reveiwIdx);
		GoodsVO goods = mainDAO.selectGoods(review.getGoods_idx());
		
		info.put("review", review);
		info.put("goods", goods);
		
		return info;
	}
	
	public String updatePhone(String id, String phone) {

		Map<String, String> info = new HashMap<>();
		
		info.put("id", id);
		info.put("phone", phone);
		
		int state = myPageDAO.updatePhone(info);
		
		if(state!=1) 
			return "error";
		
		return "success";
	}
	
	public String updatePw(String id, String pw) {
		
		Map<String, String> info = new HashMap<>();
		
		info.put("id", id);
		info.put("pw", pw);
		
		int state = myPageDAO.updatePw(info);
		
		if(state!=1) 
			return "error";
		
		return "success";
	}
}
