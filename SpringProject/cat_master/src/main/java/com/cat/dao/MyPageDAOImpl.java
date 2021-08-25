package com.cat.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cat.dto.GoodsCollectionVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.OrderVO;
import com.cat.dto.ReviewVO;
@Repository
public class MyPageDAOImpl implements MyPageDAO {
	@Autowired
	private SqlSession sqlsession;
	
	public List<OrderVO> selectOrderList(Map<String, Object> info) {
		List<OrderVO> orderList = null;
		try {
			orderList = sqlsession.selectList("com.cat.mappers.myPageMappers.selectOrderList", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
        }
		return orderList;
	}

	public int totCollection(String id, String type) {
		
		Map<String, Object> info = new HashMap<String, Object>();

		info.put("id", id);
		info.put("type", type);
		
		int tot = 0;

		try {
			tot = sqlsession.selectOne("com.cat.mappers.myPageMappers.totCollection", info);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		return tot;
	}
	
	public int totMyReview(String id) {
		int tot = 0;
		try {
			tot = sqlsession.selectOne("com.cat.mappers.myPageMappers.totMyReview", id);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		return tot;
	}
	
	public List<GoodsVO> selectCollectionList(Map<String, Object> info) {
		List<GoodsVO> collectionList = null;
		
		try {
			collectionList = sqlsession.selectList("com.cat.mappers.myPageMappers.selectCollectionList", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
        }
		
		return collectionList;
	}
	
	public List<GoodsVO> delAfterFoundCollection(Map<String, Object> info) {
		List<GoodsVO> collectionList = null;
		
		try {
			collectionList = sqlsession.selectList("com.cat.mappers.myPageMappers.delAfterFoundCollection", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return collectionList;
	}
	
	public List<GoodsVO> selectMyReviewList(Map<String, Object> info) {
		List<GoodsVO> collectionList = null;
		
		try {
			collectionList = sqlsession.selectList("com.cat.mappers.myPageMappers.selectMyReviewList", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return collectionList;
	}
	
	public GoodsCollectionVO selectCollection(int idx) {
		GoodsCollectionVO goodsCollection = null;
		
		try {
			goodsCollection = sqlsession.selectOne("com.cat.mappers.myPageMappers.selectCollection", idx); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return goodsCollection;
	}
	
	public GoodsCollectionVO selectCollection(int goodsIdx, String memberId, String type) {

		Map<String, Object> info = new HashMap<>();
		
		info.put("goodsIdx", goodsIdx);
		info.put("memberId", memberId);
		info.put("type", type);
	
		GoodsCollectionVO goodsCollection = null;
		
		try {
			goodsCollection = sqlsession.selectOne("com.cat.mappers.myPageMappers.selectCollectionType2", info); 
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return goodsCollection;
	}
	
	public int deleteCollection(int goodsIdx, String memberId, String type) {
		
		Map<String, Object> info = new HashMap<>();
		
		info.put("goodsIdx", goodsIdx);
		info.put("memberId", memberId);
		info.put("type", type);
		
		int state = 0;
		
		try {
			state = sqlsession.delete("com.cat.mappers.myPageMappers.deleteCollection", info);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
		}
		
		return state;
	}

	public int insertReview(ReviewVO vo) {
		int state = 0;
		try {
			state = sqlsession.insert("com.cat.mappers.myPageMappers.insertReview", vo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
	
	public int updateGoodsStar(ReviewVO vo) {
		int state = 0;

		try {
			state = sqlsession.update("com.cat.mappers.myPageMappers.updateGoodsStar", vo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
	
	public int updateGoodsStarOnly(ReviewVO vo) {
		int state = 0;

		try {
			state = sqlsession.update("com.cat.mappers.myPageMappers.updateGoodsStarOnly", vo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
	
	public int updateReview(ReviewVO vo) {
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.myPageMappers.updateReview", vo);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
	
	public ReviewVO selectReview(int idx) {
		ReviewVO review = null;
		try {
			review = sqlsession.selectOne("com.cat.mappers.myPageMappers.selectReview", idx);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}	
		return review;
	}
	
	public int updatePhone(Map<String, String> info) {
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.myPageMappers.updatePhone", info);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
	
	public int updatePw(Map<String, String> info) {
		int state = 0;
		try {
			state = sqlsession.update("com.cat.mappers.myPageMappers.updatePw", info);
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		}
		return state;
	}
}
