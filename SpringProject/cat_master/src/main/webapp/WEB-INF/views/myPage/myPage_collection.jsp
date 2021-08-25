<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
	        .jss1009 {
	            padding: 12px 0;
	            border-bottom: 1px solid #cfcfd0;
	            display: flex;
	            justify-content: flex-start;
	        }
	        .jss1010 {
	            border-top: 0 none;
	            color: rgba(60, 60, 67, 0.6);
	            padding: 50px 16px;
	            display: flex;
	            flex-wrap: wrap;
	            box-sizing: border-box;
	            align-items: center;
	            flex-direction: column;
	            justify-content: center;
	            background-color: rgba(244, 244, 245, 1);
	        }
	        .jss1011 {
	            margin-bottom: 14px;
	        }
	        .jss1011 svg {
	            width: 60px;
	            height: 60px;
	        }
	        .jss1012 {
	            overflow: hidden;
	            border-top: 1px solid #cfcfd0;
	            border-bottom: 1px solid #cfcfd0;
	            margin: 0;
	            padding: 0;
	            position: relative;
	            list-style: none;
	        }
	        .jss1012 > li {
	            display: flex;
	            padding: 0 16px;
	            position: relative;
	            border-top: 1px solid #cfcfd0;
	            margin-top: -1px;
	            flex-direction: column;
	            width: 100%;
	            box-sizing: border-box;
	            text-align: left;
	            align-items: center;
	            justify-content: flex-start;
	            text-decoration: none;
	        }
	        .jss1012 > li > div {
	            width: 100%;
	            display: flex;
	            padding: 14px 0;
	        }
	        .jss1013 {
	            width: 110px;
	            height: 110px;
	            overflow: hidden;
	            position: relative;
	            flex-grow: 0;
	            flex-basis: 110px;
	            flex-shrink: 0;
	            margin-right: 14px;
	            cursor: pointer;
	        }
	        .jss1014 {
	            flex-grow: 1;
	            min-width: 0;
	        }
	        .jss1015 {
	            padding-right: 220px;
	            height: 100%;
	            display: flex;
	            position: relative;
	            align-items: flex-start;
	            flex-direction: column;
	        }
	        .jss1015 > h3 {
	            margin: 0;
	            font-size: 0.9rem;
	            font-weight: 500;
	            line-height: 1.5;
	        }
	        .jss1015 > h3 > a {
	            color: rgba(0, 0, 0, 1);
	            text-decoration: none;
	        }
	        .jss1016 {
	            line-height: 1.6;
	        }
	        .jss1016 > strong {
	            font-size: 1.3rem;
	        }
	
	        /* 별점 */
	        .jss1017 {
	            font-size: 1.0rem;
	            color: rgba(60, 60, 67, 0.6);
	            display: flex;
	            margin-top: 2px;
	            align-items: center;
	            white-space: nowrap;
	        }
	        .jss1018 {
	            display: flex;
	            margin-right: 4px;
	        }
	        .MuiRating-readOnly {
	            pointer-events: none;
	        }
	        .MuiRating-root {
	            color: #ffb400;
	            cursor: pointer;
	            display: inline-flex;
	            position: relative;
	            font-size: 2.4rem;
	            text-align: left;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .MuiRating-decimal {
	            position: relative;
	        }
	        .jss1019 {
	            margin: 0;
	        }
	        .MuiRating-icon {
	            display: flex;
	            transition: transform 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            pointer-events: none;
	        }
	        .MuiSvgIcon-root {
	            fill: currentColor;
	            width: 1em;
	            height: 1em;
	            display: inline-block;
	            font-size: 2.4rem;
	            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            flex-shrink: 0;
	            user-select: none;
	        }
	        .jss1020 svg {
	            width: 12px;
	            height: 12px;
	        }
	        .jss1021 path {
	            fill: rgba(162, 0, 199, 1);
	        }
	        /* 별점 */
	
	        .jss1022 {
	            top: 50%;
	            flex: none;
	            right: 0;
	            width: auto;
	            margin: 0;
	            position: absolute;
	            transform: translateY(-50%);
	            display: flex;
	            justify-content: flex-start;
	        }
	        .jss1022 > button {
	            margin: 0 4px;
	            padding: 10px 16px;
	            font-size: 1.0rem;
	            box-shadow: none !important;
	            font-weight: 400;
	            text-transform: capitalize;
	            border-color: currentColor;
	            min-width: 64px;
	            box-sizing: border-box;
	            transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1.75;
	            border-radius: 4px;
	            border: 0;
	            cursor: pointer;
	            display: inline-flex;
	            outline: 0;
	            position: relative;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            justify-content: center;
	            text-decoration: none;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .jss1023 {
	            color: rgba(138, 138, 142, 1);
	            position: relative;
	            overflow: hidden;
	            background-color: rgba(244, 244, 245, 1);
	        }
	        .jss1024 {
	            color: rgba(162, 0, 199, 1);
	            position: relative;
	            overflow: hidden;
	            background-color: rgba(248, 235, 251, 1);
	        }
	        .MuiButton-label {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .MuiTouchRipple-root {
	            top: 0;
	            left: 0;
	            right: 0;
	            bottom: 0;
	            z-index: 0;
	            overflow: hidden;
	            position: absolute;
	            border-radius: inherit;
	            pointer-events: none;
	        }
	
	    </style>
	    <script type="text/javascript">
	    	$(document).ready(function() {
	    		setBtnEvent()
	    	})
	    	
	    	
			var canMore = true
			var page = 1
		
			$(document).ready(function() {
				
				$(window).scroll(function(){

					if(canMore&&$(window).scrollTop() > ($('body').height()-1000)) {
						canMore = false						
						readMore()
					}

				})
				
				setBtnEvent()
			})
			
			function readMore() {
	    		
	    		var type = '${collection}'
	    		page++
				
				$.ajax({
					url: 'moreCollection.myPage',
			        data: {'page':page, 'type':type},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					
			        $('.jss1012').append(data)
		        	setBtnEvent()
		        	
				})
				
			}
	    	
	    	function delCollection(idx) {
	    		var type = '${collection}'
    			$.ajax({
					url: 'delCollection.myPage',
			        data: {'goodsIdx':idx, 'type':type, 'page':page},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {

		        	$('#collectionId_' + idx).remove()
		        	
			        $('.jss1012').append(data)
			        	
		        	setBtnEvent()
		        	
		        	switch (type) {
					case 'often_seen':
						var collectionCount = $('#oftenSeenCount').text() * 1
						$('#oftenSeenCount').text(--collectionCount)
						if(collectionCount===0) 
							changeView('often_seen.myPage')
		        	break;
					case 'like':
						var collectionCount = $('#likeCount').text() * 1
						$('#likeCount').text(--collectionCount)							
						if(collectionCount===0) 
							changeView('like.myPage')
						break;
					case 'recently':
						var collectionCount = $('#recentlyCount').text() * 1
						$('#recentlyCount').text(--collectionCount)
						if(collectionCount===0) 
							changeView('recently_viewed.myPage')
						break;
					}
		        	
				})
	    		
	    	}
	    	
	    </script>
		<title>Insert title here</title>
	</head>
	<body>
		<div>
			<c:choose>
				<c:when test="${collection == 'often_seen'}">
	    		    <h2>자주구매</h2>
				</c:when>
				<c:when test="${collection == 'like'}">
			        <h2>관심</h2>
				</c:when>
				<c:when test="${collection == 'recently'}">
			        <h2>최근본</h2>
				</c:when>
			</c:choose>
	        <c:if test="${empty collectionList}">
	        	<c:choose>
					<c:when test="${collection == 'often_seen'}">
		    		    <div class="jss1010">
	            			<span class="jss1011"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M6.5 2h11c.315 0 .611.148.8.4L21 6v15c0 .552-.448 1-1 1H4c-.552 0-1-.448-1-1V6l2.7-3.6c.189-.252.485-.4.8-.4zM19 8H5v12h14V8zm-.5-2L17 4H7L5.5 6h13zM9 10v2c0 1.657 1.343 3 3 3s3-1.343 3-3v-2h2v2c0 2.761-2.239 5-5 5s-5-2.239-5-5v-2h2z"></path></svg></span>
	            			자주 구매한 상품이 없습니다.
						</div>
					</c:when>
					<c:when test="${collection == 'like'}">
				        <div class="jss1010">
	            			<span class="jss1011"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path stroke="#86868A" stroke-width="2" fill="#fff" fill-rule="evenodd" d="M21.179 12.794l.013.014L12 22l-9.192-9.192.013-.014C.607 10.213.757 6.361 3.165 3.96 5.573 1.558 9.425 1.419 12 3.64c2.575-2.221 6.427-2.082 8.835.32 2.408 2.401 2.558 6.253.344 8.834z"></path></svg></span>
	            			관심 상품이 없습니다.
						</div>
					</c:when>
					<c:when test="${collection == 'recently'}">
				        <div class="jss1010">
	            			<span class="jss1011"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M17.618 5.968l1.453-1.453 1.414 1.414-1.453 1.453c2.981 3.731 2.528 9.142-1.032 12.326-3.56 3.184-8.986 3.033-12.364-.344C2.26 15.986 2.108 10.559 5.292 7c3.184-3.56 8.595-4.013 12.326-1.032zM12 20c2.5 0 4.812-1.334 6.062-3.5s1.25-4.834 0-7C16.812 7.334 14.501 6 12 6c-3.866 0-7 3.134-7 7s3.134 7 7 7zM11 8h2v6h-2V8zM8 1h8v2H8V1z"></path></svg></span>
	            			최근 본 상품이 없습니다.
						</div>
					</c:when>
				</c:choose>
	        </c:if>
	        <ul class="jss1012">
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
	            
	        </ul>
	        
	    </div>
	</body>
</html>