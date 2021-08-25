<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resPath" value="resources/myPage/resources"/>
<c:set var="member"  value="${info.member}"/>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <link rel="stylesheet" href="${resPath}/css/headBox.css">
	    <link rel="stylesheet" href="${resPath}/css/sideBox.css">
	    <link rel="stylesheet" href="${resPath}/css/contentBox.css">
	    <link rel="stylesheet" href="${resPath}/css/buttonAnimation.css">
	    <script src="${resPath}/myPage_event.js?b"></script>
		<title>Insert title here</title>
		<script type="text/javascript">

			$(document).ready(function() {
				changeView('orders.myPage')
			})
	
			function changeView(path) {
				$(window).unbind()
				setHeaderEvent()
				$('html').scrollTop(0);
				$.ajax({
					url: path,
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('main').html(data)
				})
			}
		</script>
	</head>
	<body>
		
           <div class="headBox">
	        <div class="box1">
	            <a onclick="changeView('update.myPage')" style="display: flex; cursor: pointer;">
	                <div class="jss1027">
	                    <img id="myPageProfile" src="${contextPath}/resources/profile/${member.id}/${member.profile}">
	                    <span>편집</span>
	                </div>
	                <div style="float: left; margin: auto; margin-left: 10px;">
	                    <span class="jss1001">
	                        ${member.name}
	                        <svg class="gearImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M2 12c0-.865.11-1.703.316-2.504 1.126.06 2.191-.518 2.755-1.495.564-.977.533-2.188-.081-3.134 1.209-1.19 2.7-2.052 4.335-2.505.512 1.006 1.545 1.64 2.674 1.64s2.162-.634 2.674-1.64c1.634.453 3.126 1.316 4.335 2.505-.615.946-.646 2.158-.082 3.135.565.977 1.63 1.555 2.757 1.495.206.8.316 1.638.316 2.503 0 .865-.11 1.703-.316 2.504-1.127-.06-2.191.518-2.756 1.495-.565.977-.533 2.188.081 3.134-1.209 1.19-2.7 2.052-4.335 2.505-.512-1.006-1.545-1.64-2.674-1.64s-2.162.634-2.674 1.64c-1.634-.453-3.126-1.316-4.335-2.505.615-.946.646-2.158.082-3.135-.565-.977-1.63-1.555-2.757-1.495C2.11 13.704 2 12.866 2 12zm4.804 3c.63 1.091.81 2.346.564 3.524.408.29.842.541 1.297.75.917-.821 2.104-1.275 3.335-1.274 1.26 0 2.438.471 3.335 1.274.455-.209.889-.46 1.297-.75-.253-1.204-.052-2.459.564-3.524.615-1.066 1.601-1.867 2.77-2.25.046-.499.046-1.001 0-1.5-1.17-.383-2.156-1.184-2.771-2.25-.616-1.065-.817-2.32-.564-3.524-.408-.29-.842-.541-1.297-.75C14.418 5.546 13.23 6.001 12 6c-1.23 0-2.418-.453-3.335-1.274-.455.209-.89.46-1.297.75C7.621 6.68 7.42 7.935 6.804 9c-.615 1.066-1.601 1.867-2.77 2.25-.046.499-.046 1.001 0 1.5 1.17.383 2.156 1.184 2.771 2.25h-.001zM12 15c-1.657 0-3-1.343-3-3s1.343-3 3-3 3 1.343 3 3-1.343 3-3 3zm0-2c.552 0 1-.448 1-1s-.448-1-1-1-1 .448-1 1 .448 1 1 1z"></path></svg>
	                    </span>
	                    <p style="margin: 5px 0;">${member.id}</p>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a onclick="changeView('often_seen.myPage')" style="cursor: pointer;">
	                <div class="boxInA">
	                    <svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M6.5 2h11c.315 0 .611.148.8.4L21 6v15c0 .552-.448 1-1 1H4c-.552 0-1-.448-1-1V6l2.7-3.6c.189-.252.485-.4.8-.4zM19 8H5v12h14V8zm-.5-2L17 4H7L5.5 6h13zM9 10v2c0 1.657 1.343 3 3 3s3-1.343 3-3v-2h2v2c0 2.761-2.239 5-5 5s-5-2.239-5-5v-2h2z"></path></svg>
	                    <span class="spanInBox">자주구매</span>
	                    <strong id="oftenSeenCount" class="numInBox">${info.totOftenSeen}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a onclick="changeView('like.myPage')" style="cursor: pointer;">
	                <div class="boxInA">
	                    <svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path stroke="#38383A" stroke-width="2" fill="#fff" fill-rule="evenodd" d="M21.179 12.794l.013.014L12 22l-9.192-9.192.013-.014C.607 10.213.757 6.361 3.165 3.96 5.573 1.558 9.425 1.419 12 3.64c2.575-2.221 6.427-2.082 8.835.32 2.408 2.401 2.558 6.253.344 8.834z"></path></svg>
	                    <span class="spanInBox">관심</span>
	                    <strong id="likeCount" class="numInBox">${info.totLike}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	        <div class="box1">
	            <a onclick="changeView('recently_viewed.myPage')" style="cursor: pointer;">
	                <div class="boxInA">
	                    <svg class="itemImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M17.618 5.968l1.453-1.453 1.414 1.414-1.453 1.453c2.981 3.731 2.528 9.142-1.032 12.326-3.56 3.184-8.986 3.033-12.364-.344C2.26 15.986 2.108 10.559 5.292 7c3.184-3.56 8.595-4.013 12.326-1.032zM12 20c2.5 0 4.812-1.334 6.062-3.5s1.25-4.834 0-7C16.812 7.334 14.501 6 12 6c-3.866 0-7 3.134-7 7s3.134 7 7 7zM11 8h2v6h-2V8zM8 1h8v2H8V1z"></path></svg>
	                    <span class="spanInBox">최근본</span>
	                    <strong id="recentlyCount" class="numInBox">${info.totRecently}</strong>
	                    <svg class="arrowImg" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                </div>
	            </a>
	        </div>
	    </div>
		<div class="mainBox">
	
	        <div class="sideBox">
	            <div class="reviewBox">
	                <h3>구매후기</h3>
	                <div class="reviewBtnBox">
	                    <button onclick="changeView('available_reviews.myPage')" class="MuiButtonBase-root jss1002" tabindex="0" type="button">
	                        <span class="jss1003">작성 가능한</span> 
	                        <span class="jss1004">${info.totCanWriteReview}</span>
	                        <span class="MuiTouchRipple-root"></span>
	                    </button>
	                    <button onclick="changeView('writeReviews.myPage')" class="MuiButtonBase-root jss1002" tabindex="0" type="button">
	                        <span class="jss1003">이미 작성한</span> 
	                        <span class="jss1005">${info.totWriteReview}</span>
	                        <span class="MuiTouchRipple-root"></span>
	                    </button>
	                </div>
	                <div>
	                    <h3 class="jss1006">나의 쇼핑</h3>
	                </div>
	                <div class="jss283">
	                    <a class="jss1007" onclick="changeView('orders.myPage')">
	                        <span class="jss288">주문 · 배송</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a onclick="changeView('often_seen.myPage')" class="jss1007">
	                        <span class="jss288">자주구매</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a onclick="changeView('like.myPage')" class="jss1007">
	                        <span class="jss288">관심</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	                <div class="jss283">
	                    <a onclick="changeView('recently_viewed.myPage')" class="jss1007">
	                        <span class="jss288">최근본</span>
	                        <svg class="jss1008" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg>
	                    </a>
	                </div>
	            </div>
	        </div>
	        <div class="contentBox">
	            <main>
	            	
	            </main>
	        </div>
	    </div>
	    <jsp:include page="../common/footer.jsp"></jsp:include>
	</body>
</html>