package com.cat.service;

import java.util.List;
import java.util.Map;

import com.cat.dto.BasketVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.ReviewVO;

public interface MainService {
	Map<String , Object> main();
	Map<String , Object> details(Map param);
	void recently(Map param);
	Map<String, Object> search(Map keywordMap);
	void like(Map param);
	void unlike(Map param);
	int ReviewCnt();
	List<ReviewVO> paging(Map page);
	List<BasketVO> basket(String id);
	String updatebasket(String id, String type, int idx);
	String deleteBasket(String id, int idx);
	int insertbasket(Map param);
	String insertOrder(Map<String, Object> orderList);
	int clearBasket(String id);
	String updateMemberInfo(Map<String, Object> memberInfoList);
	List<GoodsVO> selectGoods(int idx);
	String directInsertOrder(Map<String, Object> directOrderMap);
	GoodsVO getGoods(int idx);
}
