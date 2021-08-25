<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resPath" value="view/main"/>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="resources/css/catmain.css">		
		<title>행복을 담는시간 | 고양이대통령</title>
	</head>
	<body>
		<div>
			<div class="b3001">
				<div class="b3002">
					<div class="b3003">
						<div
							class="swiper-slide swiper-slide-duplicate swiper-slide-next"
							data-swiper-slide-index="1" style="width: 1419px;">
							<div class="jss168"
								style="height: 400px; background-image: url(https://img.catpre.com/web/catpre/event/main_banner/sno_top1_back_202104091546571.jpg)">
								<picture class="jss181">
								<source media="(max-width: 1199px)"
									srcset="https://img.catpre.com/mobile/catpre/event/main_banner/sno_top1_202104141017141.jpg">
								<source media="(min-width: 1200px)"
									srcset="https://img.catpre.com/web/catpre/event/main_banner/sno_top1_202104091546571.jpg">
								<img class="jss182 jss169 IE_HACK_mainBnrImg"
									src="https://img.catpre.com/web/catpre/event/main_banner/sno_top1_202104091546571.jpg"
									alt="[이벤트] 반려양품 쿠션베드 기획전" sizes="auto" style="height: 400px; ">
									<!-- width: 133%; -->
								</picture>
							</div>
						</div>
						<div class="b3012">
							<h2 class="b3013">별점 높은 순</h2>
							<div class="b3014">
								<div class="b3015">
									<div class="b3016"
										style="transform: translate3d(0px, 0px, 0px);">
										<c:set var = "goodsList" value = "${goodsListMap.goodsList1}" /> <!-- 이 상품 어때요? forEach 시작 -->
										  <c:forEach var = "list" items = "${goodsList}">  
											<div class="b3017"
												style="width: 206.5px; margin-right: 24px;">
												<div data-testid="root">
													<div class="b3018">
														<a class="b3019" tabindex="0" aria-disabled="false"
															onclick="inProduct(${list.idx})">
															<div class="b3020">
																<picture class="b3021">
																<source media="(max-width: 1199px)"
																	srcset="${list.img}">
																<source media="(min-width: 1200px)"
																	srcset="${list.img}">
																<img class="b3022"
																	src="${list.img}"
																	alt="${list.name}" sizes="auto"> </picture>
															</div>
															<div class="b3022">
																<h3 class="b3023">${list.name}</h3>
																<div class="b3024">
																	<strong class="3025"> ${list.price}원 </strong>
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
																					<c:when test="${list.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
																					<c:when test="${num - list.result_score > 0.5 && num - list.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
																					<c:when test="${num - list.result_score <= 0.5 && num - list.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
																					<c:when test="${num - list.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
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
																	<span class="b3999">(${list.vote_num})</span>
																</div>
																<!-- 별점 끝 -->
															</div> 
														</a>
													</div>
												</div>
											</div>
										</c:forEach> 
									 <!-- 이 상품 어때요? forEach 끝 -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
	<div style = "margin-top : 50px;"></div>	
	<hr class="b3029">
	<div class="b3012">
		<h2 class="b3013">평가 많은 순</h2>
		<div class="b3014">
			<div class="b3015">
				<div class="b3016" style="transform: translate3d(0px, 0px, 0px);">
					<c:set var = "goodsList" value = "${goodsListMap.goodsList2}" />
					<c:forEach var = "list" items = "${goodsList}"> <!-- 오늘의 딜 forEach 시작 -->
						<div class="b3017" style="width: 206.5px; margin-right: 24px;">
							<div data-testid="root">
								<div class="b3018">
									<a class="b3019" tabindex="0" aria-disabled="false"
										onclick="inProduct(${list.idx})">
										<div class="b3020">
											<picture class="b3021">
											<source media="(max-width: 1199px)"
												srcset="${list.img}">
											<source media="(min-width: 1200px)"
												srcset="${list.img}">
											<img class="b3022"
												src="${list.img}"
												alt="${list.name}" sizes="auto"> </picture>
										</div>
										<div class="b3022">
											<h3 class="b3023">${list.name}</h3>
											<div class="b3024">
												<strong class="3025"> ${list.price}원</strong>
											</div>
											<!-- 별점 시작 -->
											<div class="jss1017">
												<div class="jss1017">
													<span class="jss1018"> <span
														class="MuiRating-root jss1020 MuiRating-readOnly"
														role="img" aria-label="5 Stars">
														<c:forEach var = "num" begin = "1" end = "5"> 
																			<span class="MuiRating-decimal"> 
																			<c:choose>
																					<c:when test="${list.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
																					<c:when test="${num - list.result_score > 0.5 && num - list.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
																					<c:when test="${num - list.result_score <= 0.5 && num - list.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
																					<c:when test="${num - list.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
																				</c:choose>
																				<span style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;">
																						<span
																						class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021"><!-- 별점 보라색 영역 -->
																							<svg class="MuiSvgIcon-root" focusable="false"
																								viewBox="0 0 48 48" aria-hidden="true"
																								role="img">
		                                                                                        <path
																									fill="#c4c4c6" fill-rule="evenodd"
																									d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
		                                                                                    </svg>
																					</span>
																				</span> <span> <span
																						class="MuiRating-icon jss1019 MuiRating-iconFilled jss10210"> <!--  별점 회색 영역 -->
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
												<span class="b3999">(${list.vote_num})</span>
											</div>
											<!-- 별점 끝 -->
										</div> 
									</a>
								</div>
							</div>
						</div>
					</c:forEach>						
					</div>
				</div>
			</div>
		</div>
		<div style = "margin-top : 50px"></div>
		<hr class="b3029">
	<div class="b3030">
		<h2 class="b3031">랭킹</h2>
		<div class="b3032">
			<div class="b3033">
				<c:set var = "goodsList" value = "${goodsListMap.goodsList3}" />
				<c:set var = "i" value="1"/>
				<c:forEach var = "list" items = "${goodsList}"> <!-- 상품랭킹 forEach 시작 -->
			<div class="b3034">
				<div class="b3035">
					<c:choose>
						<c:when test="${i==1 }">
							<span class="b3036">1</span>
						</c:when>
						<c:when test="${i==2 }">
							<span class="b3036b">2</span>
						</c:when>
						<c:when test="${i==3 }">
							<span class="b3036c">3</span>
						</c:when>
						<c:otherwise>
							<span style="margin-left: -120px;">${i}</span>
						</c:otherwise>
					</c:choose>
				</div>
				<div class="b3037">
					<a class="b3038" tabindex="0" aria-disabled="false"
						onclick="inProduct(${list.idx})">
						<div class="b3039">
							::before
							<picture class="b3040">
								<source media="(max-width: 1199px)"
									srcset="${list.img}">
								<source media="(min-width: 1200px)"
									srcset="${list.img}">
								<img class="b3041b"
									src="${list.img}"
									alt="${list.name}" sizes="auto"> 
							</picture>
						</div>
						<div class="b3042">
							<h3 class="b3043">${list.name}</h3>
							<div class="b3044">
								<strong class="b3045">${list.price}원</strong>
							</div>
							<!-- 랭킹 별점 시작 -->
							<div class="b3046">
								<span class="b3047"> <span class="b3048" role="img"
									aria-label="4.5 Stars">
									<c:forEach var = "num" begin = "1" end = "5">
									<span class="b3049">
										 <!-- 별점 보라색 영역 -->
										 <c:choose>
											<c:when test="${list.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
											<c:when test="${num - list.result_score > 0.5 && num - list.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
											<c:when test="${num - list.result_score <= 0.5 && num - list.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
											<c:when test="${num - list.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
										</c:choose>  
									   <span style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;">
												<span class="b3050 jss1021" > <svg class="b3051"
														focusable="false" viewBox="0 0 48 48" aria-hidden="true"
														role="img">
	                                                                  <path
															fill="#c4c4c6" fill-rule="evenodd"
															d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363">
	                                                                  </path>
	                                                              </svg>
											</span>
										</span> <span> <span class="b3050"> <svg class="b3051"
														focusable="false" viewBox="0 0 48 48" aria-hidden="true"
														role="img">
	                                                                  <path
															fill="#c4c4c6" fill-rule="evenodd"
															d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363">
	                                                                  </path>
	                                                              </svg>
											</span>
										</span>
									</span>
									</c:forEach>
									</span>
								</span> <span class="b3999">(${list.vote_num})</span>
							</div>
						</div> <span class="b3052"></span>
					</a>
				</div>
			</div>
			<c:set var = "i" value = "${i+1}"/>
			</c:forEach>
		</div>
		</div>
	</div>
	<div class="b3054">
		<div class="b3055">
			<h2 class="b3056">고양이대통령 구매후기</h2>
			<div class="b3057">
				<div class="b3058">
					<div class="b3059">
						<c:set var = "reviewList" value = "${goodsListMap.reviewList}" />
						<c:forEach var = "list" items = "${reviewList}">
							<div class="b3060" data-swiper-slide-index="16"
								style="width: 324.75px; margin-right: 20px;">
								<a class="b3061" tabindex="0" aria-disabled="false"
									onclick="changeReviewPage(1)">
									<div class="b3062">
										<span class="b3063"> 
										<!-- 별점 시작 -->
											<div class="jss1017b">
												<span class="jss1018b"> <span
													class="MuiRating-root jss1020b MuiRating-readOnlyb"
													role="img" aria-label="5 Stars">
													
													<c:forEach var = "num" begin = "1" end = "5">
													<c:choose>
														<c:when test="${list.star >= num }"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - list.star > 0.5 && num - list.star < 1}"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - list.star <= 0.5 && num - list.star > 0}"><c:set var = "score" value = "50"></c:set></c:when>
														<c:when test="${num - list.star >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
													</c:choose>  
													<span
														class="MuiRating-decimalb"> <span
															style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;">
																<span
																class="MuiRating-icon jss1019 MuiRating-iconFilled jss1021b">
																	<svg class="MuiSvgIcon-rootb" focusable="false"
																		viewBox="0 0 48 48" aria-hidden="true" role="img">
																				<path fill="#c4c4c6" fill-rule="evenodd"
																			d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
															</span>
														</span> <span> <span
																class="MuiRating-icon jss1019 MuiRating-iconFilled">
																	<svg class="MuiSvgIcon-rootb" focusable="false"
																		viewBox="0 0 48 48" aria-hidden="true" role="img">
																				<path fill="#c4c4c6" fill-rule="evenodd"
																			d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path></svg>
															</span>
														</span>
													</span>
													</c:forEach>
												</span>
												</span>
											</div> <!-- 별점 끝 --> <span class="b3068">${list.writedate}</span></span>
									</div>
									<div class="b3069">
										<h4 class="b3070">
											<span>${list.title}</span>
										</h4>
										<p class="b3071">${list.content}</p>
									</div>
									<div class="b3072">
										<img class="b3074" src="${contextPath}/resources/profile/${list.member_id}/${list.memberProfile}" sizes="auto"> <span
											class="b3075">${list.memberName}</span>
									</div>
								</a>
							</div>
						</c:forEach>
					</div>
				</div> 
			</div>
			<jsp:include page="./common/footer.jsp"></jsp:include>
</body>
</html>