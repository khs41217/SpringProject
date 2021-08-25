package com.cat.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.dto.BasketVO;
import com.cat.dto.ChattingVO;
import com.cat.dto.GoodsDetailsVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.ReviewVO;
@Repository
public class MainDAOImpl implements MainDAO {
	@Autowired
	private SqlSession sqlsession;
	@Autowired
	static
	MainDAO mainDAO;
	
	public static MainDAO getMainDAO() {
		return mainDAO;
	}

	public GoodsVO selectGoods(int idx){
		GoodsVO goods = null;
		
		try {
			goods = sqlsession.selectOne("com.cat.mappers.mainMappers.selectGoods", idx);
		}finally {
			
		}
		return goods;
	}
	
	public List<GoodsVO> scoreDescList(){//별점 높은순으로 메인에 뿌려줌
		List<GoodsVO> list = null;
	
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.scoreDescList");
		}finally {
		}
		return list;		
	}
	
	public List<GoodsVO> voteNumDescList() {//투표 많은순으로 메인에 뿌려줌
		List<GoodsVO> list = null;
		
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.voteNumDescList");
		}finally {
		}
		return list;
	}
	
	public List<GoodsVO> mainRankList() {// 랭킹 : 판매량 순으로 9개 메인에 뿌림
		List<GoodsVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.goodsRank");
		}finally {
		}
		return list;
	}
	
	public List<GoodsDetailsVO> goodsDetails(Map param){// 상품 상세 정보 페이지
		List<GoodsDetailsVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.goodsDetails",param);
		}finally {
		}		
		return list;
	}

	public List<String> goodsImgList(int idx){// 상품 상세 정보 페이지 이미지 5장
		List<String> list = null;
		
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.DetailsImg",idx);
		}finally {
		}			
		return list;
	}
	
	public void insertLike(Map param) {// 상품 좋아요 
		sqlsession.insert("com.cat.mappers.mainMappers.insertLike", param);

	}
	
	public void deleteLike(Map param) {// 상품 좋아요 취소 
		sqlsession.insert("com.cat.mappers.mainMappers.deleteLike", param);
	}
	
	public List<GoodsVO> searchResult(Map keywordMap) {
		List<GoodsVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.selectSearch",keywordMap);
		}finally {
		}
		return list;
	}
	
	public int searchCount(String keyword) {// 총 검색된 결과 수
		int count;	
		try {
			 count = sqlsession.selectOne("com.cat.mappers.mainMappers.selectSearchCount", keyword);
		}finally {
		}
		return count;
		
	}
	
	public void insertRecently(Map param) {// 최근 본 insert
		sqlsession.insert("com.cat.mappers.mainMappers.insertRecently", param);
	}
	
	public void deleteRecently(Map param) {// 최근 본 delete
		sqlsession.insert("com.cat.mappers.mainMappers.deleteRecently", param);
	}
	
	public String selectRecently(Map param) {// 최근에 본 입력 전 db에 있는 데이터인지 체크위해 select 		
		String result;
		try {
			 result = sqlsession.selectOne("com.cat.mappers.mainMappers.selectRecently", param);
		}finally {
		}
		return result;
	}
	
	public List<GoodsVO> descList(Map param) { //
		List<GoodsVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.selectSearchDesc",param);
		}finally {
		}
		return list;
	}
	
	public int allGoodsCount() { //
		int count;		
		try {
			 count = sqlsession.selectOne("com.cat.mappers.mainMappers.selectAllGoodsCount");
		}finally {
		}
		return count;		
	}

	public List<ReviewVO> ReviewInProduct(int goods_idx) {	//////	
		List<ReviewVO> list = null;
		
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.selectReviewInProduct",goods_idx);
		}finally {
		}	
		return list;
	}
	
	public int insertChatting(Map<String, Object> info){
		int state = 0;
		try {
			state = sqlsession.insert("com.cat.mappers.mainMappers.insertChatting", info);
		}finally {
		}
		
		return state;
	}
	
	public List<ChattingVO> selectChattingList(String id){
		List<ChattingVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.selectChattingList", id);
		}finally {
		}
		
		return list;
	}
	
	public int insertbasket(Map param) {//////
		int insertResult = 0;
		try {
			insertResult = sqlsession.insert("com.cat.mappers.mainMappers.insertBasket", param);
		} finally {
		}
		return insertResult;
	}
	
	public String checkbasket(Map param) { ////
		String checkResult = "";
		try {
			checkResult = sqlsession.selectOne("com.cat.mappers.mainMappers.checkInbasket", param);
		}finally {
		}
		return checkResult;
	}
	
	public int delbasket(int idx) { /////
		int delResult = 0;
		try {
			delResult = sqlsession.delete("com.cat.mappers.mainMappers.delBasket", idx);
		}finally {
		}
		return delResult;
	}
	
	public List<ReviewVO> showMainReview(){
		List<ReviewVO> list = null;
	    try {
	        list = sqlsession.selectList("com.cat.mappers.mainMappers.selectMainReview");
	        
	    } finally {
	    }
	    return list;
	}
	
	public List<BasketVO> selectbasket(String id) {
		List<BasketVO> list = null;
    try {
        list = sqlsession.selectList("com.cat.mappers.mainMappers.selectBasket", id);
        
    } finally {
    }
    return list;
}

	public int minusBasket(Map<String, Object> info){
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.mainMappers.minusBasket", info);
		} finally {
		}
		return state;
	}
	
	public int plusBasket(Map<String, Object> info){
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.mainMappers.plusBasket", info);
		} finally {
		}
		return state;
	}
	
	public int deleteBasket(Map<String, Object> info) {
		int state = 0;
		try {
			state = sqlsession.delete("com.cat.mappers.mainMappers.deleteBasket", info);
		} finally{
		}
		
		return state;
	}
	
	public List<BasketVO> quantityCheck(Map<String, Object> info) {
		List<BasketVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.quantityCheck", info);
		} finally {
		}
		return list;
	}
	
	public int insertOrder(Map<String, Object> orderList){
		int state = 0;
		try {
			state = sqlsession.insert("com.cat.mappers.mainMappers.insertOrder", orderList);
			} finally {
		}
		return state;
	}
	
	public int insertAvailableReviews(Map<String, Object> info){
		int state = 0;
		try {
			state = sqlsession.insert("com.cat.mappers.mainMappers.insertAvailableReviews", info);
		} finally {
		}
		return state;
	}
	
	public int updateGoodsQuantity(Map<String, Object> info) {
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.mainMappers.updateGoodsQuantity", info);
		} finally {
		}
		return state;
	}
	
	public int clearBasket(String id) {
		int state = 0;
		try {
			state = sqlsession.delete("com.cat.mappers.mainMappers.clearBasket", id);
		} finally {
		}
		return state;
		}
	
	public int updateMemberInfo(Map<String, Object> memberInfoList) {
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.mainMappers.updateMemberInfo", memberInfoList);
		} finally {
		}
		return state;
	}
	
	public int ReviewCnt() {
		int reviewCnt = 0;
		try {
			reviewCnt = sqlsession.selectOne("com.cat.mappers.mainMappers.ReviewCnt");
		} finally {
		}
		return reviewCnt;
	}
	public List<ReviewVO> paging(Map page) {
		List<ReviewVO>list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.paging", page);		
		} finally {
		}
		return list;
	}
	
	public List<ReviewVO> showReview(){
		List<ReviewVO>reviewList = null;
		try {
			reviewList = sqlsession.selectList("com.cat.mappers.mainMappers.showReview");
		} finally {
		}
		return reviewList;
	}
	public List<GoodsVO> selectDirectGoods(int idx) {
		List<GoodsVO> list = null;
		try {
			list = sqlsession.selectList("com.cat.mappers.mainMappers.selectOrder", idx);
		} finally {
		}
		return list;
	}
	
	public int directInsertOrder(Map<String, Object> directOrderMap){
		int state = 0;
		try {
			state = sqlsession.insert("com.cat.mappers.mainMappers.directInsertOrder", directOrderMap);
			} finally {
		}
		return state;
	}
}
