<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="UTF-8">
		<title>Insert title here</title>				
	</head>
	<body style="overflow-x: hidden;">
	 	<div class="a2039">
            <div class=" a2030 a2031-root" id = "header1">
                <div><a onclick="outProduct('main.main')" style="cursor:pointer; font-size: 0;"><svg class="a2001" focusable="false" viewBox="0 0 140 30" aria-hidden="true" role="img">
                            <g fill="#A200C7" fill-rule="evenodd">
                                <path d="M64.104 0c-.768 0-1.393.626-1.393 1.395v15.44c0 .768.625 1.393 1.393 1.393.769 0 1.395-.625 1.395-1.394V1.394C65.499.627 64.873 0 64.104 0M33.834 15.883c-2.9 0-5.26 2.36-5.26 5.262 0 2.902 2.36 5.263 5.26 5.263 2.902 0 5.263-2.36 5.263-5.263 0-2.901-2.36-5.262-5.263-5.262m2.308 5.262c0 1.273-1.035 2.308-2.308 2.308-1.272 0-2.306-1.035-2.306-2.308 0-1.272 1.034-2.307 2.306-2.307 1.273 0 2.308 1.035 2.308 2.307M33.401 8.46c0-2.902-2.36-5.263-5.262-5.263-2.901 0-5.261 2.36-5.261 5.263 0 2.9 2.36 5.261 5.261 5.261 2.902 0 5.262-2.36 5.262-5.261m-2.954 0c0 1.272-1.035 2.307-2.308 2.307-1.271 0-2.306-1.035-2.306-2.307 0-1.273 1.035-2.309 2.306-2.309 1.273 0 2.308 1.036 2.308 2.309M54.105 3.383c-2.901 0-5.261 2.361-5.261 5.262 0 2.902 2.36 5.262 5.261 5.262 2.902 0 5.262-2.36 5.262-5.262 0-2.9-2.36-5.262-5.262-5.262m2.308 5.262c0 1.273-1.035 2.307-2.308 2.307-1.272 0-2.307-1.034-2.307-2.307 0-1.272 1.035-2.307 2.307-2.307 1.273 0 2.308 1.035 2.308 2.307M5.718 4.956h5.219c1.071 0 2.315 1.244 2.315 2.315v4.267c0 .769.626 1.394 1.395 1.394.768 0 1.393-.625 1.393-1.394V3.562c0-.769-.626-1.395-1.394-1.395H5.717c-.769 0-1.394.626-1.394 1.395 0 .373.146.723.41.987.264.263.605.417.985.407M44.21 6.688h-2.904c-1.071 0-1.942-.871-1.942-1.942v-.015c0-1.071.871-1.943 1.942-1.943h2.558c.37 0 .72-.145.983-.408.264-.263.41-.613.41-.986C45.256.625 44.63 0 43.861 0H37.97c-.095 0-.19.01-.28.028-.523.107-.943.514-1.065 1.015l-.02.072c-.008.035-.011.072-.014.109l-.004.046c-.006.04-.01.081-.01.124v13.628c0 .77.625 1.395 1.393 1.395.769 0 1.395-.626 1.395-1.395v-3.23c0-1.072 1.243-2.316 2.314-2.316h2.534c.371 0 .72-.145.983-.408.264-.263.41-.613.41-.985 0-.77-.626-1.395-1.394-1.395"></path>
                                <path d="M18.622 16.981h-5.606c-1.072 0-2.315-1.244-2.315-2.315V10.63c0-.768-.625-1.394-1.395-1.394-.768 0-1.394.626-1.394 1.394v4.035c0 1.07-1.243 2.315-2.315 2.315H1.394c-.372 0-.721.145-.985.408-.264.264-.409.614-.409.986 0 .77.625 1.395 1.394 1.395h17.227c.769 0 1.394-.626 1.394-1.395 0-.372-.145-.722-.409-.986-.263-.263-.613-.408-.984-.408M133.822 15.76c-2.901 0-5.26 2.36-5.26 5.261 0 2.902 2.359 5.263 5.26 5.263 2.902 0 5.262-2.36 5.262-5.263 0-2.9-2.36-5.261-5.262-5.261m2.308 5.261c0 1.273-1.036 2.307-2.308 2.307-1.272 0-2.307-1.034-2.307-2.307 0-1.272 1.035-2.307 2.307-2.307s2.308 1.035 2.308 2.307M139.861 1.262c-.003-.051-.008-.102-.014-.13l-.016-.067c-.127-.523-.546-.929-1.073-1.037-.092-.018-.186-.028-.28-.028h-5.783c-.769 0-1.394.626-1.394 1.394 0 .373.146.723.41.987.263.263.612.407.982.407h2.449c1.07 0 1.942.872 1.942 1.943v.016c0 1.07-.871 1.942-1.942 1.942h-2.447c-.769 0-1.394.626-1.394 1.395 0 .371.145.722.409.985.263.263.613.408.984.408H134.769c1.071 0 2.315 1.244 2.315 2.315v3.106c0 .77.625 1.395 1.395 1.395.768 0 1.393-.626 1.393-1.395V1.394c0-.033-.004-.066-.01-.132M121.486 8.483c-.828 0-1.484.656-1.484 1.484v5.764c0 .828.656 1.484 1.484 1.484h6.68c.8 0 1.399-.542 1.399-1.37 0-.828-.656-1.37-1.398-1.37h-3.4c-1.055 0-1.797-.684-1.797-1.712 0-1.027.742-1.712 1.798-1.712h3.645c.827 0 1.484-.656 1.484-1.484V3.802c0-.827-.657-1.483-1.484-1.483H121.4c-.799 0-1.398.542-1.398 1.37 0 .827.656 1.37 1.398 1.37h3.796c1.056 0 1.798.684 1.798 1.711 0 1.028-.742 1.713-1.798 1.713h-3.71zM91.632 0c-.768 0-1.393.626-1.393 1.394v5.091h-3.434v-5.09c0-.769-.624-1.394-1.393-1.394s-1.395.625-1.395 1.394v15.44c0 .767.625 1.393 1.394 1.393.769 0 1.394-.626 1.394-1.394v-5.617c0-1.071.872-1.943 1.944-1.943h1.49v7.56c0 .768.625 1.394 1.393 1.394.77 0 1.395-.626 1.395-1.394V1.394C93.027.626 92.401 0 91.632 0M76.83 5.65h3.859c.372 0 .722-.146.985-.41.264-.264.41-.614.41-.985 0-.77-.626-1.395-1.395-1.395h-7.195c-.15 0-.298.027-.461.082-.028.008-.056.017-.077.026l-.05.025c-.49.229-.807.724-.807 1.262v7.743c0 .769.625 1.395 1.395 1.395h7.371c.769 0 1.395-.626 1.395-1.394 0-.769-.626-1.394-1.395-1.394H76.83c-1.071 0-1.943-.872-1.943-1.943V7.58c.007-1.065.878-1.93 1.943-1.93M106.547 18.802c-2.901 0-5.262 2.361-5.262 5.263 0 2.902 2.36 5.262 5.262 5.262 2.901 0 5.262-2.36 5.262-5.262 0-2.902-2.36-5.263-5.262-5.263m2.308 5.263c0 1.272-1.036 2.307-2.308 2.307-1.272 0-2.308-1.035-2.308-2.307s1.036-2.308 2.308-2.308c1.272 0 2.308 1.036 2.308 2.308M115.243 14.708h-5.212c-1.07 0-2.09-1.068-2.09-2.139v-.662h3.017c.37 0 .72-.145.983-.408.264-.264.41-.614.41-.987 0-.769-.626-1.394-1.395-1.394h-5.366c-.937 0-1.611-.71-1.706-1.738h6.76c.372 0 .722-.145.985-.408.264-.263.409-.614.409-.986 0-.768-.626-1.394-1.394-1.394h-6.76c.092-.988.696-1.703 1.706-1.703H110.958c.37 0 .72-.145.983-.408.265-.264.41-.614.41-.986 0-.769-.626-1.395-1.395-1.395h-8.483c-.77 0-1.395.626-1.395 1.395v9.017c0 .716.71 1.394 1.393 1.394h2.682v.662c0 1.072-1.099 2.14-2.17 2.14h-5.091c-.769 0-1.394.625-1.394 1.393 0 .77.625 1.396 1.394 1.396h17.351c.77 0 1.395-.626 1.395-1.394 0-.77-.626-1.395-1.395-1.395"></path>
                            </g>
                        </svg></a></div>
                <span class="a2011">
                    <div autocomplete="off" class="a2012">
                        <div class="a2013"><svg class="a2002-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                <path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283C15.024 19.308 13.042 20.003 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9c.003 2.042-.692 4.024-1.969 5.617zm-2.006-.742C17.295 14.57 18.003 12.82 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7 1.82.003 3.57-.706 4.875-1.975l.15-.15z"></path>
                            </svg></div>
                        <div>
                            <div class="a2004-root jss47 a2008 a2004-fullWidth a2004-adornedEnd"><input type="text" id="searchInput" placeholder="3만원 이상 구매 시, 무료배송" value="" class="a2004-input a2006 a2007 a2004-inputAdornedEnd a2004-inputTypeSearch"><button class="a2003-root MuiIconButton-root a2009 a2010" tabindex="0" onclick = "inProductSearch()" aria-label="검색"><span class="MuiIconButton-label"><svg class="a2002-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                            <path d="M18.031 16.617l4.283 4.282-1.415 1.415-4.282-4.283C15.024 19.308 13.042 20.003 11 20c-4.968 0-9-4.032-9-9s4.032-9 9-9 9 4.032 9 9c.003 2.042-.692 4.024-1.969 5.617zm-2.006-.742C17.295 14.57 18.003 12.82 18 11c0-3.868-3.133-7-7-7-3.868 0-7 3.132-7 7 0 3.867 3.132 7 7 7 1.82.003 3.57-.706 4.875-1.975l.15-.15z"></path>
                                        </svg></span><span class="a2060-root"></span></button></div>
                        </div>
                    </div>
                </span>
                <div class="a2005"></div>
                <span class="a2014"><a onclick="outProduct('main.myPage')" class="a2003-root a2059-root a2059-text a2019" tabindex="0" aria-disabled="false" aria-label="마이페이지"><span class="a2059-label a2020"><span class="a2021"><svg class="a2002-root a2022" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                    <path d="M4 23c0-4.418 3.582-8 8-8s8 3.582 8 8h-2c0-3.314-2.686-6-6-6s-6 2.686-6 6H4zm8-9c-3.315 0-6-2.685-6-6s2.685-6 6-6 6 2.685 6 6-2.685 6-6 6zm0-2c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4z"></path>
                                </svg></span><span class="a2025">MY<span class="a2026"><svg class="a2002-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                        <path d="M12 15L7.757 10.757 9.172 9.343 12 12.172 14.828 9.343 16.243 10.757z"></path>
                                    </svg></span></span></span></a><span class="a2017">
                        <div>
                            <div class="a2047-root a2048 a2047-outlined">
                                <div class="a2056">
                            		<c:choose>
                                		<c:when test="${empty loginUser}">
                                			<a class="a2003-root a2059-root a2059-contained a2058 undefined a2057 a2059-containedPrimary a2059-fullWidth" tabindex="0" aria-disabled="false"><span onclick="outProduct('loginForm.member')" class="a2059-label">로그인</span><span class="a2060-root"></span></a>
                                			<a class="a2003-root a2059-root a2059-outlined a2058 a2061 a2057 a2059-colorInherit a2059-fullWidth" tabindex="0" aria-disabled="false"><span onclick="outProduct('Sign_upForm.member')" class="a2059-label">회원가입</span><span class="a2060-root"></span></a>
                                		</c:when>
                                		<c:otherwise>
                                			<a class="a2003-root a2059-root a2059-contained a2058 undefined a2057 a2059-containedPrimary a2059-fullWidth" tabindex="0" aria-disabled="false"><span onclick="logout()" class="a2059-label">로그아웃</span><span class="a2060-root"></span></a>
                                		</c:otherwise>
                                	</c:choose>
                                </div>
                            </div>
                        </div>
                    </span></span>
                <span class="a2014"><a class="a2003-root a2059-root a2059-text a2019" tabindex="0" aria-disabled="false" aria-label="장바구니" onclick="outProduct('basket.main')"><span class="a2059-label a2020"><span class="a2021"><span class="MuiBadge-root"><svg class="a2002-root a2022l" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                        <path d="M4 16V4H2V2h3c.552 0 1 .448 1 1v12h12.438l2-8H8V5h13.72c.308 0 .599.142.788.385.19.243.257.56.182.858l-2.5 10c-.111.445-.511.757-.97.757H5c-.552 0-1-.448-1-1zm2 7c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2zm12 0c-1.105 0-2-.895-2-2s.895-2 2-2 2 .895 2 2-.895 2-2 2z"></path>
                                    </svg><span class="MuiBadge-badge a2023 MuiBadge-anchorOriginTopRightCircle MuiBadge-invisible">0</span></span></span><span class="a2025">장바구니<span class="a2026"><svg class="a2002-root" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
                                        <path d="M12 15L7.757 10.757 9.172 9.343 12 12.172 14.828 9.343 16.243 10.757z"></path>
                                    </svg></span></span></span></a><span class="a2017 a2027">
                    </span></span>
            </div>
        </div>

        <!-------------->
        <div class="p_a2032">
            <div class="a2034" id = "header2">
                <div class="a2037"></div><a href="javascript:inProductSearch('')" id="p_category_background"><svg id="p_category" class="a2035" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 122 50">
                        <g fill="none" fill-rule="evenodd">
                            <path d="M0 0H122V52H0z"></path>
                            <path class="a2036" id="p_category1" fill="#000" fill-rule="nonzero" d="M51.56 35.86v-9.18h2.42v-2.64h-2.42V17.1h-3.24v18.76h3.24zm-13.38-2.6c7.14-3.66 8.28-8.4 8.28-14.42h-8.74v2.54h5.52c-.06.72-.14 1.42-.3 2.08l-6.22.32.36 2.72 4.92-.46c-.98 1.8-2.68 3.3-5.52 4.76l1.7 2.46zm33.16 2.6V17.12h-3.06v18.74h3.06zm-4-.72V17.42h-3v6.38h-1.68v2.58h1.68v8.76h3zM56.9 31.96c2.56 0 4.36-.02 6.46-.34l-.24-2.54c-1.54.22-2.88.3-4.5.32v-2.82h3.3v-2.46h-3.3v-2.5h3.92v-2.54h-6.98v12.88h1.34zm31.42-2.48c.78-4.12.78-6.82.78-9.16v-1.76H75.22v2.54h10.64c0 2.1-.08 4.64-.76 8.04l3.22.34zm2.2 4.34v-2.58h-8.08v-6.32H79.2v6.32h-5.68v2.58h17zm17.14 2.14V17.1h-3.24v18.86h3.24zm-13.06-4.3c3.52 0 6.26-.1 9.1-.62l-.32-2.6c-2.34.42-4.52.56-7.2.6v-2.86h5.64v-7.56h-8.96v2.54h5.66v2.5h-5.64v8h1.72z"></path>
                            <path id="p_category2" class="a2036" fill="#000" d="M12 19h16v3H12v-3zm0 6.5h16v3H12v-3zm0 6.5h16v3H12v-3z"></path>
                        </g>
                    </svg></a>
                <a class="a2003-root MuiTab-root MuiTab-textColorInherit a2028" tabindex="-1" aria-disabled="false" role="tab" aria-selected="false" href = "javascript:inProductSearch('(score/vote_num)')"><span class="MuiTab-wrapper">별점 순</span></a>
                <a class="a2003-root MuiTab-root MuiTab-textColorInherit a2028" tabindex="-1" aria-disabled="false" role="tab" aria-selected="false" href = "javascript:inProductSearch('vote_num')"><span class="MuiTab-wrapper">평가 순</span></a>
                <a class="a2003-root MuiTab-root MuiTab-textColorInherit a2028" tabindex="-1" aria-disabled="false" role="tab" aria-selected="false" href = "javascript:inProductSearch('quantity')"><span class="MuiTab-wrapper">랭킹</span></a>
                

                <div style="margin-right: 600px;"></div>
                <img src="https://catpre.com/images/gnb_banner.svg">
            </div>
            <div class="a2044"></div>
            <div id="p_category_list" class="a2045">
                <ul class="a2046">
                     <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('사료')">사료</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('간식')">간식</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('건강')">건강관리</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('모래')">모래</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('화장실')">화장실/위생</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('미용')">미용/목욕</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('급식')">급식기/급수기</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('타워')">스크래쳐/캣타워</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('하우스')">하우스</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('이동장')">이동장</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('의류')">의류/액세서리</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('목줄')">목줄/가슴줄</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('장난감')">장난감</a>
                    </li>
                    <li><a class="jss147" role="button" tabindex="0" style="cursor:pointer" href = "javascript:inProductSearch('생활')">생활/가전</a>
                    </li>
                </ul>
            </div>
            
        </div>
	</body>
</html>