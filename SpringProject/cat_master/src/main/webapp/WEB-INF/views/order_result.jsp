<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="resources/css/order_result.css">
    <link rel="stylesheet" href="resources/css/buttonanumation.css">
    <script src="/resources/js/order_result.js"></script>
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
    <div class="a1095">
        <div class="a1096">
            <h2 class="a1097">주문결제</h2>
        </div>
        <!-- * -->
        <c:set var = "result" value="${orderList}"/>
        <div class="a3001">
            <div class="a3004">
                <div class="a3005">
                    <div class="a3006">
                        <span class="a3007">
                            <span class="a3008">
                                <svg class="a3009" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)">
                                        
                                    </path>
                                </svg>
                            </span>
                            <span class="a3010">
                                <span class="a3019">01 장바구니</span>
                            </span>
                        </span>
                    </div>
                    <div class="a3012">
                        <span class="a3013">
                        </span>
                    </div>
                    <div class="a3014">
                        <span class="a3015">
                            <span class="a3016">
                                <svg class="a3017" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)">
                                    </path>
                                </svg>
                            </span>
                            <span class="a3018">
                                <span class="a3019">02 주문결제</span>
                            </span>
                        </span>
                        <div class="a3020">
                            <span class="a3021">
                            </span>
                        </div>
                    </div>
                    <div class="a3022">
                        <span class="a3023">
                            <span class="a3024">
                                <svg class="a3025" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)">
                                    </path>
                                </svg>
                            </span>
                            <span class="a3026">
                                <span class="a3011">03 결제완료</span>
                            </span>
                        </span>
                    </div>
                </div>
            </div>
        </div>
        <!-- * -->
        <div class="a1101">
            <div class="a1102">
                <h3 class="a1103">
                    <svg class="a1104" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                        <path fill="#FF5152" fill-rule="evenodd" d="M4 3h16c.552 0 1 .448 1 1v16c0 .552-.448 1-1 1H4c-.552 0-1-.448-1-1V4c0-.552.448-1 1-1zm1 2v14h14V5H5zm6.003 11L6.76 11.757l1.414-1.414 2.829 2.829 5.656-5.657 1.415 1.414L11.003 16z"></path>
                    </svg>
                    <span>주문접수가 완료되었습니다.</span>
                </h3>
                <div class="a1105">
                    <dl class="a1106">
                        <dt class="a1107">받는 사람</dt>
                        <dd class="a1108">${result.name}</dd>
                    </dl>
                    <dl class="a1106">
                        <dt class="a1107">휴대전화</dt>
                        <dd class="a1108">${result.phone}</dd>
                    </dl>
                    <dl class="a1106">
                        <dt class="a1107">배송지 주소</dt>
                        <dd class="a1108">${result.addr1} ${result.addr2} ${result.addr3}</dd>
                    </dl>
                    <dl class="a1106">
                        <dt class="a1107">배송 요청사항</dt>
                        <dd class="a1108">${result.req}</dd>
                    </dl>
                    <dl class="a1106">
                        <dt class="a1107">결제방법</dt>
                        <dd class="a1108">네이버페이</dd>
                    </dl>
                </div>
            </div>
            <div class="a1109">
                <div class="a1110">최종 결제금액</div>
            </div>
            <div class="a1111">
                <div class="a1112">
                    <dl class="a1113">
                        <dt>총 상품 금액</dt>
                        <dd> ${result.total} 원</dd>
                    </dl>
                    <dl class="a1113">
                        <dt>배송비</dt>
                        <dd>+3,000원</dd>
                    </dl>
                    <dl class="a1113">
                        <dt>쿠폰</dt>
                        <dd>0원</dd>
                    </dl>
                    <dl class="a1113">
                        <dt>보유 현금</dt>
                        <dd>0원</dd>
                    </dl>
                    <dl class="a1114">
                        <dt>총 결제금액</dt>
                        <dd>${result.total + 3000}원</dd>
                    </dl>
                </div>
            </div>
        </div>
        <div class="a1115">
            <button class="a1116" tabindex="0" type="button">
                <span class="a1117" onclick="changeContent('main.main')">쇼핑 계속하기</span>
                <span class="a1118"></span>
            </button>
        </div>

    </div>
</body>
</html>