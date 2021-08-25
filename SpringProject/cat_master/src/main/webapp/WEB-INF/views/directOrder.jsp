<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="resources/css/directOrder.css">
        <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script>
		    function Postcode() {
		        new daum.Postcode({
		            oncomplete: function(data) {
		                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		                var addr = ''; // 주소 변수
		                var extraAddr = ''; // 참고항목 변수

		                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                    addr = data.roadAddress;
		                } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                    addr = data.jibunAddress;
		                }

		                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		                if(data.userSelectedType === 'R'){
		                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                        extraAddr += data.bname;
		                    }
		                    // 건물명이 있고, 공동주택일 경우 추가한다.
		                    if(data.buildingName !== '' && data.apartment === 'Y'){
		                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                    }
		                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                    if(extraAddr !== ''){
		                        extraAddr = ' (' + extraAddr + ')';
		                    }
		                    // 조합된 참고항목을 해당 필드에 넣는다.
		                    document.getElementById("addr2").value = extraAddr;
		                
		                } else {
		                    document.getElementById("addr2").value = '';
		                }

		                // 우편번호와 주소 정보를 해당 필드에 넣는다.
		                document.getElementById('addr1').value = data.zonecode;
		                document.getElementById("addr2").value = addr;
		                // 커서를 상세주소 필드로 이동한다.
		                document.getElementById("addr3").focus();
		            }
		        }).open();
		    }
 			
			function directInsertOrder() {
				var name = $("#name").val();
 				var phone = $("#phone").val();
 				var addr1 = $("#addr1").val();
 				var addr2 = $("#addr2").val();
 				var addr3 = $("#addr3").val();
 				var req= $("#req").val();
 				var total = $("#total").text();
		        if (name == "") {
		            alert("성함을 입력 하세요!");
		            $("#name").focus();
		            return;
		        } else if(phone== ""){
		        	alert("핸드폰 번호를 입력 하세요.");
		        	$("#phone").focus();
		        	return;
		        } else if(addr1 ==""){
		        	alert("우편번호를 입력 하세요")
		        	$("#addr1").focus();
		        	return;
		        } else if(addr2 ==""){
		        	alert("주소를 입력 하세요");
		        	$("#addr2").focus();
		        	return;
		        } else if(addr3 ==""){
		        	alert("상세주소를 입력 하세요")
		        	$("#addr3").focus();
		        	return;
		    	}
				$(window).unbind()
				setHeaderEvent()
				$('html').scrollTop(0)
				$.ajax({
					url: 'directInsertOrder.main',
					async : true,
					type : 'post',
					data : {'name':name, 'phone':phone, 'addr1':addr1, 'addr2':addr2, 'addr3':addr3, 'req':req, 'total':total, 'idx':${idx}, 'qty':${qty}},
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
			}
	</script>
	</head>
	<body>
        <div class="a4001">
            <div class="a4002">
                <h2 class="a4003">주문결제</h2>
            </div>
            <div class="a4004">
                <div class="a4005">
                    <div class="a4006">
                        <span class="a4007">
                            <span class="a4008">
                                <svg class="a4009" focusable="false" viewBox= "0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
                                </svg>
                            </span>
                            <span class="a4010">
                                <span class="a4011">01장바구니</span>
                            </span>
                        </span>
                    </div>
                    <div class="a4012">
                        <span class="a4013"></span>
                    </div>
                    <div class="a4014">
                        <span class="a4015">
                            <span class="a4016"> 
                                <svg class="a4017" focusable="false" viewBox= "0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
                                </svg>
                            </span>
                            <span class="a4018">
                                <span class="a4019">02주문결제</span>
                            </span>
                        </span>
                    </div>
                    <div class="a4020">
                        <span class="a4021"></span>
                    </div>
                    <div class="a4022">
                        <span class="a4023">
                            <span class="a4024"> 
                                <svg class="a4025" focusable="false" viewBox= "0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
                                </svg>
                            </span>
                            <span class="a4026">
                                <span class="a4027">03결제완료</span>
                            </span>
                        </span>
                    </div>
                </div>
            </div>
            <div class="a4028">
                <div class="a4029">
                    <div class="a4030">
                        <div class="a4031">배송정보</div>
                        <div></div>
                    </div>
                    <div class="a4032">
                        <div class="a4033">
                            <div class="a4034" style="overflow: hidden;">
                                <div aria-label="available-review-tabs" class="a4035" role = "tablist">
                                    <button class="a4038" tabindex="0" type="button" role="tab" aria-selected="true" id="tab-new" aria-controls="tabpanel-new">
                                        <span class="a4039">신규배송지</span>
                                    </button>
                                </div>
                                <span class="a4043"></span>
                            </div>
                        </div>
                        <div class="a4044" role="tabpanel" id="tabpanel-recent" aria-labelledby="tab-recent" hidden></div>
                        <div class="a4045" role="tabpanel" id="tabpanel-new" aria-labelledby="tab-new">
                            <div class="a4046">
                                <div data-testid="finder" style="display: none; position: fixed; overflow: hidden; z-index: 1;">
                                    <img data-testid="close" src="https://t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" alt="닫기 버튼" style="cursor: pointer; position: absolute; right: 8px; top: 8px; border-radius: 10px; z-index: 1;">
                                </div>
                                <div class="a4047">
                                    <div class="a4048">
                                        <div class="a4049">
                                            <label class="a4050">받는사람</label>
                                            <div class="a4051">
                                                <input aria-invalid="false" placeholder="받으시는 분의 성함을 입력하세요." class="a4052" id="name">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="a4053">
                                        <div class="a4054">
                                            <label class="a4055">휴대전화</label>
                                            <div class="a4056">
                                                <input aria-invalid="false" placeholder="휴대전화 번호를 입력하세요." class="a4057" id="phone">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="a4058">
                                        <div class="a4059">
                                            <div class="a4060">
                                                <label class="a4061" data-shrink="true">배송지 주소</label>
                                                <div class="a4062">
                                                    <input aria-invalid="false" disabled="" placeholder="우편번호를 입력하세요." class="a4063" id="addr1" value="${addr1}">
                                                </div>
                                            </div>
                                            <button class="a4064" tabindex="0" type="button"><span class="a4065" onclick='Postcode()'>우편번호</span><span class="a4066"></span></button>
                                        </div>
                                        <div class="a4067">
                                            <div class="a4068">
                                                <div class="a4069">
                                                    <input aria-invalid="false" disabled="" placeholder="주소를 입력하세요."class="a4070" id="addr2" value="${addr2}" style="width: 100%;">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="a4071">
                                            <div class="a4072">
                                                <div class="a4073">
                                                    <input aria-invalid="false" placeholder="상세주소를 입력하세요." class="a4074" id="addr3" value="${addr3}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="a4058">
                                    <div class="a4059">
                                        <div class="a4060">
                                            <label class="a4061" data-shrink="true">배송요청 사항</label>
                                            <div class="a4062">
                                                <input aria-invalid="false" placeholder="배송시 요청 사항을 입력하세요." class="a4063" id="req">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="a4079">
                                <div class="a4080">
                                    <div class="a4081">주문상품</div>
                                </div>
                                <div class="a4082">
                                    <div class="a4083">
                                        <div class="a4084">
                                            <div class="a4085">대통령발송 상품</div>
                                            <div class="a4086">발송일 : 오늘</div>
                                    </div>
                                    <c:forEach var="list" items="${goodsList}">
                                    <ul class="a4087">               
                                        <li class="a4088">
                                            <div class="a4089">
                                                <div class="a4090">
                                                	<img class="a4092" src="${list.img}" sizes="auto">
                                                </div>
                                                <div class="a4093">
                                                    <div class="a4094">
                                                        <div class="a4095">
                                                            <h3 class="a4096">${list.name}</h3>
                                                            <div class="a4097" id="qty">수량 : ${qty}개</div>
                                                        </div>
                                                        <div class="a4098">
                                                        	<span ></span>
                                                            <strong class="a4099" id="price"><fmt:formatNumber value="${price}"/>원</strong>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </li> 
                                    </ul>
                                    </c:forEach>
								</div>
                            </div>
                        </div>
                    </div>
                </div>
            <div class="a4123">
                <div class="a4124">
                    <div class="a4125">
                        <div class="a4126">최종 결제금액</div>
                    </div>
                </div>
                <div class="a4127">
                    <div class="a4128">
                        <dl class="a4129">
                            <dt>총 상품 금액</dt>
                            <dd id="total">${total}</dd>
                        </dl>
                        <dl class="a4129">
                            <dt>배송비</dt>
                            <dd>+<fmt:formatNumber value="3000"/></dd>
                        </dl>
                        <dl class="a4129">
                            <dt>쿠폰</dt>
                            <dd>0원</dd>
                        </dl>
                        <dl class="a4130">
                            <dt>총 결제금액</dt>
                            <dd><fmt:formatNumber value="${total+ 3000}"/>원</dd>
                        </dl>
                    </div>
                </div>
            </div>
            <div class="a4131">
                <div class="a4132">
                    <div class="a4133">결제방법</div>
                </div>
                <div class="a4134">
                    <div class="a4135">
                        <div class="a4136" role="radiogroup" aria-label="paymentMethods">
                            <div class="a4150">
                                <label class="a4151">
                                    <span class="a4152" aria-desabled="false">
                                        <span class="a4153">
                                            <input class="a4154" name="paymentMethods" type="radio" value="NPAY">
                                            <div class="a4155">
                                                <svg class="a4156" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <path d="M12 2C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.42 0-8-3.58-8-8s3.58-8 8-8 8 3.58 8 8-3.58 8-8 8z"></path>
                                                </svg>
                                                <svg class="a4157" focusable="false" viewBox="0 0 24 24" aria-hidden="true">
                                                    <path d="M8.465 8.465C9.37 7.56 10.62 7 12 7C14.76 7 17 9.24 17 12C17 13.38 16.44 14.63 15.535 15.535C14.63 16.44 13.38 17 12 17C9.24 17 7 14.76 7 12C7 10.62 7.56 9.37 8.465 8.465Z"></path>
                                                </svg>
                                            </div>
                                        </span>
                                        <span class="a4158"></span>
                                    </span>
                                    <span class="a4159">
                                        <div class="a4160">
                                            <svg class="a4161" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                                <g fill="none" fill-rule ="evenodd">
                                                    <g>
                                                        <g>
                                                            <g>
                                                                <g>
                                                                    <path fill="#00C73C" d="M0 19.946L19.945 19.946 19.945 0 0 0z" transform="translate(-56 -2472) translate(20 2472) translate(36) translate(2 2)"></path>
                                                                    <path fill="#FFF" d="M11.559 14.538L8.341 9.812 8.341 14.538 4.986 14.538 4.986 5.407 8.388 5.407 11.606 10.133 11.606 5.407 14.959 5.407 14.959 14.538z" transform="translate(-56 -2472) translate(20 2472) translate(36) translate(2 2)"></path>
                                                                </g>
                                                                <path d="M0 0H24V24H0z" transform="translate(-56 -2472) translate(20 2472) translate(36)"></path>
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                            </svg>
                                            <span class="a4162">네이버페이</span>
                                        </div>
                                    </span>
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
	        </div>
	        <div class="a4163">
	            <p class="a4164">위 주문 내용을 확인하였으며 결제에 동의합니다.</p>
		            <div>
		                <button class="a4165" tabindex="0" type="button" onclick="directInsertOrder()" data-testid="pay"> 
		                    <span class="a4166" >결제하기</span>
		                    <span class="a4167"></span>
		                </button>
           			</div>
        		</div>
   			</div>
		</div>
	</body>
</html>