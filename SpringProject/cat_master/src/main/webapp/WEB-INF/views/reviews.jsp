<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="resources/css/reviews.css">
<title>Insert title here</title>
</head>
<body>
	<div class="a1073">
		<h2 class="a1074">구매후기</h2>
		<div class="a1075">
			<div class="a1076">
				<div class="a1077">
					<button class="a1078 a1078_select" tabindex="0" type="button"
						role="tab" aria-selected="true" id="reviews">
						<span class="a1079">구매후기(${reviewCnt})</span>
					</button>
				</div>
				<span class="a1080" style="left: 10px; width: 140px;"></span>
			</div>
		</div>
		<div class="a1081">
			<img class="a1082" src="resources/img/img/reviewTopBanner.svg" sizes="auto">
		</div>
		<div class="a1083">
			<div class="a1084">
				<c:forEach items="${relist}" var="review">
					<div class="a1085">
						<div class="a1086">
							<span class="a1087" role="button"> <picture class="a1088">
								<img class="a1089" src="${contextPath}/resources/profile/${review.member_id}/${review.memberProfile}"
									sizes="auto"></picture>
							</span>
							<div class="a1090">
								<div class="a1091">
									<!-- 별점 -->
									<span class="MuiRating-root jss1020 MuiRating-readOnly" role="img" aria-label="5 Stars">
									<c:forEach var="i" begin="1" end="5">
										<c:choose>
											<c:when test="${review.star>=i }">
			                                    <span class="MuiRating-decimal">
			                                        <span style="width: 0%; overflow: hidden; z-index: 1; position: absolute;">
			                                            <span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
			                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
			                                            </span>
			                                        </span>
			                                        <span>
			                                            <span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
			                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
			                                            </span>
			                                        </span>
			                                    </span>
											</c:when>
											<c:otherwise>
												<span class="MuiRating-decimal">
			                                        <span style="width: 100%; overflow: hidden; z-index: 1; position: absolute;">
			                                            <span class="MuiRating-icon jss1019 MuiRating-iconFilled">
			                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
			                                            </span>
			                                        </span>
			                                        <span>
			                                            <span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
			                                                <svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img"><path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
			                                            </span>
			                                        </span>
			                                    </span>
											</c:otherwise>
										</c:choose>
									</c:forEach>
									</span>
									<!-- 별점 -->
									구매인증됨
									<div class="a1092"></div>
									${review.writedate}
								</div>
								<span>${review.member_id} </span>
							</div>
						</div>
						<div>
							<div class="a1093">
								<div class="a1094">
									<h3>${review.title}</h3>
									<div>${review.content}</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 페이징 -->
			         <nav style="margin-left: 10px;">
                <ul class="jss1025">
               <li style="margin-top: -22px; padding: 15px;">
                  <a tabindex="0" type="button" aria-current="true">
                     <span> <svg focusable="false" viewBox="0 0 24 24"
                           aria-hidden="true" role="img" id="page" onclick="changeReviewPage(1)">
                           <path
                              d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
                     </span>
                  </a>
               </li>
               <li style="margin-top: -22px; padding: 15px;">
                  <a tabindex="0" type="button" aria-current="true">
                     <span> <svg focusable="false" viewBox="0 0 24 24"
                           aria-hidden="true" role="img" id="page" onclick="changeReviewPage(${currPage -1})">
                           <path
                              d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"></path></svg>
                     </span>
                  </a>
               </li>
               <c:forEach var="i" begin="${startPage}" end="${endPage}">
               <li>
                  <li style="margin-top: -27px; padding: 15px;">
                     <a class="jss1026" tabindex="0" type="button" target="_self"
                        aria-current="true" id="page" onclick="changeReviewPage(${i})">${i}</a>
                  </li>
               </c:forEach>
               <li style="margin-top: -22px; padding: 15px;">
                  <a tabindex="0" type="button" aria-current="true">
                     <span class="MuiButton-label"> <svg focusable="false"
                           viewBox="0 0 24 24" aria-hidden="true" role="img" id="page" onclick="changeReviewPage(${currPage +1})">
                           <path
                              d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"
                              transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
                     </span>
                  </a>
               </li>
               <li style="margin-top: -22px; padding: 15px;">
                  <a tabindex="0" type="button" aria-current="true">
                     <span class="MuiButton-label"> <svg focusable="false"
                           viewBox="0 0 24 24" aria-hidden="true" role="img" id="page" onclick="changeReviewPage(${realEndPage})">
                           <path
                              d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"
                              transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
                     </span>
                  </a>
               </li>
            </ul>
         </nav>

			<!-- 페이징 -->
		</div>
	</div>
</body>
</html>