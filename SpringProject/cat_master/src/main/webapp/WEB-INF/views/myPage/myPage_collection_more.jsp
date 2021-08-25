<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

			<c:forEach var="goods" items="${collectionList}">
	        		<li id="collectionId_${goods.idx}">
		                <div>
		                    <div class="jss1013" onclick="inProduct('${goods.idx}')"> 
		                        <img src="${goods.img}" width="110" height="110">
		                    </div>
		                    <div class="jss1014">
		                        <div class="jss1015">
		                            <h3><a>${goods.name}</a></h3>
		                            <div class="jss1016">
		                                <strong><fmt:formatNumber value="${goods.price}" pattern="#,###"/></strong>
		                            </div>
		                            <!-- 별점 시작 -->
									<div class="jss1017">
										<div class="jss1017">
											<span class="jss1018"> <span
												class="MuiRating-root jss1020 MuiRating-readOnly"
												role="img" aria-label="5 Stars">
												<c:forEach var = "num" begin = "1" end = "5"> 
												<span
													class="MuiRating-decimal">
													<!-- 별점 보라색 영역 -->
													<c:choose>
														<c:when test="${goods.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - goods.result_score > 0.5 && num - goods.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - goods.result_score <= 0.5 && num - goods.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
														<c:when test="${num - goods.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
													</c:choose> 
													<span style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;">
															<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021">
																<svg class="MuiSvgIcon-root" focusable="false"
																	viewBox="0 0 48 48" aria-hidden="true"
																	role="img">
                                                                                   <path
																		fill="#c4c4c6" fill-rule="evenodd"
																		d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                                                               </svg>
														</span>
													</span> <span>
													<!-- 별점 회색 영역 --> 
													<span class="MuiRating-icon jss1019 MuiRating-iconFilled jss10210"> 
																<svg class="MuiSvgIcon-root" focusable="false"
																	viewBox="0 0 48 48" aria-hidden="true"
																	role="img">
                                                                                   <path
																		fill="#c4c4c6" fill-rule="evenodd"
																		d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                                                               </svg>
														</span>
													</span>
												</span>
												</c:forEach> 
											</span>
											</span>
											
										</div class="jss1017">
										<span class="b3999">(${goods.vote_num})</span>
									</div>
									<!-- 별점 끝 -->
		                            <div class="jss1022">
		                                <button onclick="delCollection('${goods.idx}')" class="jss1023 buttonG" tabindex="0" type="button">
		                                    <span class="MuiButton-label">삭제</span>
		                                    <span class="MuiTouchRipple-root"></span>
		                                </button>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </li>
	        	</c:forEach>
	        	<c:if test="${not empty collectionList}">
	        		<script type="text/javascript">
	        			canMore = true
					</script>
	        	</c:if>