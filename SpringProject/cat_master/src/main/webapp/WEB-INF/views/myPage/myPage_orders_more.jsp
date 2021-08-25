<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
		                            <a onclick="inProduct('${order.goods_idx}')">
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
	            <c:if test="${not empty orderList}">
	        		<script type="text/javascript">
	        			canMore = true
					</script>
	        	</c:if>