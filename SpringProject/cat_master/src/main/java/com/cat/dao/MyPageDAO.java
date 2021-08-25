package com.cat.dao;

import java.util.List;
import java.util.Map;

import com.cat.dto.GoodsCollectionVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.OrderVO;
import com.cat.dto.ReviewVO;

public interface MyPageDAO {
	List<OrderVO> selectOrderList(Map<String, Object> info);
	int totCollection(String id, String type);
	int totMyReview(String id);
	List<GoodsVO> selectCollectionList(Map<String, Object> info);
	List<GoodsVO> delAfterFoundCollection(Map<String, Object> info);
	List<GoodsVO> selectMyReviewList(Map<String, Object> info);
	GoodsCollectionVO selectCollection(int idx);
	GoodsCollectionVO selectCollection(int goodsIdx, String memberId, String type);
	int deleteCollection(int goodsIdx, String memberId, String type);
	int insertReview(ReviewVO vo);
	int updateGoodsStar(ReviewVO vo);
	int updateGoodsStarOnly(ReviewVO vo);
	int updateReview(ReviewVO vo);
	ReviewVO selectReview(int idx);
	int updatePhone(Map<String, String> info);
	int updatePw(Map<String, String> info);
}
