package com.cat.service;

import java.util.List;
import java.util.Map;

import com.cat.dto.GoodsVO;
import com.cat.dto.OrderVO;
import com.cat.dto.ReviewVO;

public interface MyPageService {
	List<GoodsVO> getCollectionList(String id, int page, String type);
	List<GoodsVO> getWriteReviewList(String id, int page);
	List<GoodsVO> deleteCollection(int goodsIdx, String memberId, String type, int page);
	List<OrderVO> getOrderList(String id, int page);
	Map<String, Object> reviewModifyForm(int reveiwIdx);
	String insertReview(ReviewVO vo, int reviewIdx);
	String updateReview(ReviewVO review);
	String updatePhone(String id, String phone);
	String updatePw(String id, String pw);
	Map<String, Object> myPageInfo(String id);
}
