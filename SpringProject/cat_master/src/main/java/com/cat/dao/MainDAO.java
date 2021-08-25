package com.cat.dao;

import java.util.List;
import java.util.Map;

import com.cat.dto.BasketVO;
import com.cat.dto.ChattingVO;
import com.cat.dto.GoodsDetailsVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.ReviewVO;

public interface MainDAO {
	GoodsVO selectGoods(int idx);
	List<GoodsVO> scoreDescList();
	List<GoodsVO> voteNumDescList();
	List<GoodsVO> mainRankList();
	List<GoodsDetailsVO> goodsDetails(Map param);
	List<String> goodsImgList(int idx);
	void insertLike(Map param);
	void deleteLike(Map param);
	List<GoodsVO> searchResult(Map keywordMap);
	int searchCount(String keyword);
	void insertRecently(Map param);
	void deleteRecently(Map param);
	String selectRecently(Map param);
	List<GoodsVO> descList(Map param);
	int allGoodsCount();
	List<ReviewVO> ReviewInProduct(int goods_idx);
	int insertChatting(Map<String, Object> info);
	List<ChattingVO> selectChattingList(String id);
	int insertbasket(Map param);
	String checkbasket(Map param);
	int delbasket(int idx);
	List<ReviewVO> showMainReview();
	List<BasketVO> selectbasket(String id);
	int minusBasket(Map<String, Object> info);
	int plusBasket(Map<String, Object> info);
	int deleteBasket(Map<String, Object> info);
	List<BasketVO> quantityCheck(Map<String, Object> info);
	int insertOrder(Map<String, Object> orderList);
	int insertAvailableReviews(Map<String, Object> info);
	int updateGoodsQuantity(Map<String, Object> info);
	int clearBasket(String id);
	int updateMemberInfo(Map<String, Object> memberInfoList);
	int ReviewCnt();
	List<ReviewVO> paging(Map page);
	List<GoodsVO> selectDirectGoods(int idx);
	int directInsertOrder(Map<String, Object> directOrderMap);
	List<ReviewVO> showReview();
}
