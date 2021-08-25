package com.cat.www;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cat.dto.BasketVO;
import com.cat.dto.GoodsVO;
import com.cat.dto.MemberVO;
import com.cat.dto.ReviewVO;
import com.cat.service.MainService;
import com.cat.service.MemberService;

@Controller
public class MainController {
	@Autowired
	MainService mainService;
	@Autowired
	MemberService memberService;

	
	@RequestMapping(value="main.main")
	public String main(HttpServletRequest request) {
		request.setAttribute("goodsListMap", mainService.main());
		return "main";
	}
	@RequestMapping(value="header")
	public String header() {
		return "common/header";
	}
	@RequestMapping(value="product")
	public String product(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();
		String id = (String) request.getSession().getAttribute("loginUser");
		int idx = Integer.parseInt(request.getParameter("idx"));
		param.put("idx", idx);
		param.put("id", id);
		request.setAttribute("detailsMap", mainService.details(param));
		request.setAttribute("idx", idx);
		mainService.recently(param); //최근 본 추가
		return "product";
	}
	
	@RequestMapping(value="search")
	public String search(HttpServletRequest request) {
		Map<String, Object> param = new HashMap<String, Object>();	
		String keyword = request.getParameter("keyword");
		int page = Integer.parseInt(request.getParameter("page"));
		param.put("keyword", keyword);
		param.put("page", page);
		request.setAttribute("searchListMap",mainService.search(param));
		request.setAttribute("keyword", keyword);
		request.setAttribute("selectedPage", page);
		request.setAttribute("startPage", ((page-1)/5)*5+1);
		return "search";
	}
	
	@RequestMapping(value="like")
	public void like(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		if(id == null) 
			return;
		Map<String, Object> param = new HashMap<String, Object>();
		String like_id = request.getParameter("id");
		int like_idx = Integer.parseInt(request.getParameter("idx"));
		param.put("like_id", like_id);
		param.put("like_idx", like_idx);
		mainService.like(param);
		return;
	}
	
	@RequestMapping(value="unlike")
	public void unlike(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		if(id == null) 
			return;
		Map<String, Object> param = new HashMap<String, Object>();
		String unlike_id = request.getParameter("id");
		int unlike_idx = Integer.parseInt(request.getParameter("idx"));
		param.put("unlike_id", unlike_id);
		param.put("unlike_idx", unlike_idx);
		mainService.unlike(param);
	}
	
	@RequestMapping(value="reviews")
	public String reviews(HttpServletRequest request) {
		int reviewCnt = mainService.ReviewCnt();
		
		int startPage = 1;
		int currPage = 1;
		int pageSize = 30;
		int realEndPage = reviewCnt / pageSize;
		
		if(reviewCnt % pageSize != 0) {
			realEndPage++;
		}
		
		if(request.getParameter("page") != null)
			currPage = Integer.parseInt(request.getParameter("page"));
		
		Map<String, Object>page = new HashMap<>();
		page.put("startRowNum", currPage * pageSize - (pageSize - 1));
		page.put("endRowNum", currPage * pageSize);
		List<ReviewVO>relist = mainService.paging(page);

		if(currPage > 4) {
			startPage = currPage - 4;
		}
		
		int endPage = startPage + 8;
		if(endPage > realEndPage) {
			endPage = realEndPage;
		}
		
		request.setAttribute("currPage", currPage);
		request.setAttribute("relist", relist);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("realEndPage", realEndPage-3);
		request.setAttribute("reviewCnt", reviewCnt);
		return "reviews";
	}
	
	@RequestMapping(value="basket")
	public String basket(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		List<BasketVO> list = mainService.basket(id);
		request.setAttribute("basketList", list);
		return "basket";
	}
	
	@RequestMapping(value="updateQty")
	public String updateQty(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int idx = Integer.parseInt(request.getParameter("idx"));
		String type = request.getParameter("type");
		mainService.updatebasket(id, type, idx);
		List<BasketVO> list = mainService.basket(id);
		request.setAttribute("basketList", list);
		return "basket";
	}
	
	@RequestMapping(value="deleteBasket")
	public String deleteBasket(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		int idx = Integer.parseInt(request.getParameter("idx"));
		mainService.deleteBasket(id, idx);
		List<BasketVO> list = mainService.basket(id); 
		request.setAttribute("basketList", list);
		return "basket";
	}
	
	@RequestMapping(value="insertBasket")
	public void insertBasket(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("idx", Integer.parseInt(request.getParameter("idx")));
		param.put("quantity", Integer.parseInt(request.getParameter("quantity")));
		param.put("id", id);
		int insertResult = mainService.insertbasket(param);
	}
	
	@RequestMapping(value="selectOrderList")
	public String selectOrderList(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		MemberVO member = memberService.getMember(id);
		request.setAttribute("addr1", member.getAddr1());
		request.setAttribute("addr2", member.getAddr2());
		request.setAttribute("addr3", member.getAddr3());
		List<BasketVO> list = mainService.basket(id);
		request.setAttribute("orderList", list);
		return "order";
	}
	
	@RequestMapping(value="insertOrder")
	public String insertOrder(HttpServletRequest request) {
		String userid =  (String) request.getSession().getAttribute("loginUser");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String req = request.getParameter("req"); 
		String total = request.getParameter("total");
		String status = "배송준비";
		Map<String, Object> orderMap = new HashMap<String, Object>();
		List<BasketVO> list2 =mainService.basket(userid); 
		for(BasketVO li : list2) {
			orderMap.put("idx",li.getGoods_idx());
			orderMap.put("qty",li.getQuantity());
			orderMap.put("id",userid);
			orderMap.put("name",name);
			orderMap.put("phone",phone);
			orderMap.put("addr1",addr1);
			orderMap.put("addr2",addr2);
			orderMap.put("addr3",addr3);
			orderMap.put("req",req);
			orderMap.put("total",total);
			orderMap.put("status", status);
			mainService.insertOrder(orderMap);
		}
		request.setAttribute("orderList", orderMap);
		mainService.clearBasket(userid);
		mainService.updateMemberInfo(orderMap);
		return "order_result";
	}
	@RequestMapping(value="selectDirectOrder")
	public String selectDirectOrder(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		MemberVO member = memberService.getMember(id);
		request.setAttribute("addr1", member.getAddr1());
		request.setAttribute("addr2", member.getAddr2());
		request.setAttribute("addr3", member.getAddr3());

		int qty = Integer.parseInt(request.getParameter("qty"));
		int idx = Integer.parseInt(request.getParameter("idx"));
		List<GoodsVO> list = mainService.selectGoods(idx);
		for(GoodsVO li: list) {
			request.setAttribute("price", li.getPrice());
			request.setAttribute("total", qty*li.getPrice());
		}
		request.setAttribute("goodsList", list);
		request.setAttribute("qty", qty);
		request.setAttribute("idx", idx);
		return "directOrder";
	}
	@RequestMapping(value="directInsertOrder")
	public String directInsertOrder(HttpServletRequest request) {
		String id = (String) request.getSession().getAttribute("loginUser");
		String userid = id; 
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		String addr3 = request.getParameter("addr3");
		String req = request.getParameter("req"); 
		String total = request.getParameter("total");
		String qty = request.getParameter("qty");
		String idx = request.getParameter("idx");			
		String status = "배송준비";
		Map<String, Object> directOrderMap = new HashMap<String, Object>();
		directOrderMap.put("id",userid);
		directOrderMap.put("idx",idx);
		directOrderMap.put("qty",qty);
		directOrderMap.put("addr1",addr1);
		directOrderMap.put("addr2",addr2);
		directOrderMap.put("addr3",addr3);
		directOrderMap.put("status", status);
		directOrderMap.put("name",name);
		directOrderMap.put("phone",phone);
		directOrderMap.put("req",req);
		directOrderMap.put("total",total);
		mainService.directInsertOrder(directOrderMap);
		request.setAttribute("directOrderList", directOrderMap);
		mainService.updateMemberInfo(directOrderMap);
		return "directOrder_result";
	}
}
