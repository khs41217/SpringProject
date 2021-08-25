<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
        <link rel="stylesheet" href="resources/css/basket.css">
		<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
        <script>
	        function updateQty(idx, qty, type) {
	        	if(type=='minus' && qty == 1){
	        		return;
	        	}
	        	$.ajax({
					url: 'updateQty.main',
					data: {'idx':idx, 'type':type},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
			}
 			function deleteBasket(idx){
        		$.ajax({
					url: 'deleteBasket.main',
					data: {'idx':idx},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
	        }

       	</script>
	</head>
	<body>
	<div style="width: 70%; margin: 0 auto;">
		<div class="a3001">
			<div class="a3002">
				<h2 class="a3003">장바구니</h2>
			</div>
			<div class="a3004">
				<div class="a3005">
					<div class="a3006">
						<span class="a3007"> <span class="a3008"> <svg
									class="a3009" focusable="false" viewBox="0 0 24 24"
									aria-hidden="true" role="img">
                                <path
										d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"
										transform="matrix(-1 0 0 1 23.413 0)">
                                    
                                </path>
                            </svg>
						</span> <span class="a3010"> <span class="a3011">01 장바구니</span>
						</span>
						</span>
					</div>
					<div class="a3012">
						<span class="a3013"> </span>
					</div>
					<div class="a3014">
						<span class="a3015"> <span class="a3016"> <svg
									class="a3017" focusable="false" viewBox="0 0 24 24"
									aria-hidden="true" role="img">
                                <path
										d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"
										transform="matrix(-1 0 0 1 23.413 0)">
                                </path>
                            </svg>
						</span> <span class="a3018"> <span class="a3019">02 주문결제</span>
						</span>
						</span>
						<div class="a3020">
							<span class="a3021"> </span>
						</div>
					</div>
					<div class="a3022">
						<span class="a3023"> <span class="a3024"> <svg
									class="a3025" focusable="false" viewBox="0 0 24 24"
									aria-hidden="true" role="img">
                                <path
										d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z"
										transform="matrix(-1 0 0 1 23.413 0)">
                                </path>
                            </svg>
						</span> <span class="a3026"> <span class="a3019">03 결제완료</span>
						</span>
						</span>
					</div>
				</div>
			</div>
		</div>
		<div class="a3036">
			<div class="a3037">
				<div class="a3038">
					<h2 class="a3039">대통령발송 상품</h2>
				</div>
				<c:forEach var="basket" items="${basketList}">
					<div>
						<div class="a3040">
							<div class="a3041">
								<div class="a3042" href="/product/37592">
									<div class="a3043">
										<img class="a3045"
											src="${basket.img}"
											sizes="auto"> 
									</div>
									<div class="a3046">
										<h3 class="a3047">${basket.name}</h3>
										<h5 class="a3048" >${basket.price} 원</h5>
										<div class="a3049">
											<div class="a3050"></div>
											<div class="jss1439"></div>
									</div>
									</div>
								</div>
							</div>
							<div class="a3055">
								<div class="a3056">
									<div class="a3057">
										<button class="a3063_b" tabindex="0" type="button" id ="minus" onclick="updateQty(${basket.idx},${basket.quantity}, 'minus')">
											<span class="a3059"> <svg class="a3060"
													focusable="false" viewBox="0 0 24 24" aria-hidden="true"
													role="img">
	                                                <path fill="#38383A"
														fill-rule="evenodd"
														d="M11 11L13 11 19 11 19 13 13 13 11 13 5 13 5 11z"></path>
	                                            </svg>
											</span>
										</button>
										<div class="a3061">
											<input disabled="disabled" type="text" inputmode="decimal" class="a3062" value="${basket.quantity}">
										</div>
										<button class="a3063_a" tabindex="0" type="button" onclick="updateQty(${basket.idx},${basket.quantity}, 'plus')">
											<span class="a3064"> <svg class="a3065"
													focusable="false" viewBox="0 0 24 24" aria-hidden="true"
													role="img">
	                                                <path fill="#38383A"
														fill-rule="evenodd"
														d="M11 11L11 5 13 5 13 11 19 11 19 13 13 13 13 19 11 19 11 13 5 13 5 11z"></path>
	                                            </svg>
											</span> <span class="a3066"> </span>
										</button>
									</div>
								</div>
								<div class="a3067">
									<div class="a3069"><fmt:formatNumber value="${basket.price*basket.quantity}"/>  원 </div>
								</div>
								<div class="a3070">
									<button class="a3071" tabindex="0" type="button"
										data-testid="remove">
										<span class="a3072" onclick = "deleteBasket(${basket.idx})" > 삭제 </span>
									</button>
								</div>
							</div>
						</div>
					</div>
				<c:set var ="total" value = "${total + (basket.price * basket.quantity)}"/>
				</c:forEach>
			</div>
			<div class="a3075">
				<div class="a3076">
					<div class="a3077">
						총 상품금액<strong style="color: black;"> <fmt:formatNumber value="${total}"/> 원</strong>
					</div>
					<div class="a3078">
						배송비 <strong style="color: black;" >  <fmt:formatNumber value="3000"/> 원</strong>
					</div>
					<div class="a3079">
						22,500원 추가 주문시 <strong>무료 배송 </strong>
					</div>
					<div class="a3080">
						총 결제금액 <strong style="color: black"> <fmt:formatNumber value="${total+3000}"/> 원 </strong>
					</div>
				</div>
				<div class="a3081">
					<div class="a3082">
						<strong> 합계 : <fmt:formatNumber value="${total+3000}"/> 원 </strong>
					</div>
					<button class="a3084" tabindex="0" type="button" onClick="changeContent('selectOrderList.main')">>
						<span class="a3085">구매하기</span> <span class="a3086"> </span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./common/footer.jsp"></jsp:include>
	</body>
</html>
