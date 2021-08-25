<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
   <c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
   <!-- 당일 배송 마감 시간 계산 -->
   <c:set var="now" value="<%=new java.util.Date()%>" />   
   	
	<fmt:formatDate var = "nowFD" value="${now}" pattern="HHmm" />
	<fmt:parseDate var="nowPD" value="${nowFD}"  pattern="HHmm"/>
	
	<fmt:parseDate var="endTimePD" value="1759"  pattern="HHmm"/>

	<fmt:parseNumber var="now" value="${nowPD.time}" integerOnly="true" />
	<fmt:parseNumber var="endTime" value="${endTimePD.time}" integerOnly="true"/>

	<fmt:parseNumber var="cal_hh" value="${(endTime - now)  / (60000*60) }" integerOnly="true" />    
	<fmt:parseNumber var="cal_mm" value="${((endTime - now) / 60000) % 60}" integerOnly="true" />
	
	<!-- 당일 배송 마감 시간 계산 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>상품 상세</title>
    <link rel="stylesheet" href="${contextPath}/resources/css/product.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/product_header.css">
    <link rel="stylesheet" href="${contextPath}/resources/css/product_footer.css">
    <style>
    </style>
    <script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
     <script type="text/javascript">              
		function like(path){
			var id = '${loginUser}';
			var idx = ${idx};
			$.ajax({
				type: 'POST',  
				url: path,
				data: {"id": id, "idx": idx},	
				success: function(result){
				} 
			});
	  	}
		
		function insertCart(){ /////////////
			var id = '${loginUser}';
			var idx = ${idx};
			var quantity = $('#amount').attr("value");
			$.ajax({
				type: 'POST',  
				url: 'insertBasket.main',
				data: {"idx": idx, "quantity": quantity},	
				success: function(result){
					$('#cart_in_alert').css("display" , "");
				} 
			});
	  	}
		
		function confirm(){
			$('#cart_in_alert').css("display", "none");
			outProduct('basket.main');
		}
		
		 $('#NoLikeBtn').click(function(){
         	$('#NoLikeBtn').css("display" , "none");
            $('#LikeBtn').css("display" , "block");
            like('unlike.main');
         })
         
         $('#LikeBtn').click(function(){
         	$('#LikeBtn').css("display" , "none");
            $('#NoLikeBtn').css("display" , "block");
            like('like.main');
         })

		function directOrder() {
			var amount = $("#amount").val();
			var idx = ${idx};
			var price = $("#price").text();
			$('html').scrollTop(0);
			$(window).unbind()
			$.ajax({
				url: 'header.main',
				async : true,
				type : 'post',
				dataType : 'html',
				cache: false
			}).done(function (data) {
				$('#product_box').children().remove()
				$('#outermost_box').html(data)
				var item = ''
				item += '<div>'
				item += '<div class="a2038"></div>'
				item += '<div id="htmlContent" style="position: relative; top: 168px;">'
				item += '</div>'
				item += '</div>'
				$('#outermost_box').append(item)
				changeDirectOrder(amount, idx)
			})
		}
		 function changeDirectOrder(amount, idx, price) {
				$(window).unbind()
				setHeaderEvent()
				$('html').scrollTop(0)
				$.ajax({
					url: 'selectDirectOrder.main',
					async : true,
					data : {'qty':amount, 'idx':idx, 'price':price},
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
			}
</script>
    <script src="${contextPath}/resources/js/footer.js"></script>
    <script src="${contextPath}/resources/js/product.js"></script>
    <script src="${contextPath}/resources/js/product_header.js"></script>  
</head>
<body style="overflow-x: hidden;">
	<jsp:include page="common/product_header.jsp"></jsp:include>
    <div>
        <div class="a2038"></div>
        <div style="position: relative; top: 121px;">
            <!-- 추가할 내용 하단에 추가-->
            <c:set var = "detailsValue" value = "${detailsMap.details}" />
            <c:set var = "imgList" value = "${detailsMap.imgList}" />
            
			<c:forEach var = "list" items = "${detailsValue}">		
            <div class="jss156">   
                <div class="jss158">
                    <div class="jss160"> <!--before-->
                        <div class="jss161">
                            <div class="jss168"> <!--왼쪽화면-->
                                <div>
                                                                
                               <img src="${imgList[0]}" id = "productImg" style="width: 656px; height: 686px;">
                                </div>
                                <div>
                                    <ul style="list-style: none; ">
                                    <c:forEach var = "num" begin = "0" end = "4">
                                    <li style="float: left;"><img src="${imgList[num]}" id = "productImg${num+1}" style="width:80px; height:80px;  border: 1px solid gray; margin-left:25px;"></li>                                
                                    </c:forEach>
                                    </ul>
                                </div>                               
                            </div>
                        </div>
                        <div class="jss162">
                            <div class="jss163">
                                <div class="jss214">
                                    <h2 class="jss215">${list.name}</h2>
                                    <div class="jss216"><span class="jss217">
                                    	<!--로그인이 안된 상태일 때 로그인 화면으로 이동 -->

										<c:choose>
										<c:when test="${loginUser == null}">
											<c:set var = "loginBtn" value = "onclick = 'alert(\"로그인 후 이용가능합니다.\");'" />
											<c:set var = "LikeBtnDisplay" value = "block" />
											<c:set var = "unLikeBtnDisplay" value = "none" />
										</c:when>
										<c:when test="${loginUser != null && list.type eq 'like'}">
											<c:set var = "LikeBtnDisplay" value = "none" />
											<c:set var = "unLikeBtnDisplay" value = "block" />
											<c:set var = "LikeBtn" value = "LikeBtn" />
										</c:when>
										<c:when test="${loginUser != null && list.type ne 'like'}">
											<c:set var = "LikeBtnDisplay" value = "block" />
											<c:set var = "unLikeBtnDisplay" value = "none" />
											<c:set var = "LikeBtn" value = "LikeBtn" />
										</c:when>
										</c:choose>
	                                    <button class="MuiButtonBase-root MuiIconButton-root jss218" tabindex="0" type="button" data-testid="like" ${loginBtn} style="display: ${LikeBtnDisplay};" id="${LikeBtn}"><span class="MuiIconButton-label">
                                                    <div class="jss220">
                                                        <div class="jss228 jss221"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" preserveAspectRatio="xMidYMid meet" style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px);">
                                                                <defs>
                                                                    <clipPath id="__lottie_element_3">
                                                                        <rect width="48" height="48" x="0" y="0"></rect>
                                                                    </clipPath>
                                                                </defs>
                                                                <g clip-path="url(#__lottie_element_3)">
                                                                    <g transform="matrix(1,0,0,1,7.926000595092773,10.04699993133545)" opacity="1" style="display: block;">
                                                                        <g opacity="1" transform="matrix(1,0,0,1,16.073999404907227,13.95300006866455)">
                                                                            <path fill="rgb(162,0,199)" fill-opacity="1" d=" M0.0010000000474974513,13.70300006866455 C0.0010000000474974513,13.70300006866455 -0.8159999847412109,12.991000175476074 -0.8159999847412109,12.991000175476074 C-1.1629999876022339,12.689000129699707 -1.5880000591278076,12.314000129699707 -2.052999973297119,11.901000022888184 C-6.849999904632568,7.644999980926514 -12.812000274658203,1.9809999465942383 -13.986000061035156,-0.828000009059906 C-15.822999954223633,-5.230000019073486 -13.814000129699707,-10.35200023651123 -9.505999565124512,-12.246999740600586 C-6.193999767303467,-13.70300006866455 -2.431999921798706,-12.878999710083008 -0.0010000000474974513,-10.321999549865723 C2.430000066757202,-12.878999710083008 6.190999984741211,-13.70199966430664 9.505000114440918,-12.246999740600586 C13.812000274658203,-10.35200023651123 15.822999954223633,-5.230000019073486 13.984000205993652,-0.828000009059906 C12.812000274658203,1.9780000448226929 6.8480000495910645,7.642000198364258 2.0510001182556152,11.901000022888184 C2.0510001182556152,11.901000022888184 0.0010000000474974513,13.70300006866455 0.0010000000474974513,13.70300006866455z M-6.130000114440918,-10.571999549865723 C-6.926000118255615,-10.571999549865723 -7.730999946594238,-10.40999984741211 -8.50100040435791,-10.071000099182129 C-11.62399959564209,-8.696999549865723 -13.069000244140625,-4.954999923706055 -11.722999572753906,-1.7289999723434448 C-10.96399974822998,0.08500000089406967 -6.735000133514404,4.519999980926514 -0.40799999237060547,10.135000228881836 C-0.27000001072883606,10.258999824523926 -0.13199999928474426,10.380000114440918 -0.0010000000474974513,10.494999885559082 C-0.0010000000474974513,10.494999885559082 0.40799999237060547,10.135000228881836 0.40799999237060547,10.135000228881836 C6.735000133514404,4.51800012588501 10.96399974822998,0.08399999886751175 11.720999717712402,-1.7289999723434448 C13.067000389099121,-4.954999923706055 11.623000144958496,-8.696999549865723 8.49899959564209,-10.071000099182129 C5.798999786376953,-11.260000228881836 2.6610000133514404,-10.276000022888184 1.0379999876022339,-7.734000205993652 C1.0379999876022339,-7.734000205993652 -0.0010000000474974513,-6.109000205993652 -0.0010000000474974513,-6.109000205993652 C-0.0010000000474974513,-6.109000205993652 -1.0379999876022339,-7.732999801635742 -1.0379999876022339,-7.732999801635742 C-2.1989998817443848,-9.550999641418457 -4.133999824523926,-10.571999549865723 -6.130000114440918,-10.571999549865723z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g transform="matrix(0,0,0,0,24,24)" opacity="0.2" style="display: block;">
                                                                        <g opacity="1" transform="matrix(1,0,0,1,11.958000183105469,10.708000183105469)">
                                                                            <path fill="rgb(162,0,199)" fill-opacity="1" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                                            <path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke="rgb(220,0,55)" stroke-opacity="1" stroke-width="0" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </svg></div>
                                                    </div>
                                                </span></button>

												
                                                <button class="MuiButtonBase-root MuiIconButton-root jss218" tabindex="0" type="button" data-testid="like" id="NoLikeBtn" style="display: ${unLikeBtnDisplay};"><span class="MuiIconButton-label">
                                                    <div class="jss220">
                                                        <div class="jss228 jss221"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" preserveAspectRatio="xMidYMid meet" style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px);">
                                                                <defs>
                                                                    <clipPath id="__lottie_element_3">
                                                                        <rect width="48" height="48" x="0" y="0"></rect>
                                                                    </clipPath>
                                                                </defs>
                                                                <g clip-path="url(#__lottie_element_3)">
                                                                    <g transform="matrix(1,0,0,1,7.926000595092773,10.04699993133545)" opacity="1" style="display: block;">
                                                                        <g opacity="1" transform="matrix(1,0,0,1,16.073999404907227,13.95300006866455)">
                                                                            <path fill="rgb(162,0,199)" fill-opacity="1" d=" M9.505999565124512,-12.246999740600586 C6.192999839782715,-13.70199966430664 2.430999994277954,-12.878000259399414 0.0010000000474974513,-10.321999549865723 C-2.430999994277954,-12.878000259399414 -6.192999839782715,-13.70300006866455 -9.505000114440918,-12.246999740600586 C-13.812999725341797,-10.35200023651123 -15.822999954223633,-5.229000091552734 -13.986000061035156,-0.828000009059906 C-12.812000274658203,1.9819999933242798 -6.8480000495910645,7.645999908447266 -2.052000045776367,11.901000022888184 C-1.5870000123977661,12.3149995803833 -1.1610000133514404,12.6899995803833 -0.8140000104904175,12.991000175476074 C-0.8140000104904175,12.991000175476074 0.0010000000474974513,13.70300006866455 0.0010000000474974513,13.70300006866455 C0.0010000000474974513,13.70300006866455 2.052000045776367,11.901000022888184 2.052000045776367,11.901000022888184 C6.848999977111816,7.64300012588501 12.814000129699707,1.9789999723434448 13.984999656677246,-0.828000009059906 C15.822999954223633,-5.229000091552734 13.814000129699707,-10.35200023651123 9.505999565124512,-12.246999740600586z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g transform="matrix(0,0,0,0,24,24)" opacity="0.2" style="display: block;">
                                                                        <g opacity="1" transform="matrix(1,0,0,1,11.958000183105469,10.708000183105469)">
                                                                            <path fill="rgb(162,0,199)" fill-opacity="1" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                                            <path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke="rgb(220,0,55)" stroke-opacity="1" stroke-width="0" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                    <g style="display: none;">
                                                                        <g>
                                                                            <path></path>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </svg></div>
                                                    </div>
                                                </span></button>

                                                <!--  -->
                                                </span></div>
                                </div>
                                <div class="jss229 jss222"><a class="jss223" href="/product/6617/reviews"><span class="jss230 jss224"><span class="MuiRating-root jss231 MuiRating-readOnly" role="img" aria-label="4.5 Stars">
                                <c:forEach var = "num" begin = "1" end = "5">
                                <c:choose>
									<c:when test="${list.result_score >= num }"><c:set var = "score" value = "100"></c:set></c:when>
									<c:when test="${num - list.result_score > 0.5 && num - list.result_score < 1}"><c:set var = "score" value = "100"></c:set></c:when>
									<c:when test="${num - list.result_score <= 0.5 && num - list.result_score > 0}"><c:set var = "score" value = "50"></c:set></c:when>
									<c:when test="${num - list.result_score >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
								</c:choose> 
                                <span class="MuiRating-decimal"><span style="width:${score}%;overflow:hidden;z-index:1;position:absolute"><span class="MuiRating-icon jss234 MuiRating-iconFilled jss236"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img">
                                    <path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                </svg></span></span><span><span class="MuiRating-icon jss234 MuiRating-iconFilled"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img">
                                    <path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                </svg></span></span></span>
                                </c:forEach>
                                </span></span><span class="jss226">( <!-- -->${list.vote_num} <!-- -->)</span></a>
                                </div>
                                <!--상품 제고 목록 시작-->
                                
                                <!--상품 재고목록 끝-->
                                <div class="jss279">
                                    <div class="jss280">
                                        
                                        <dl class="jss281">
                                            <dt class="jss282" style="font-size: 14px;">판매가</dt>
                                            <dd class="jss283"> ${list.price} 원</dd>
                                        </dl>
                                    </div>
                                    
                                </div>
                            </div>
                            <div class="jss164">
                                <div class="jss292">
                                    <div class="jss293">
                                        <div class="jss294"><svg class="MuiSvgIcon-root jss295" focusable="false" viewBox="0 0 32 32" aria-hidden="true" role="img">
                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                                    <g transform="translate(-50.000000, -1292.000000)">
                                                        <g transform="translate(0.000000, 1282.000000)">
                                                            <g transform="translate(16.000000, 0.000000)">
                                                                <g transform="translate(34.000000, 10.000000)">
                                                                    <path d="M8.66666667,2.66666667 L23.3333333,2.66666667 C23.7530097,2.66666667 24.1481942,2.86425888 24.4,3.2 L28,8 L28,28 C28,28.7363797 27.4030463,29.3333333 26.6666667,29.3333333 L5.33333333,29.3333333 C4.59695367,29.3333333 4,28.7363797 4,28 L4,8 L7.6,3.2 C7.85180584,2.86425888 8.24699026,2.66666667 8.66666667,2.66666667 Z M25.3333333,10.6666667 L6.66666667,10.6666667 L6.66666667,26.6666667 L25.3333333,26.6666667 L25.3333333,10.6666667 Z M24.6666667,8 L22.6666667,5.33333333 L9.33333333,5.33333333 L7.33333333,8 L24.6666667,8 Z M12,13.3333333 C12,14.6666667 13.790861,16 16,16 C18.209139,16 20,14.6666667 20,13.3333333 L20,12 L22.6666667,12 L22.6666667,13.3333333 C22.6666667,16 19.6818983,18.6666667 16,18.6666667 C12.3181017,18.6666667 9.33333333,16 9.33333333,13.3333333 L9.33333333,12 L12,12 L12,13.3333333 Z" fill-opacity="0.6" fill="#3C3C43"></path>
                                                                    <path d="M25.3333333,18.6666667 C26.268359,18.6666667 27.1659188,18.8270772 27.9999944,19.1218799 L28,29.3333333 L17.7885466,29.3333277 C17.4937439,28.4992522 17.3333333,27.6016924 17.3333333,26.6666667 C17.3333333,22.2483887 20.9150553,18.6666667 25.3333333,18.6666667 Z" fill="#FFFFFF" fill-rule="nonzero"></path>
                                                                    <polygon fill-opacity="0.6" fill="#3C3C43" points="24.7146667 30.6666667 20 25.952 21.8866667 24.0666667 24.7146667 26.896 29.4293333 22.1813333 31.3146667 24.0666667"></polygon>
                                                                </g>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg><span class="jss297">재고
                                                <!-- -->있음</span></div>
                                        <div class="jss294"><svg class="MuiSvgIcon-root jss295" focusable="false" viewBox="0 0 28 28" aria-hidden="true" role="img">
                                                <path fill="#3C3C43" fill-opacity=".6" fill-rule="evenodd" d="M5.833 15.167C5.833 9.23 9.22 4.158 14 2.12c4.78 2.037 8.167 7.11 8.167 13.046 0 .96-.089 1.897-.257 2.803l2.263 2.138c.193.182.238.47.111.703l-2.91 5.337c-.089.162-.248.273-.43.299-.182.026-.366-.035-.496-.165l-2.606-2.607c-.219-.219-.516-.342-.825-.342h-6.034c-.31 0-.606.123-.825.342l-2.606 2.607c-.13.13-.314.191-.496.165-.182-.026-.341-.137-.43-.299l-2.91-5.337c-.127-.232-.082-.521.11-.703L6.09 17.97c-.167-.906-.257-1.843-.257-2.803zm1.722 7.812l.954-.953C9.165 21.369 10.054 21 10.982 21h6.034c.928 0 1.818.37 2.474 1.026l.954.953 1.145-2.1-1.283-1.214c-.576-.544-.837-1.344-.692-2.123.145-.775.218-1.57.218-2.375 0-4.515-2.327-8.517-5.833-10.454-3.506 1.937-5.833 5.939-5.833 10.454 0 .806.073 1.6.218 2.376.145.78-.116 1.58-.692 2.123L6.41 20.88l1.145 2.1zM14 15.167c-1.289 0-2.333-1.045-2.333-2.334 0-1.288 1.044-2.333 2.333-2.333 1.289 0 2.333 1.045 2.333 2.333 0 1.289-1.044 2.334-2.333 2.334z"></path>
                                            </svg><span class="jss298">대통령발송</span></div>
                                        <div class="jss294"><svg class="MuiSvgIcon-root jss295" focusable="false" viewBox="0 0 28 28" aria-hidden="true" role="img">
                                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" fill-opacity="0.6">
                                                    <g transform="translate(-1464.000000, -1115.000000)" fill="#3C3C43">
                                                        <g transform="translate(1010.000000, 1095.000000)">
                                                            <g>
                                                                <g>
                                                                    <g transform="translate(0.000000, 10.000000)">
                                                                        <g transform="translate(398.000000, 10.000000)">
                                                                            <g transform="translate(56.000000, 0.000000)">
                                                                                <g>
                                                                                    <path d="M10.4591667,21 C10.1724294,23.0123006 8.44929357,24.5073083 6.41666667,24.5073083 C4.38403977,24.5073083 2.66090398,23.0123006 2.37416667,21 L1.16666667,21 L1.16666667,7 C1.16666667,6.35566779 1.68900113,5.83333333 2.33333333,5.83333333 L18.6666667,5.83333333 C19.3109989,5.83333333 19.8333333,6.35566779 19.8333333,7 L19.8333333,9.33333333 L23.3333333,9.33333333 L26.8333333,14.0653333 L26.8333333,21 L24.4591667,21 C24.1724294,23.0123006 22.4492936,24.5073083 20.4166667,24.5073083 C18.3840398,24.5073083 16.660904,23.0123006 16.3741667,21 L10.4591667,21 Z M17.5,8.16666667 L3.5,8.16666667 L3.5,17.5583333 C4.43428431,16.6045313 5.77585592,16.1677318 7.09260652,16.3886241 C8.40935712,16.6095164 9.53494688,17.460196 10.1068333,18.6666667 L16.7265,18.6666667 C16.9225,18.2548333 17.185,17.8803333 17.5,17.5583333 L17.5,8.16666667 Z M19.8333333,15.1666667 L24.5,15.1666667 L24.5,14.8341667 L22.1573333,11.6666667 L19.8333333,11.6666667 L19.8333333,15.1666667 Z M20.4166667,22.1666667 C21.3834871,22.1666667 22.16725,21.3829038 22.16725,20.4160833 C22.16725,19.4492629 21.3834871,18.6655 20.4166667,18.6655 C19.4498462,18.6655 18.6660833,19.4492629 18.6660833,20.4160833 C18.6660833,21.3829038 19.4498462,22.1666667 20.4166667,22.1666667 Z M8.16666667,20.4166667 C8.16666667,19.7914519 7.83311857,19.2137296 7.29166668,18.9011222 C6.75021479,18.5885148 6.08311855,18.5885148 5.54166666,18.9011222 C5.00021477,19.2137296 4.66666667,19.7914519 4.66666667,20.4166667 C4.66666667,21.383165 5.45016835,22.1666666 6.41666667,22.1666666 C7.38316498,22.1666666 8.16666667,21.383165 8.16666667,20.4166667 L8.16666667,20.4166667 Z"></path>
                                                                                </g>
                                                                            </g>
                                                                        </g>
                                                                    </g>
                                                                </g>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg><span class="jss299">무료배송</span></div>
                                    </div>
                                    <div class="jss300">
                                        <ul class="jss301">
                                            <li class="jss302"><strong>오늘</strong> 출발 마감<c:if test="${cal_hh>0 || cal_mm>0}">까지
                                                <!-- --> <strong>${cal_hh}시간 ${cal_mm}분</strong>남음</c:if></li>
                                            <li class="jss302" data-testid="todayDeliveryTime"><strong>저녁 6시</strong> 이전 주문하면 오늘 출발! / 영업일 기준</li>                                            
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="jss166">
                                <div class="jss303">
                                    <div class="jss304">
                                        <div class="jss305">
                                            <div class="jss306">수량</div>
                                            <div class="jss312"><button id = "down_button" class="MuiButtonBase-root MuiIconButton-root jss315" tabindex="0" type="button"><span class="MuiIconButton-label"><svg class="MuiSvgIcon-root jss316 jss317" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                                            <path fill="#38383A" fill-rule="evenodd" d="M11 11L13 11 19 11 19 13 13 13 11 13 5 13 5 11z"></path>
                                                        </svg></span></button>
                                                <div class="MuiInputBase-root MuiInput-root jss318"><input id = "amount" type="text" value="1" inputmode="decimal" class="MuiInputBase-input MuiInput-input jss319"></div><button id = "up_button" class="MuiButtonBase-root MuiIconButton-root jss315" tabindex="0" type="button"><span class="MuiIconButton-label"><svg class="MuiSvgIcon-root jss316" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                                            <path d="M11 11L11 5 13 5 13 11 19 11 19 13 13 13 13 19 11 19 11 13 5 13 5 11z"></path>
                                                        </svg></span><span class="MuiTouchRipple-root"></span></button>
                                            </div>
                                        </div>
                                        <div>
                                            <div class="jss307">총 상품금액</div>
                                            <span id = "hiddenPrice" style="display:none">${list.price}</span>                                            
                                            <div class="jss308"><strong><span  id="price1"><fmt:formatNumber value="${list.price}" pattern="###,###,###,###"/></span></strong>원</div>
                                        </div>
                                    </div>
                                    <div class="jss310">
                                    	<c:choose>
                                    		<c:when test="${loginUser == null}">
                                    			<button id = "cart_in_button1" class="MuiButtonBase-root jss320 jss321 jss311" tabindex="0" type="button" data-testid="cart" onclick = "alert('로그인이 필요합니다.')"><span class="MuiButton-label">장바구니 담기</span><span class="MuiTouchRipple-root"></span></button>
                                    		</c:when>
                                    		<c:otherwise>
                                    			<button id = "cart_in_button1" class="MuiButtonBase-root jss320 jss321 jss311" tabindex="0" type="button" data-testid="cart" onclick="javascript:insertCart()"><span class="MuiButton-label">장바구니 담기</span><span class="MuiTouchRipple-root"></span></button>
                                    		</c:otherwise>
                                    	</c:choose>
                                    	<button class="jss320 jss311 jss10008" tabindex="0" type="button" onclick="directOrder()"><span class="MuiButton-label">바로 구매</span><span class="MuiTouchRipple-root"></span></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        
                    </div>
                </div>
                <div style="margin: 0 auto;"> <!--@@@@@@@@@@@@@@중단 시작@@@@@@@@@@@@@@@@@@@@@@-->
                    <div class="jss159">
                        <div class="jss1146">
                            <div class="MuiTabs-root jss1148">
                                <div class="MuiTabs-scroller MuiTabs-fixed" style="overflow: hidden;">
                                    <div aria-label="탭" class="MuiTabs-flexContainer MuiTabs-centered" role="tablist"><button onclick = "location.href = '#productInfo' " id ="productTab1" class="MuiButtonBase-root MuiTab-root jss1149_first MuiTab-textColorPrimary Mui-selected jss1150 MuiTab-fullWidth" tabindex="0" type="button" role="tab" aria-selected="true"><span class="MuiTab-wrapper">상품정보</span></button><button onclick = "location.href = '#qa' " id ="productTab2" class="MuiButtonBase-root MuiTab-root jss1149 MuiTab-textColorPrimary MuiTab-fullWidth" tabindex="-1" type="button" role="tab" aria-selected="false"><span class="MuiTab-wrapper">질문/답변</span></button><button onclick = "location.href = '#productReview' " id ="productTab3" class="MuiButtonBase-root MuiTab-root jss1149 MuiTab-textColorPrimary MuiTab-fullWidth" tabindex="-1" type="button" role="tab" aria-selected="false"><span class="MuiTab-wrapper">구매후기</span></button><button onclick = "location.href = '#info' " id ="productTab4" class="MuiButtonBase-root MuiTab-root jss1149 MuiTab-textColorPrimary MuiTab-fullWidth" tabindex="-1" type="button" role="tab" aria-selected="false"><span class="MuiTab-wrapper">취소/교환/반품 안내</span></button></div><span id ="tabUnderbar" class="jss1030 jss1031 MuiTabs-indicator" style="left: 10px; width: 276.5px;"></span>
                                </div>
                            </div>
                            <div class="jss349"></div>
                        </div>
                    </div>
                    <!--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-->
                    <div>
                        <div class="jss2670">
                            <div class="jss2690" id = "productInfo"> <!--상품정보 start-->
                                <div class="jss2694">
                                    <h3 class="jss2695">상품정보</h3>
                                    <span role="button"></span>
                                </div>
                            </div> <!--상품정보 end-->
                            <div class="jss2671"> <!--설명/특징 start-->
                                <div class="jss2672"><button id ="moreView1" class="MuiButtonBase-root jss2674" tabindex="0" type="button">
                                    <h4 class="jss2675">설명</h4>
                                    <div class="jss2676">
                                        <div class="jss2689">${list.description}</div>
                                        <div class="jss2678"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                                <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
                                            </svg></div>
                                    </div>
                                </button></div>

                               
                            </div> <!--설명/특징 end-->
                            <div class="jss355 jss356"><!--제품이미지 start-->
                                <div class="jss364">
                                    <picture class="jss184">
                                        <source media="(max-width: 1199px)" srcset="${list.detailsimg}">
                                        <source media="(min-width: 1200px)" srcset="${list.detailsimg}"><img class="jss185 jss366" src="${list.detailsimg}" alt="${list.name}" sizes="auto"></picture>
                                </div>
                                <div class="MuiButtonBase-root MuiButton-root MuiButton-outlined jss320 jss321a jss367 MuiButton-colorInherit MuiButton-fullWidth" role="button" aria-disabled="false" id="product_detail_button"><span id = "product_detail" class="MuiButton-label">상품 상세
                                        더 보기</span><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img" id="product_svg1">
                                            <path d="M12 15L7.757 10.757 9.172 9.343 12 12.172 14.828 9.343 16.243 10.757z"></path>
                                        </svg><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img" id="product_svg2" style="display: none;"><path d="M12 11.828L9.172 14.657 7.757 13.243 12 9 16.243 13.243 14.828 14.657z"></path></svg><span class="MuiTouchRipple-root"></span></div>
                            </div><!--제품이미지 end-->
                        </div>       
                    </div>
                    
                    <!--질문/답변 시작-->
                    <div class="jss831" id = "qa"> 
                        <div class="jss825">
                            <div class="jss829">
                                <h3 class="jss830">질문/답변</h3><span role="button"><a class="MuiButtonBase-root MuiButton-root MuiButton-outlined jss835 jss827" tabindex="0" aria-disabled="false" data-testid="pc-click" href="/product/6617/qna"><span class="MuiButton-label">더 보기<svg class="MuiSvgIcon-root jss828" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                                <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
                                            </svg></span></a></span>
                            </div>
                        </div>
                        
                        <div class="jss832">
                            <div>
                            	<c:forEach var = "qna" begin = "1" end = "3"> <!-- 질문/답변  forEach 시작 -->
                                <div class="jss863"><a class="MuiButtonBase-root jss864" tabindex="0" aria-disabled="false" href="/product/6617/qna/36106" style="border-radius: 0px;">
                                        <div class="jss865">
                                            <dl class="jss866">
                                                <dt class="jss867"><strong>질문</strong></dt>
                                                <dd class="jss868">질문입니다.</dd>
                                            </dl>
                                            <dl class="jss866">
                                                <dt><strong>답변</strong></dt>
                                                <dd>답변입니다.</dd>
                                            </dl>
                                            <div class="jss869">답변 1명 보기</div>
                                        </div><span class="MuiTouchRipple-root"></span>
                                    </a></div>
                                    </c:forEach> <!-- 질문/답변  forEach 끝 -->
                                
                            </div>
                        </div>
                    </div> 
                    <!--질문/답변 끝-->

                     <!--구매후기 시작-->
                <div class="jss388" id="productReview">
                    <div class="jss373">
                        <div class="jss377">
                            <h3 class="jss378">구매후기</h3>
                            <span role="button"><a class="MuiButtonBase-root MuiButton-root MuiButton-outlined jss383 jss375" tabindex="0" aria-disabled="false" data-testid="pc-click" href="/product/523/reviews"><span class="MuiButton-label">더 보기<svg class="MuiSvgIcon-root jss376" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img"><path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path></svg></span></a></span>
                        </div>
                    </div>
     
                  <div>
                  	<c:set var = "reviewList" value = "${detailsMap.reviewList}"/>
                  	<c:choose>
                  	<c:when test="${empty reviewList}">
                  		<div class="jss20010"><span class="jss20011"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
            			<path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283C15.024 19.308 13.042 20.003 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9c.003 2.042-.692 4.024-1.969 5.617zm-2.006-.742C17.295 14.57 18.003 12.82 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7 1.82.003 3.57-.706 4.875-1.975l.15-.15z"></path>
        				</svg></span>작성된 리뷰가 없습니다.</div>
                  	</c:when>
                  	<c:otherwise>
                  	<c:forEach var = "reviewList" items="${reviewList}" > <!-- 리뷰 forEach문 시작 -->
                    <div class="jss875"> <!--d-->
                        <div class="jss876">
                            <span class="jss877" role="button">
                                <picture class="jss184">
                                    <source media="(max-width: 1199px)" srcset="${contextPath}/resources/profile/${reviewList.member_id}/${reviewList.memberProfile}">
                                    <source media="(min-width: 1200px)" srcset="${contextPath}/resources/profile/${reviewList.member_id}/${reviewList.memberProfile}">
                                    <img class="jss185 jss878" src="${contextPath}/resources/profile/${reviewList.member_id}/${reviewList.memberProfile}" alt="${reviewList.member_id}" sizes="auto"></picture>
                            </span>                         
                            <div class="jss886">
                                <div class="jss887"><span class="MuiRating-root jss888 MuiRating-readOnly jss20012" role="img" aria-label="5 Stars">
                                					<c:forEach var = "num" begin = "1" end = "5">
													<c:choose>
														<c:when test="${reviewList.star >= num }"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - reviewList.star > 0.5 && num - reviewList.star < 1}"><c:set var = "score" value = "100"></c:set></c:when>
														<c:when test="${num - reviewList.star <= 0.5 && num - reviewList.star > 0}"><c:set var = "score" value = "50"></c:set></c:when>
														<c:when test="${num - reviewList.star >= 1}"><c:set var = "score" value = "0"></c:set></c:when>
													</c:choose>  
                                					<span class="MuiRating-decimal"><span style="width: ${score}%; overflow: hidden; z-index: 1; position: absolute;"><span class="MuiRating-icon jss681 MuiRating-iconFilled jss683"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img">
                                                        <path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                                    </svg></span></span><span><span class="MuiRating-icon jss681 MuiRating-iconFilled jss683"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 48 48" aria-hidden="true" role="img">
                                                        <path fill="#c4c4c6" fill-rule="evenodd" d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
                                                    </svg></span></span></span>
                                                    </c:forEach>
                                                    </span>구매인증됨<div class="jss896 jss885"></div>${reviewList.writedate}</div><span>${reviewList.memberName} </span>
                            </div>
                        </div>
                        <div class="jss528">
                            <div class="jss529 jss530">
                                <div class="jss531">
                                    <h3 class="jss533">${reviewList.title}</h3>
                                    <div class="jss10000">${reviewList.content}</div>
                                </div>      
                            </div>
                            <div class="jss539"><button class="MuiButtonBase-root MuiButton-root MuiButton-outlined jss546 jss540 jss547" tabindex="0" type="button" data-testid="recommend"><span class="MuiButton-label"><svg class="MuiSvgIcon-root jss548" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                <path fill="#38383A" fill-rule="evenodd" d="M14.6 8H21c1.105 0 2 .895 2 2v2.104c0 .261-.05.52-.15.762l-3.095 7.515c-.154.375-.52.619-.925.619H2c-.552 0-1-.448-1-1V10c0-.552.448-1 1-1h3.482c.325 0 .63-.158.817-.423L11.752.85c.142-.202.411-.27.632-.159l1.814.907c1.052.526 1.595 1.713 1.305 2.853L14.6 8zM7 10.588V19h11.16L21 12.104V10h-6.4c-.617 0-1.2-.285-1.579-.773-.379-.487-.511-1.122-.359-1.72l.903-3.548c.058-.228-.05-.466-.261-.571l-.661-.33-4.71 6.672c-.25.354-.57.644-.933.858zM5 11H3v8h2v-8z"></path>
                            </svg>추천수</span><span class="MuiTouchRipple-root"></span></button></div>
                        </div>                                               
                    </div>
                     </c:forEach>
                     </c:otherwise>
                     </c:choose>   <!-- 리뷰 forEach문 끝 -->
                </div>
                <!--구매후기 끝-->
                </div>
                <!--@@@@@@@@@@@@@@중단 끝@@@@@@@@@@@@@@@@@@@@@@-->

               

                <!--취소 / 교환 / 반품 안내-->
                <div class="jss575"  id = "info">
                    <div>
                        <div class="jss100001">
                            <div class="jss551">
                                <h3 class="jss552">취소/교환/반품 안내</h3>
                            </div>
                        </div>
                            <div class="jss577">
                                <h4 class="jss408">취소</h4>
                            <ul class="jss412">
                                <li class="jss413">입금하신 상품은 '입금대기, 입금완료' 단계에서만 취소가 가능합니다.</li>
                                <li class="jss413">전체 주문 중 일부 상품의 부분취소는 불가능합니다.</li>
                            </ul>
                            <h4 class="jss408">교환/반품</h4>
                            <ul class="jss412">
                                <li class="jss413">교환 및 반품은 배송완료일 기준으로 7일 이내 가능합니다.</li>
                                <li class="jss413">교환하려는 상품은 처음 배송한 택배사에서 수거하므로 다른 택배사 이용은 불가능합니다.</li>
                                <li class="jss413">업체배송 상품은 제공 업체와 상품에 따라 배송비가 다르고, 상품의 도착지가 처음 발송한 주소와 다를 수 있으므로 고객센터(1588-2469)로 먼저 연락주시기 바랍니다.</li>
                            </ul>
                            <h4 class="jss408">교환/반품이 불가능한 경우</h4>
                            <ul class="jss412">
                                <li class="jss413">반품 요청기간이 지난 경우</li>
                                <li class="jss413">주문/제작 상품의 경우, 상품의 제작이 이미 진행된 경우</li>
                                <li class="jss413">상품 포장을 개봉하여 사용 또는 설치 완료되어 상품의 가치가 현저히 감소한 경우</li>
                                <li class="jss413">시간의 경과에 의하여 재판매가 곤란할 정도로 상품의 가치가 현저히 감소한 경우</li>
                                <li class="jss413">구성품을 분실하였거나 고객님의 취급 부주의로 인한 파손/고장/오염으로 재판매 불가한 경우</li>
                            </ul>
                            <h4 class="jss408">교환/반품 배송비</h4>
                            <ul class="jss412">
                                <li class="jss413">단순변심으로 인한 교환/반품은 고객님께서 배송비를 부담하셔야 합니다.</li>
                                <li class="jss413">상품의 불량 또는 파손, 오배송의 경우에는 배송비를 고양이대통령에서 부담합니다.</li>
                                <li class="jss413">업체배송 상품은 제공업체에 따라 교환/반품 배송비가 다를 수 있으므로 고객센터로 문의하시기 바랍니다.</li>
                                <li class="jss413">제주, 산간지역은 추가 배송비가 발생할 수 있습니다.</li>
                            </ul>
                            
                            </div>

                    </div>
                </div>
                <!--취소 / 교환 / 반품 안내 끝-->
                <c:set var = "description" value = "${list.description}"/>
                <c:set var = "price" value = "${list.price}"/>
				</c:forEach>
            </div>
           
            	
                   </div>
        <div id = "moreViewWindow1" role="presentation" class="MuiDialog-root jss103" style="position: fixed; z-index: 1300; inset: 0px; display: none;">
            <div class="MuiBackdrop-root" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
            <div tabindex="0" data-test="sentinelStart"></div>
            <div class="MuiDialog-container MuiDialog-scrollPaper" role="none presentation" tabindex="-1" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
                <div class="MuiPaper-root MuiDialog-paper MuiDialog-paperScrollPaper MuiDialog-paperWidthFalse MuiPaper-elevation24 MuiPaper-rounded" role="dialog">
                    <div class="jss104 jss105">
                        <h2 class="jss106">설명</h2>
                        <div class="jss111"><button id = "close1" class="MuiButtonBase-root MuiIconButton-root jss112" tabindex="0" type="button" data-testid="close"><span class="MuiIconButton-label"><svg class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                        <path d="M11 11L11 2.002 13 2.002 13 11 22 11 22 13 13 13 13 22.06 11 22.06 11 13 2 13 2 11z" transform="rotate(45 12 12.03)"></path>
                                    </svg></span><span class="MuiTouchRipple-root"></span></button></div>
                    </div>
                    <div class="jss107">
                        <div class="jss368">
                            <h4 class="jss369">설명</h4>
                            <p>${description}</p>
                           
                        </div>
                    </div>
                </div>
            </div>
            <div tabindex="0" data-test="sentinelEnd"></div>
        </div>


        <div id = "max_amount" role="presentation" class="MuiDialog-root jss323 jss324" style="position: fixed; z-index: 1300; inset: 0px; display: none;">
            <div class="MuiBackdrop-root" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
            <div tabindex="0" data-test="sentinelStart"></div>
            <div class="MuiDialog-container MuiDialog-scrollPaper" role="none presentation" tabindex="-1" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
                <div class="MuiPaper-root MuiDialog-paper jss20000 MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiDialog-paperFullWidth MuiPaper-elevation0 MuiPaper-rounded" role="dialog" aria-labelledby="alert">
                    <div class="MuiDialogTitle-root jss4294">
                        <h2 class="MuiTypography-root MuiTypography-h2"></h2>
                    </div>
                    <div class="MuiDialogContent-root jss4295">
                        <p class="MuiTypography-root MuiTypography-h3">1인당 99개 구매 가능한 상품입니다.</p>
                    </div>
                    <div class="MuiDialogActions-root jss4296 MuiDialogActions-spacing"><button id = "max_amount_confirm_button" class="MuiButtonBase-root MuiButton-root MuiButton-contained jss4181 undefined MuiButton-containedPrimary" tabindex="0" type="button"><span class="MuiButton-label">확인</span></button></div>
                </div>
            </div>
            <div tabindex="0" data-test="sentinelEnd"></div>
        </div>

        <div id = "min_amount" role="presentation" class="MuiDialog-root jss323 jss324" style="position: fixed; z-index: 1300; inset: 0px; display: none; ">
            <div class="MuiBackdrop-root" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
            <div tabindex="0" data-test="sentinelStart"></div>
            <div class="MuiDialog-container MuiDialog-scrollPaper" role="none presentation" tabindex="-1" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
                <div class="MuiPaper-root MuiDialog-paper jss20000 MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiDialog-paperFullWidth MuiPaper-elevation0 MuiPaper-rounded" role="dialog" aria-labelledby="alert">
                    <div class="MuiDialogTitle-root jss4294">
                        <h2 class="MuiTypography-root MuiTypography-h2"></h2>
                    </div>
                    <div class="MuiDialogContent-root jss4295">
                        <p class="MuiTypography-root MuiTypography-h3">1개 이상 입력이 가능합니다.</p>
                    </div>
                    <div class="MuiDialogActions-root jss4296 MuiDialogActions-spacing"><button id = "min_amount_confirm_button" class="MuiButtonBase-root MuiButton-root MuiButton-contained jss4181 undefined MuiButton-containedPrimary" tabindex="0" type="button"><span class="MuiButton-label">확인</span></button></div>
                </div>
            </div>
            <div tabindex="0" data-test="sentinelEnd"></div>
        </div>

        <div id = "cart_in_alert" role="presentation" class="MuiDialog-root jss323 jss324" style="position: fixed; z-index: 1300; inset: 0px; display: none;">
            <div class="MuiBackdrop-root" aria-hidden="true" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;"></div>
            <div tabindex="0" data-test="sentinelStart"></div>
            <div class="MuiDialog-container MuiDialog-scrollPaper" role="none presentation" tabindex="-1" style="opacity: 1; transition: opacity 225ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;">
                <div class="MuiPaper-root MuiDialog-paper jss20001 MuiDialog-paperScrollPaper MuiDialog-paperWidthSm MuiDialog-paperFullWidth MuiPaper-elevation0 MuiPaper-rounded" role="dialog" aria-labelledby="alert">
                    <div class="MuiDialogContent-root jss588">
                        <p class="MuiTypography-root MuiTypography-h3">장바구니에 상품이 담겼습니다.</p>
                    </div>
                    <div class="MuiDialogActions-root jss589 jss326 MuiDialogActions-spacing"><button class="MuiButtonBase-root MuiButton-root MuiButton-contained jss473 jss20002 undefined MuiButton-containedPrimary MuiButton-fullWidth" tabindex="0" type="button" onclick="confirm()"><span class="MuiButton-label">장바구니 보기</span></button><button id = "cart_in_confirm_button" class="MuiButtonBase-root MuiButton-root MuiButton-contained jss473 jss475 MuiButton-colorInherit MuiButton-fullWidth" tabindex="0" type="button"><span class="MuiButton-label">확인</span></button></div>
                </div>
            </div>
            <div tabindex="0" data-test="sentinelEnd"></div>
        </div>

        <div id = "bottom_fixed" class="MuiDrawer-root MuiDrawer-docked" style="position: fixed; bottom: 0; z-index: 9999; width: 100%; display: none;">
            <div class="MuiPaper-root MuiDrawer-paper jss325 MuiDrawer-paperAnchorBottom MuiDrawer-paperAnchorDockedBottom MuiPaper-elevation0" style="transform: none; transition: transform 225ms cubic-bezier(0, 0, 0.2, 1) 0ms;">
                <div class="jss326">
                    <div class="jss327">
                        <div class="jss328">
                            <div class="jss329">수량</div>
                            <div class="jss312"><button id = "down_button1" class="MuiButtonBase-root MuiIconButton-root jss315" tabindex="0" type="button"><span class="MuiIconButton-label"><svg class="MuiSvgIcon-root jss316 jss317" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                <path fill="#38383A" fill-rule="evenodd" d="M11 11L13 11 19 11 19 13 13 13 11 13 5 13 5 11z"></path>
                            </svg></span></button>
                                <div class="MuiInputBase-root MuiInput-root jss318"><input id = "amount1" type="text" value="1" inputmode="decimal" class="MuiInputBase-input MuiInput-input jss319"></div><button id="up_button1" class="MuiButtonBase-root MuiIconButton-root jss315" tabindex="0" type="button"><span class="MuiIconButton-label"><svg class="MuiSvgIcon-root jss316" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                            <path d="M11 11L11 5 13 5 13 11 19 11 19 13 13 13 13 19 11 19 11 13 5 13 5 11z"></path>
                                        </svg></span><span class="MuiTouchRipple-root"></span></button>
                            </div>
                        </div>
                        <div class="jss330">
                            <div class="jss331">총 상품금액</div>
                            <div class="jss332"><span id="price"><strong><fmt:formatNumber value="${price}" pattern="###,###,###,###"/></strong></span>원</div>
                        </div>
                    </div>
                    <div class="jss334"></div>
                    <div class="jss335"><button class="MuiButtonBase-root MuiIconButton-root jss337" tabindex="0" type="button" data-testid="like" id="wishBtn"><span class="MuiIconButton-label">
                                <div class="jss338">
                                    <div class="jss228 jss339"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48" width="48" height="48" preserveAspectRatio="xMidYMid meet" style="width: 100%; height: 100%; transform: translate3d(0px, 0px, 0px);">
                                            <defs>
                                                <clipPath id="__lottie_element_28">
                                                    <rect width="48" height="48" x="0" y="0"></rect>
                                                </clipPath>
                                            </defs>
                                            <g clip-path="url(#__lottie_element_28)">
                                                <g transform="matrix(1,0,0,1,7.926000595092773,10.04699993133545)" opacity="1" style="display: block;">
                                                    <g opacity="1" transform="matrix(1,0,0,1,16.073999404907227,13.95300006866455)">
                                                        <path fill="rgb(162,0,199)" fill-opacity="1" d=" M0.0010000000474974513,13.70300006866455 C0.0010000000474974513,13.70300006866455 -0.8159999847412109,12.991000175476074 -0.8159999847412109,12.991000175476074 C-1.1629999876022339,12.689000129699707 -1.5880000591278076,12.314000129699707 -2.052999973297119,11.901000022888184 C-6.849999904632568,7.644999980926514 -12.812000274658203,1.9809999465942383 -13.986000061035156,-0.828000009059906 C-15.822999954223633,-5.230000019073486 -13.814000129699707,-10.35200023651123 -9.505999565124512,-12.246999740600586 C-6.193999767303467,-13.70300006866455 -2.431999921798706,-12.878999710083008 -0.0010000000474974513,-10.321999549865723 C2.430000066757202,-12.878999710083008 6.190999984741211,-13.70199966430664 9.505000114440918,-12.246999740600586 C13.812000274658203,-10.35200023651123 15.822999954223633,-5.230000019073486 13.984000205993652,-0.828000009059906 C12.812000274658203,1.9780000448226929 6.8480000495910645,7.642000198364258 2.0510001182556152,11.901000022888184 C2.0510001182556152,11.901000022888184 0.0010000000474974513,13.70300006866455 0.0010000000474974513,13.70300006866455z M-6.130000114440918,-10.571999549865723 C-6.926000118255615,-10.571999549865723 -7.730999946594238,-10.40999984741211 -8.50100040435791,-10.071000099182129 C-11.62399959564209,-8.696999549865723 -13.069000244140625,-4.954999923706055 -11.722999572753906,-1.7289999723434448 C-10.96399974822998,0.08500000089406967 -6.735000133514404,4.519999980926514 -0.40799999237060547,10.135000228881836 C-0.27000001072883606,10.258999824523926 -0.13199999928474426,10.380000114440918 -0.0010000000474974513,10.494999885559082 C-0.0010000000474974513,10.494999885559082 0.40799999237060547,10.135000228881836 0.40799999237060547,10.135000228881836 C6.735000133514404,4.51800012588501 10.96399974822998,0.08399999886751175 11.720999717712402,-1.7289999723434448 C13.067000389099121,-4.954999923706055 11.623000144958496,-8.696999549865723 8.49899959564209,-10.071000099182129 C5.798999786376953,-11.260000228881836 2.6610000133514404,-10.276000022888184 1.0379999876022339,-7.734000205993652 C1.0379999876022339,-7.734000205993652 -0.0010000000474974513,-6.109000205993652 -0.0010000000474974513,-6.109000205993652 C-0.0010000000474974513,-6.109000205993652 -1.0379999876022339,-7.732999801635742 -1.0379999876022339,-7.732999801635742 C-2.1989998817443848,-9.550999641418457 -4.133999824523926,-10.571999549865723 -6.130000114440918,-10.571999549865723z"></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                                <g transform="matrix(0,0,0,0,24,24)" opacity="0.2" style="display: block;">
                                                    <g opacity="1" transform="matrix(1,0,0,1,11.958000183105469,10.708000183105469)">
                                                        <path fill="rgb(162,0,199)" fill-opacity="1" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                        <path stroke-linecap="butt" stroke-linejoin="miter" fill-opacity="0" stroke-miterlimit="4" stroke="rgb(220,0,55)" stroke-opacity="1" stroke-width="0" d=" M0,-20 C11.038000106811523,-20 20,-11.038000106811523 20,0 C20,11.038000106811523 11.038000106811523,20 0,20 C-11.038000106811523,20 -20,11.038000106811523 -20,0 C-20,-11.038000106811523 -11.038000106811523,-20 0,-20z"></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                                <g style="display: none;">
                                                    <g>
                                                        <path></path>
                                                    </g>
                                                </g>
                                            </g>
                                        </svg></div>
                                </div>
                         </span><span class="MuiTouchRipple-root"></span></button>
                         <c:choose>
                         	<c:when test="${loginUser == null}">
                         		<button class="MuiButtonBase-root jss311 jss320 jss321" tabindex="0" type="button" id = "cart_in_button2" onclick = "alert('로그인이 필요합니다.')"><span class="MuiButton-label">장바구니 담기</span><span class="MuiTouchRipple-root"></span></button>
                         	</c:when>
                         	<c:otherwise>
                         		<button class="MuiButtonBase-root jss311 jss320 jss321" tabindex="0" type="button" id = "cart_in_button2" onclick="javascript:insertCart()"><span class="MuiButton-label">장바구니 담기</span><span class="MuiTouchRipple-root"></span></button>
                         	</c:otherwise>
                         </c:choose>
                         <button class="MuiButtonBase-root jss320 jss321 jss10008" tabindex="0" type="button" onclick="directOrder()"><span class="MuiButton-label">바로 구매</span><span class="MuiTouchRipple-root"></span></button></div>
                </div>
            </div>
            
        </div>
		 <!-- footer --> 
            	<footer class="jss1030">
            <div class="jss1031">
                <ul class="jss1032">
                    <li>
                        <span class="jss195"><img src="resources/img/img/7-value.svg" alt="고양이대통령이 추구하는 일곱가지 가치"></span>
                    </li>
                    <li>
                        <span class="jss195"><img src="resources/img/img/7-value.svg" alt="신선한 사료&amp;간식 유통기한 100% 책임제"></span>
                    </li>
                    <li>
                        <span class="jss195"><img src="resources/img/img/7-value.svg" alt="평일 오후 6시까지 주문 시 오늘발송"></span>
                    </li>
                    <li>
                        <span class="jss195"><img src="resources/img/img/7-value.svg" alt="3만원 이상 구매시 무료배송"></span>
                    </li>
                </ul>
            </div>
            <div class="jss1033">
                <div class="jss1034">
                    <div class="a1035">
                        <div role="group" class="a1036">
                            <a><span>회사소개</span></a>
                            <a>입점문의</a>
                            <a>이용약관</a>
                            <a>개인정보처리방침</a>
                        </div>
                    </div>
                    <div class="a1037">
                        <div class="a1038">
                            <a class="a1039">
                                <span>
                                    <svg focusable="false" viewBox="0 0 130 40" aria-hidden="true" role="img"><path fill-rule="evenodd" d="M123.893 0C127.266 0 130 2.797 130 6.25v27.5c0 3.452-2.73 6.25-6.107 6.25H6.107C2.734 40 0 37.203 0 33.75V6.25C0 2.798 2.73 0 6.107 0h117.786zm0 1.25H6.107c-2.65 0-4.804 2.154-4.884 4.844l-.002.156v27.5c0 2.71 2.105 4.915 4.733 4.998l.153.002h117.786c2.65 0 4.804-2.154 4.884-4.844l.002-.156V6.25c0-2.71-2.105-4.915-4.733-4.998l-.153-.002zM32.026 12.176c.739.03 2.812.297 4.144 2.236-.105.07-2.475 1.442-2.446 4.301.029 3.416 3.006 4.551 3.041 4.567-.027.08-.476 1.62-1.57 3.212l-.247.358c-.873 1.247-1.81 2.39-3.22 2.416-1.52.028-2.008-.897-3.742-.897-1.736 0-2.279.868-3.714.925-1.49.056-2.624-1.487-3.578-2.857-1.947-2.802-3.434-7.923-1.435-11.378.99-1.717 2.764-2.803 4.687-2.831 1.464-.027 2.847.983 3.741.983.896 0 2.574-1.213 4.34-1.035zm26.582 4.61c2.128 0 3.531 1.681 3.531 4.28 0 2.606-1.395 4.28-3.499 4.28-1.12 0-2.024-.47-2.54-1.297l-.098-.17h-.04v4.152h-1.721V16.873h1.666v1.395h.031c.479-.9 1.499-1.482 2.67-1.482zm9.221 0c2.128 0 3.531 1.681 3.531 4.28 0 2.606-1.395 4.28-3.499 4.28-1.12 0-2.024-.47-2.54-1.297l-.098-.17h-.04v4.152h-1.721V16.873h1.666v1.395h.032c.478-.9 1.498-1.482 2.67-1.482zm12.346-3.22c2.352 0 3.988 1.276 4.142 3.157l.01.19H82.59c-.104-1.148-1.052-1.84-2.44-1.84-1.386 0-2.334.7-2.334 1.72 0 .773.546 1.243 1.872 1.602l.216.056 1.267.311c2.359.558 3.34 1.506 3.34 3.188 0 2.152-1.714 3.499-4.44 3.499-2.468 0-4.16-1.232-4.368-3.196l-.015-.2h1.761c.128 1.14 1.235 1.89 2.75 1.89 1.45 0 2.494-.75 2.494-1.778 0-.848-.568-1.372-1.903-1.737l-.217-.056-1.49-.359c-2.112-.51-3.092-1.498-3.092-3.1 0-1.984 1.729-3.347 4.184-3.347zm14.569 3.204c2.43 0 3.976 1.657 3.976 4.295 0 2.646-1.538 4.296-3.976 4.296-2.44 0-3.977-1.65-3.977-4.296 0-2.638 1.554-4.295 3.977-4.295zm14.17 0c2.249 0 3.688 1.498 3.774 3.908l.004.228v.59h-5.922v.103c0 1.435.9 2.375 2.255 2.375.897 0 1.611-.399 1.888-1.046l.05-.133h1.633c-.231 1.522-1.714 2.566-3.61 2.566-2.44 0-3.953-1.634-3.953-4.256 0-2.63 1.522-4.335 3.88-4.335zm-20.777-1.881v1.984h1.593v1.363h-1.593v4.623c0 .717.318 1.052 1.02 1.052.14 0 .347-.016.48-.03l.086-.01v1.355c-.192.047-.574.08-.957.08-1.632 0-2.307-.59-2.356-2.08l-.003-.184v-4.806h-1.22v-1.363h1.22V14.89h1.73zm-39.108-1.132l4.152 11.5h-1.889L50.24 22.15h-4.383l-1.052 3.109h-1.857l4.152-11.5h1.929zm54.72 3.029c.198 0 .37.02.5.044l.09.02v1.61c-.135-.057-.438-.104-.773-.104-1.055 0-1.727.68-1.788 1.763l-.005.165v4.974h-1.722v-8.385h1.642V18.3h.04c.263-.949 1.028-1.514 2.016-1.514zm-9.005 1.402c-1.395 0-2.224 1.076-2.224 2.877 0 1.818.829 2.877 2.224 2.877 1.394 0 2.223-1.06 2.223-2.877 0-1.809-.829-2.877-2.223-2.877zm-36.59.064c-1.315 0-2.2 1.14-2.2 2.813 0 1.69.885 2.822 2.2 2.822 1.339 0 2.216-1.108 2.216-2.822 0-1.697-.877-2.813-2.216-2.813zm9.221 0c-1.315 0-2.2 1.14-2.2 2.813 0 1.69.885 2.822 2.2 2.822 1.34 0 2.216-1.108 2.216-2.822 0-1.697-.877-2.813-2.216-2.813zM48.072 15.67h-.048l-1.713 5.045h3.475l-1.714-5.045zm60.842 2.494c-1.134 0-1.97.785-2.12 1.958l-.016.17h4.192c-.04-1.283-.86-2.128-2.056-2.128zM32.05 6.714c.145 1.324-.39 2.65-1.18 3.606-.793.954-2.09 1.697-3.362 1.598-.173-1.296.469-2.647 1.203-3.494.818-.953 2.199-1.663 3.339-1.71z"></path></svg>
                                </span>
                            </a>
                            <a class="a1039">
                                <span>
                                    <svg class="b1042" focusable="false" viewBox="0 0 130 40" aria-hidden="true" role="img"><path fill-rule="evenodd" d="M123.893 0C127.266 0 130 2.797 130 6.25v27.5c0 3.452-2.73 6.25-6.107 6.25H6.107C2.734 40 0 37.203 0 33.75V6.25C0 2.798 2.73 0 6.107 0h117.786zm0 1.25H6.107c-2.65 0-4.804 2.154-4.884 4.844l-.002.156v27.5c0 2.71 2.105 4.915 4.733 4.998l.153.002h117.786c2.65 0 4.804-2.154 4.884-4.844l.002-.156V6.25c0-2.71-2.105-4.915-4.733-4.998l-.153-.002zM15.588 8.545l10.97 10.983-10.974 10.988c-.554-.272-.936-.843-.936-1.503V10.05c0-.662.384-1.234.94-1.505zm11.915 11.93l2.535 2.538-11.995 6.934 9.46-9.472zm47.558-2.461l.134.134v-.654h1.59v7.015c0 1.777-.655 2.806-1.497 3.46-.561.468-1.403.655-2.151.655-.842-.093-1.684-.374-2.339-.935-.467-.374-.841-1.029-1.029-1.403l1.497-.655c.094.187.28.468.468.749.374.374.935.748 1.496.748.562 0 1.216-.28 1.59-.748.281-.468.468-.936.468-1.59v-.562c-1.122 1.403-3.46 1.216-4.77-.28-1.403-1.497-1.403-4.022 0-5.519 1.353-1.353 3.314-1.575 4.543-.415zm35.303-.146l1.964 4.583 1.964-4.583h1.59l-4.302 10.195h-1.59l1.59-3.741-2.806-6.454h1.59zm-5.519-.187c.936 0 1.871.28 2.432.935.561.655.749 1.403.749 2.432v3.929h-1.59v-.655c-.188.28-.562.467-.842.655-.375.187-.842.28-1.31.28-.505-.084-1.237-.244-1.72-.616l-.15-.132c-.468-.468-.655-1.123-.655-1.777 0-.562.187-1.123.56-1.497.656-.655 1.591-.935 2.62-.935.655 0 1.216.093 1.683.374 0-1.123-.935-1.59-1.683-1.59-.655 0-1.31.374-1.59 1.029l-1.403-.562c.28-.654 1.029-1.87 2.9-1.87zm-48.358-.468c2.432 0 3.929 2.058 3.929 3.929 0 1.87-1.403 3.928-3.929 3.928-2.446 0-3.84-1.931-3.924-3.753l-.004-.175c0-1.871 1.403-3.929 3.928-3.929zm8.419 0c2.432 0 3.928 2.058 3.928 3.929 0 1.87-1.403 3.928-3.928 3.928-2.356 0-3.834-1.931-3.924-3.753l-.005-.175c0-1.871 1.403-3.929 3.929-3.929zm-18.52-4.396c1.496 0 2.993.561 4.115 1.684l-1.122 1.216c-1.684-1.684-4.396-1.59-5.987.093-1.683 1.777-1.683 4.49 0 6.267 1.684 1.777 4.49 1.87 6.174.093.561-.56.748-1.309.842-2.057h-3.929v-1.684h5.519c.093.374.093.842.093 1.31 0 1.403-.561 2.806-1.496 3.741-1.03 1.029-2.526 1.59-4.022 1.59-1.585-.088-3.17-.59-4.364-1.663l-.22-.208c-2.338-2.338-2.244-6.173.094-8.605 1.216-1.216 2.712-1.777 4.303-1.777zm54.344 1.777v10.383h-1.59V14.594h1.59zm-14.124 3.648c.468.468.748 1.122 1.029 1.777L82.49 22.17c.28.655.936 1.216 1.871 1.216.842 0 1.403-.28 1.964-1.122l1.403.935c-.187.187-.374.374-.467.562-1.537 1.537-4.123 1.588-5.561.238l-.145-.145c-1.403-1.496-1.403-4.022 0-5.612 1.403-1.497 3.741-1.497 5.05 0zm8.044-3.648c1.964 0 3.554 1.403 3.554 3.087 0 1.683-1.403 3.086-3.18 3.086h-2.058v4.116h-1.683V14.594h3.367zm-14.966-1.403v11.598h-1.683V13.191h1.683zm25.348 8.325c-1.122 0-1.777.56-1.777 1.216 0 .654.655 1.029 1.31 1.029.89 0 1.866-.68 1.957-1.713l.007-.158c-.374-.28-.935-.374-1.497-.374zm-48.545-2.713c-1.403 0-2.15 1.216-2.15 2.339 0 1.122.747 2.338 2.15 2.338 1.255 0 2.08-1.117 2.147-2.198l.005-.14c0-1.123-.749-2.339-2.152-2.339zm8.419 0c-1.403 0-2.152 1.216-2.152 2.339 0 1.122.749 2.338 2.152 2.338 1.344 0 2.087-1.117 2.147-2.198l.004-.14c0-1.123-.748-2.339-2.151-2.339zm8.511-.093c-1.122 0-2.057 1.122-2.057 2.338 0 1.31.935 2.338 2.15 2.338.705.088 1.41-.486 1.802-1.412l.07-.178c0-.075 0-.15.048-.224l.045-.056v-.842c0-.094-.093-.28-.093-.374-.281-.936-1.123-1.59-1.965-1.59zm-42.182-1.971l2.531 1.463c.4.306.657.788.657 1.33 0 .533-.25 1.009-.639 1.315l-2.547 1.473-2.789-2.792 2.787-2.79zm53.032 1.877c-1.344.09-2.173 1.468-2.075 2.241l.018.097 3.46-1.496c-.374-.655-.935-.842-1.403-.842zm10.476-2.432h-1.87v3.274h1.964c.886 0 1.604-.672 1.678-1.538l.006-.146c0-.935-.749-1.59-1.778-1.59zM18.05 9.117l11.986 6.929-2.533 2.536-9.453-9.465z"></path></svg>
                                </span>
                            </a>
                            <a class="a1040">
                                <span>
                                    <svg class="b1042" focusable="false" viewBox="0 0 28 28" aria-hidden="true" role="img"><g fill="none" fill-rule="evenodd"><path class="a1041" fill="#38383A" id="prefix__c__FacebookSvg" d="M0 14C0 6.268 6.268 0 14 0s14 6.268 14 14-6.268 14-14 14S0 21.732 0 14z"></path><path fill="#FFF" fill-rule="nonzero" d="M15.46 22.232v-7.617h2.102l.278-2.625h-2.38l.003-1.314c0-.684.065-1.05 1.048-1.05h1.315V7h-2.103c-2.526 0-3.415 1.273-3.415 3.415v1.575h-1.575v2.625h1.575v7.617h3.151z"></path></g></svg>
                                </span>
                            </a>
                            <a class="a1040">
                                <span>
                                    <svg class="b1042" focusable="false" viewBox="0 0 28 28" aria-hidden="true" role="img"><defs><path id="prefix__a__InstagramSvg" d="M0 14C0 6.268 6.268 0 14 0s14 6.268 14 14-6.268 14-14 14S0 21.732 0 14z"></path></defs><g fill="none" fill-rule="evenodd"><path class="a1041" fill="#38383A" id="prefix__c__InstagramSvg" d="M0 14C0 6.268 6.268 0 14 0s14 6.268 14 14-6.268 14-14 14S0 21.732 0 14z"></path><mask id="prefix__b__InstagramSvg" fill="#fff"><use xlink:href="#prefix__a__InstagramSvg"></use></mask><path fill="#FFF" fill-rule="nonzero" d="M14 6.533c-2.027 0-2.282.01-3.078.045-.795.037-1.338.163-1.812.347-.491.191-.908.446-1.323.861-.415.415-.67.832-.862 1.323-.185.475-.31 1.018-.347 1.812-.035.797-.045 1.051-.045 3.08 0 2.027.01 2.28.045 3.077.037.795.163 1.338.347 1.812.191.491.446.908.862 1.323.414.415.831.671 1.322.862.475.184 1.018.31 1.812.347.797.036 1.051.045 3.079.045 2.028 0 2.281-.009 3.078-.045.795-.037 1.338-.163 1.813-.347.491-.19.907-.447 1.322-.862.415-.415.67-.832.862-1.323.183-.474.31-1.017.347-1.812.035-.796.045-1.05.045-3.078 0-2.028-.01-2.282-.045-3.079-.038-.795-.164-1.337-.347-1.812-.192-.491-.447-.908-.862-1.323-.415-.415-.83-.67-1.322-.86-.476-.185-1.02-.311-1.814-.348-.797-.036-1.05-.045-3.079-.045h.003zm-.67 1.346H14c1.994 0 2.23.007 3.018.043.728.033 1.123.155 1.386.257.349.135.597.297.858.558.262.262.423.51.559.86.102.262.224.657.257 1.385.036.787.044 1.024.044 3.016 0 1.993-.008 2.23-.044 3.017-.033.728-.155 1.123-.257 1.386-.135.348-.297.596-.559.857-.261.262-.51.423-.858.559-.263.102-.658.224-1.386.257-.787.036-1.024.044-3.017.044-1.994 0-2.23-.008-3.017-.044-.728-.033-1.124-.155-1.387-.257-.348-.136-.597-.297-.859-.559-.261-.261-.423-.51-.558-.858-.103-.263-.224-.658-.258-1.386-.035-.787-.042-1.024-.042-3.018 0-1.993.007-2.229.042-3.016.034-.728.155-1.123.258-1.386.135-.349.297-.597.558-.859.262-.261.51-.423.859-.559.263-.102.659-.224 1.387-.257.688-.031.955-.04 2.347-.042v.002zm4.656 1.24c-.494 0-.896.4-.896.895s.402.896.896.896c.495 0 .896-.4.896-.896 0-.494-.4-.896-.896-.896zm-3.985 1.047c-2.118 0-3.835 1.716-3.835 3.834 0 2.118 1.717 3.834 3.835 3.834 2.117 0 3.834-1.716 3.834-3.834 0-2.118-1.717-3.834-3.834-3.834zm0 1.345c1.374 0 2.489 1.114 2.489 2.49 0 1.374-1.115 2.488-2.49 2.488-1.374 0-2.488-1.114-2.488-2.489 0-1.375 1.114-2.489 2.489-2.489z" mask="url(#prefix__b__InstagramSvg)"></path></g></svg>
                                </span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="a1042">
                <div class="a1043">
                    <div class="a1044">
                        <div class="a1045">
                            <svg class="b1042 jss208" focusable="false" viewBox="0 0 22 22" aria-hidden="true" role="img"><path d="M18.276 7.333h.974c1.013 0 1.833.821 1.833 1.834v3.666c0 1.013-.82 1.834-1.833 1.834h-.974c-.462 3.666-3.58 6.416-7.276 6.416V19.25c3.038 0 5.5-2.462 5.5-5.5v-5.5c0-3.038-2.462-5.5-5.5-5.5s-5.5 2.462-5.5 5.5v6.417H2.75c-1.013 0-1.833-.821-1.833-1.834V9.167c0-1.013.82-1.834 1.833-1.834h.974C4.186 3.667 7.303.918 11 .918c3.695 0 6.814 2.749 7.276 6.415zM2.75 9.167v3.666h.917V9.167H2.75zm15.583 0v3.666h.917V9.167h-.917zM7.113 14.47l.972-1.555c.874.547 1.884.837 2.915.835 1.03.002 2.041-.288 2.915-.835l.972 1.555c-1.165.73-2.512 1.115-3.887 1.113-1.375.002-2.722-.384-3.887-1.113z"></path></svg>
                            1588-2469
                            <button tabindex="0" type="button" onclick="openChat();"><span class="MuiButton-label">채팅문의</span></button>
                        </div>
                        <div class="a1046">평일: 09:00 ~ 18:00 / 주말 · 공휴일: 휴무</div>
                    </div>
                </div>
                <div class="a1047">
                    <div class="a1048">
                        <div class="a1049">
                            <span class="a1050">
                                <svg focusable="false" viewBox="0 0 140 30" aria-hidden="true" role="img"><g fill="#A200C7" fill-rule="evenodd"><path d="M64.104 0c-.768 0-1.393.626-1.393 1.395v15.44c0 .768.625 1.393 1.393 1.393.769 0 1.395-.625 1.395-1.394V1.394C65.499.627 64.873 0 64.104 0M33.834 15.883c-2.9 0-5.26 2.36-5.26 5.262 0 2.902 2.36 5.263 5.26 5.263 2.902 0 5.263-2.36 5.263-5.263 0-2.901-2.36-5.262-5.263-5.262m2.308 5.262c0 1.273-1.035 2.308-2.308 2.308-1.272 0-2.306-1.035-2.306-2.308 0-1.272 1.034-2.307 2.306-2.307 1.273 0 2.308 1.035 2.308 2.307M33.401 8.46c0-2.902-2.36-5.263-5.262-5.263-2.901 0-5.261 2.36-5.261 5.263 0 2.9 2.36 5.261 5.261 5.261 2.902 0 5.262-2.36 5.262-5.261m-2.954 0c0 1.272-1.035 2.307-2.308 2.307-1.271 0-2.306-1.035-2.306-2.307 0-1.273 1.035-2.309 2.306-2.309 1.273 0 2.308 1.036 2.308 2.309M54.105 3.383c-2.901 0-5.261 2.361-5.261 5.262 0 2.902 2.36 5.262 5.261 5.262 2.902 0 5.262-2.36 5.262-5.262 0-2.9-2.36-5.262-5.262-5.262m2.308 5.262c0 1.273-1.035 2.307-2.308 2.307-1.272 0-2.307-1.034-2.307-2.307 0-1.272 1.035-2.307 2.307-2.307 1.273 0 2.308 1.035 2.308 2.307M5.718 4.956h5.219c1.071 0 2.315 1.244 2.315 2.315v4.267c0 .769.626 1.394 1.395 1.394.768 0 1.393-.625 1.393-1.394V3.562c0-.769-.626-1.395-1.394-1.395H5.717c-.769 0-1.394.626-1.394 1.395 0 .373.146.723.41.987.264.263.605.417.985.407M44.21 6.688h-2.904c-1.071 0-1.942-.871-1.942-1.942v-.015c0-1.071.871-1.943 1.942-1.943h2.558c.37 0 .72-.145.983-.408.264-.263.41-.613.41-.986C45.256.625 44.63 0 43.861 0H37.97c-.095 0-.19.01-.28.028-.523.107-.943.514-1.065 1.015l-.02.072c-.008.035-.011.072-.014.109l-.004.046c-.006.04-.01.081-.01.124v13.628c0 .77.625 1.395 1.393 1.395.769 0 1.395-.626 1.395-1.395v-3.23c0-1.072 1.243-2.316 2.314-2.316h2.534c.371 0 .72-.145.983-.408.264-.263.41-.613.41-.985 0-.77-.626-1.395-1.394-1.395"></path><path d="M18.622 16.981h-5.606c-1.072 0-2.315-1.244-2.315-2.315V10.63c0-.768-.625-1.394-1.395-1.394-.768 0-1.394.626-1.394 1.394v4.035c0 1.07-1.243 2.315-2.315 2.315H1.394c-.372 0-.721.145-.985.408-.264.264-.409.614-.409.986 0 .77.625 1.395 1.394 1.395h17.227c.769 0 1.394-.626 1.394-1.395 0-.372-.145-.722-.409-.986-.263-.263-.613-.408-.984-.408M133.822 15.76c-2.901 0-5.26 2.36-5.26 5.261 0 2.902 2.359 5.263 5.26 5.263 2.902 0 5.262-2.36 5.262-5.263 0-2.9-2.36-5.261-5.262-5.261m2.308 5.261c0 1.273-1.036 2.307-2.308 2.307-1.272 0-2.307-1.034-2.307-2.307 0-1.272 1.035-2.307 2.307-2.307s2.308 1.035 2.308 2.307M139.861 1.262c-.003-.051-.008-.102-.014-.13l-.016-.067c-.127-.523-.546-.929-1.073-1.037-.092-.018-.186-.028-.28-.028h-5.783c-.769 0-1.394.626-1.394 1.394 0 .373.146.723.41.987.263.263.612.407.982.407h2.449c1.07 0 1.942.872 1.942 1.943v.016c0 1.07-.871 1.942-1.942 1.942h-2.447c-.769 0-1.394.626-1.394 1.395 0 .371.145.722.409.985.263.263.613.408.984.408H134.769c1.071 0 2.315 1.244 2.315 2.315v3.106c0 .77.625 1.395 1.395 1.395.768 0 1.393-.626 1.393-1.395V1.394c0-.033-.004-.066-.01-.132M121.486 8.483c-.828 0-1.484.656-1.484 1.484v5.764c0 .828.656 1.484 1.484 1.484h6.68c.8 0 1.399-.542 1.399-1.37 0-.828-.656-1.37-1.398-1.37h-3.4c-1.055 0-1.797-.684-1.797-1.712 0-1.027.742-1.712 1.798-1.712h3.645c.827 0 1.484-.656 1.484-1.484V3.802c0-.827-.657-1.483-1.484-1.483H121.4c-.799 0-1.398.542-1.398 1.37 0 .827.656 1.37 1.398 1.37h3.796c1.056 0 1.798.684 1.798 1.711 0 1.028-.742 1.713-1.798 1.713h-3.71zM91.632 0c-.768 0-1.393.626-1.393 1.394v5.091h-3.434v-5.09c0-.769-.624-1.394-1.393-1.394s-1.395.625-1.395 1.394v15.44c0 .767.625 1.393 1.394 1.393.769 0 1.394-.626 1.394-1.394v-5.617c0-1.071.872-1.943 1.944-1.943h1.49v7.56c0 .768.625 1.394 1.393 1.394.77 0 1.395-.626 1.395-1.394V1.394C93.027.626 92.401 0 91.632 0M76.83 5.65h3.859c.372 0 .722-.146.985-.41.264-.264.41-.614.41-.985 0-.77-.626-1.395-1.395-1.395h-7.195c-.15 0-.298.027-.461.082-.028.008-.056.017-.077.026l-.05.025c-.49.229-.807.724-.807 1.262v7.743c0 .769.625 1.395 1.395 1.395h7.371c.769 0 1.395-.626 1.395-1.394 0-.769-.626-1.394-1.395-1.394H76.83c-1.071 0-1.943-.872-1.943-1.943V7.58c.007-1.065.878-1.93 1.943-1.93M106.547 18.802c-2.901 0-5.262 2.361-5.262 5.263 0 2.902 2.36 5.262 5.262 5.262 2.901 0 5.262-2.36 5.262-5.262 0-2.902-2.36-5.263-5.262-5.263m2.308 5.263c0 1.272-1.036 2.307-2.308 2.307-1.272 0-2.308-1.035-2.308-2.307s1.036-2.308 2.308-2.308c1.272 0 2.308 1.036 2.308 2.308M115.243 14.708h-5.212c-1.07 0-2.09-1.068-2.09-2.139v-.662h3.017c.37 0 .72-.145.983-.408.264-.264.41-.614.41-.987 0-.769-.626-1.394-1.395-1.394h-5.366c-.937 0-1.611-.71-1.706-1.738h6.76c.372 0 .722-.145.985-.408.264-.263.409-.614.409-.986 0-.768-.626-1.394-1.394-1.394h-6.76c.092-.988.696-1.703 1.706-1.703H110.958c.37 0 .72-.145.983-.408.265-.264.41-.614.41-.986 0-.769-.626-1.395-1.395-1.395h-8.483c-.77 0-1.395.626-1.395 1.395v9.017c0 .716.71 1.394 1.393 1.394h2.682v.662c0 1.072-1.099 2.14-2.17 2.14h-5.091c-.769 0-1.394.625-1.394 1.393 0 .77.625 1.396 1.394 1.396h17.351c.77 0 1.395-.626 1.395-1.394 0-.77-.626-1.395-1.395-1.395"></path></g></svg>
                            </span>
                        </div>
                        <div class="a1049">
                            <address class="a1051">(주)펀엔씨 | 대표이사: 이효경 | 사업자등록번호:<!-- --> 127-86-32494 <!-- -->| 통신판매업: 제 2013-서울강남-01570호<br>개인정보보호책임자: 전민환 | 주소: 서울시 강남구 삼성로 570 석천빌딩 5층<br>팩스: 02-585-8477 | 이메일:<!-- --> webmaster@funnc.com</address>
                        </div>
                    </div>
                </div>
            </div>
            <ul class="a1052">
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-1-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-1-logo.jpg"><img src="resources/img/img/partner-1-logo.jpg" alt="개인정보 우수사이트" sizes="auto"></picture>
                </li>
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-2-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-2-logo.jpg"><img src="resources/img/img/partner-2-logo.jpg" alt="(주)세스코" sizes="auto"></picture>
                </li>
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-3-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-3-logo.jpg"><img src="resources/img/img/partner-3-logo.jpg" alt="공정거래위원회 인증 표준약관 사용" sizes="auto"></picture>
                </li>
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-3-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-3-logo.jpg"><img src="resources/img/img/partner-3-logo.jpg" alt="한국소비자 보호원" sizes="auto"></picture>
                </li>
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-5-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-5-logo.jpg"><img src="resources/img/img/partner-5-logo.jpg" alt="코모도SSL" sizes="auto"></picture>
                </li>
                <li>
                    <picture><source media="(max-width: 1199px)" srcset="resources/img/img/partner-6-logo.jpg"><source media="(min-width: 1200px)" srcset="resources/img/img/partner-6-logo.jpg"><img src="resources/img/img/partner-6-logo.jpg" alt="서울보증보험 공식가입업체" sizes="auto"></picture>
                </li>

            </ul>
        </footer>
</html>
