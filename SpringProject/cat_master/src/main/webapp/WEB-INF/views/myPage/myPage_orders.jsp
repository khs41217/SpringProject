<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
	        .b1001 {
	            margin: 20px 0 10px;
	            padding: 14px 0;
	            border-bottom: 0 none;
	            background-color: #fff;
	            font-size: 1.3rem;
	            font-weight: 700;
	        }
	        .b1002 {
	            table-layout: fixed;
	            width: 100%;
	            display: table;
	            border-spacing: 0;
	            border-collapse: collapse;
	        }
	        .b1003 {
	            display: table-header-group;
	        }
	        .b1004 {
	            color: inherit;
	            display: table-row;
	            outline: 0;
	            vertical-align: middle;
	        }
	        .b1005 {
	            border: 0 none;
	            padding: 12px 20px;
	            font-size: 1.0rem;
	            background-color: rgba(244, 244, 245, 1);
	            text-align: center;
	            color: rgba(0, 0, 0, 1);
	            font-weight: 700;
	            line-height: 2.4rem;
	            display: table-cell;
	            font-family: Noto Sans KR,sans-serif;
	            vertical-align: inherit;
	        }
	        .b1006 {
	            display: table-row-group;
	        }
	        .b1007 {
	            padding: 24px 20px;
	            font-size: 1.0rem;
	            border-color: rgba(235, 235, 235, 1);
	            text-align: center;
	            color: rgba(0, 0, 0, 1);
	            display: table-cell;
	            font-family: Noto Sans KR,sans-serif;
	            font-weight: 400;
	            line-height: 1.43;
	            border-bottom: 1px solid rgba(224, 224, 224, 1);
	            vertical-align: inherit;
	        }
	        .b1007-1 {
	            border-left: 1px solid rgba(235, 235, 235, 1);
	        }
	        .b1008 {
	            color: rgba(60, 60, 67, 0.6);
	        }
	        .b1009 {
	            padding: 24px 20px;
	            font-size: 1.4rem;
	            border-left: 1px solid rgba(235, 235, 235, 1);
	            border-color: rgba(235, 235, 235, 1);
	            color: rgba(0, 0, 0, 1);
	            display: table-cell;
	            text-align: left;
	            font-family: Noto Sans KR,sans-serif;
	            font-weight: 400;
	            line-height: 1.43;
	            border-bottom: 1px solid rgba(224, 224, 224, 1);
	            vertical-align: inherit;
	        }
	        .b1009-1 {
	            width: 100%;
	            display: flex;
	            padding: 0;
	        }
	        .b1010 {
	            width: 100px;
	            height: 100px;
	            position: relative;
	            flex-grow: 0;
	            flex-basis: 100px;
	            flex-shrink: 0;
	            margin-right: 20px;
	        }
	        .b1011 {
	            display: inline;
	        }
	        .b1012 {
	            width: 100%;
	            margin: auto;
	            display: block;
	            max-width: 100%;
	            cursor: pointer;
	        }
	        .b1013 {
	            flex-grow: 1;
	            min-width: 0;
	        }
	        .b1014 {
	            margin: 0;
	            font-size: .9rem;
	            font-weight: 400;
	            line-height: 1.5;
	        }
	        .b1014 > a {
	            color: rgba(0, 0, 0, 1);
	            text-decoration: none;
	        }
	        .b1015 {
	            font-size: 1.1rem;
	            font-weight: 700;
	        }
	        .b1016 {
	            font-weight: 700;
	        }
	    </style>
	    <script type="text/javascript">
		    var canMore = true
			var page = 1
		
			$(document).ready(function() {
				$(window).scroll(function(){
	
					if(canMore&&$(window).scrollTop() > ($('body').height()-1000)) {
						canMore = false						
						readMore()
					}
	
				})
			})
			
			function readMore() {
	    		
				page++
				
				$.ajax({
					url: 'moreOrders.myPage',
			        data: {'page':page},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					
			        $('.b1006').append(data)
			        	
				})
				
			}
	    </script>
		<title>Insert title here</title>
	</head>
	<body>
		<h2 class="b1001">주문 · 배송</h2>
	    <table class="b1002" aria-label="customized table">
	        <colgroup>
	            <col width="150px">
	            <col width="140px">
	            <col width="auto">
	            <col width="180px">
	        </colgroup>
	        <thead class="b1003">
	            <tr class="b1004">
	                <th class="b1005" scope="col">주문 번호</th>
	                <th class="b1005" scope="col">주문 일자</th>
	                <th class="b1005" scope="col">상품 정보</th>
	                <th class="b1005" scope="col">진행 상황</th>
	            </tr>
	        </thead>
	        <tbody class="b1006">
	            <c:forEach var="order" items="${orderList}">
	            	<tr class="b1004">
		                <td class="b1007">
		                    <span class="b1008">${order.idx}</span>
		                </td>
		                <td class="b1007 b1007-1">
		                    <span class="b1008">${order.orderDate}</span>
		                </td>
		                <td class="b1009">
		                    <div class="b1009-1">
		                        <div class="b1010">
		                            <a onclick="inProduct('${order.goodsIdx}')">
		                                <picture class="b1011">
		                                    <img class="b1012" src="${order.goodsImg}" sizes="auto">
		                                </picture>
		                            </a>
		                        </div>
		                        <div class="b1013">
		                            <h3 class="b1014">
		                                <a>${order.goodsName }</a>
		                            </h3>
		                            <strong class="b1015"><fmt:formatNumber value="${order.goodsPrice}" pattern="#,###"/>원</strong>
		                        </div>
		                    </div>
		                </td>
		                <td class="b1007 b1007-1">
		                    <div class="b1016">${order.status}</div>
		                </td>
		            </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	</body>
</html>