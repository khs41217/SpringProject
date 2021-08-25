<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
 <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>

<link rel="stylesheet" href="${contextPath}/resources/css/search.css">
</head>
<body>
	<div class="a1053">
        <div class="a1054">
            <div class="a1055">
                <h2 class="a1056">
                	<c:choose>
                		<c:when test = "${keyword eq ''}">
                			<strong>전체</strong>
                		</c:when>
                		<c:when test = "${keyword eq '(score/vote_num)'}">
                			<strong>별점 순</strong>
                		</c:when>
                		<c:when test = "${keyword eq 'vote_num'}">
                			<strong>평가 순</strong>
                		</c:when>
                		<c:when test = "${keyword eq 'quantity'}">
                			<strong>랭킹</strong>
                		</c:when>
                		<c:otherwise>
                			<strong>${keyword}</strong>
                		</c:otherwise>
                	</c:choose>
                    
                </h2>
            </div>
            <div class="a1057">
                <span class="a1058"><strong>${searchListMap.searchCount}</strong>개의 상품</span>
            </div>
        </div>
        <div>
            <div class="a1061">
                <div class="a1062">
                    <!-- item -->
                    <c:set var = "searchList" value = "${searchListMap.searchList}" /> 
        			<c:forEach var = "list" items = "${searchList}">
                    <div class="a1063">
                        <div class="a1064">
                            <a class="a1065" tabindex="0" aria-disabled="false" onclick = "inProduct(${list.idx})">
                                <div class="a1066">
                                    <img class="a1067" src="${list.img}" alt="${list.name}" sizes="auto">
                                </div>
                                <div class="a1069">
                                    <h3 class="a1070">${list.name}</h3>
                                    <div class="a1071">
                                        <strong class="a1072"><fmt:formatNumber value="${list.price}" pattern="###,###,###,###"/>원</strong>
                                    </div>
                                </div>
                                <!-- 별점 시작 -->
                                <div class="jss1017">
                                    <span class="jss1018">
                                    	<c:forEach var = "num" begin = "1" end = "5">
                                    	<c:choose>
											<c:when test="${list.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
											<c:when test="${num - list.result_score > 0.5 && num - list.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
											<c:when test="${num - list.result_score <= 0.5 && num - list.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
											<c:when test="${num - list.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
										</c:choose> 
                                        <span class="MuiRating-root jss1020 MuiRating-readOnly" role="img" aria-label="5 Stars">
                                            <span class="MuiRating-decimal">
                                                <span style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;">
                                                    <span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
                                                        <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
                                                    </span>
                                                </span>
                                                <span>
                                                    <span class="MuiRating-icon jss1019 MuiRating-iconFilled">
                                                        <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
                                                    </span>
                                                </span>
                                            </span>                                                                                                                                                                          
                                        </span>
                                        </c:forEach>
                                    </span>
                                    <span>(${list.vote_num})</span>
                                </div>
                                <!-- 별점 끝 -->
                            </a>
                        </div>
                    </div>
                    </c:forEach>
                    <!-- item -->
                </div>
            </div>            
        </div>
        <nav>
        	<c:set var = "pageCount" value = "${searchListMap.pageCount}" /> <!-- 검색된 총 페이지 수 -->
        	<c:set var = "startPage" value = "${startPage}" />
        	<c:set var = "endPage" value = "${startPage+4}" />
        	<c:if test="${endPage >= pageCount}"><c:set var = "endPage" value = "${pageCount}"/></c:if>
            <ul class="jss1025">
            	<c:if test="${endPage > 5}">
                <li>
                    <button class = "search2" tabindex="0" type="button" aria-current="true" onclick = "search('${endPage-5}','${keyword}')">
                        <span>
                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
                        </span>
                    </button>
                </li>      
                </c:if>
                <c:forEach var = "num" begin = "${startPage}" end = "${endPage}">
                <c:choose>
                <c:when test = "${selectedPage == num}"><c:set var = "selectedPageClass" value = "search1"/></c:when>
                <c:otherwise><c:set var = "selectedPageClass" value = ""/></c:otherwise>
                </c:choose>
                <li>
                    <button class = "search2 ${selectedPageClass}"  tabindex="0" type="button" aria-current="true" value = "${num}" onclick = "search('${num}','${keyword}')">${num}</button>
                </li>
				</c:forEach>
				<c:if test="${endPage < pageCount}">
                <li>
                    <button class = "search2" tabindex="0" type="button" aria-current="true" onclick = "search('${startPage+5}','${keyword}')">
                        <span class="MuiButton-label">
                            <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
                        </span>
                    </button>
                </li>
                </c:if>
            </ul>
        </nav>
    </div>
    <jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>
