<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
    <script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="resources/member/js/search_id.js"></script>
<link rel="stylesheet" href="resources/member/css/search_id.css">
</head>
<body>
    <div class="a6001 MuiContainer-disableGutters MuiContainer-maxWidthLg">
        <h2 class="a6002">아이디 찾기</h2>
            <div class="a6003 jss341">
                <label class="a6004" data-shrink="true">이름<span aria-hidden="true" class="MuiFormLabel-asterisk MuiInputLabel-asterisk"> *</span></label>
                <div class="a6005">
                    <input onkeyup="enterkey()" id="name" aria-invalid="false" name="name" placeholder="이름을 입력하세요." required="" class="a6006" value="${name}">
                </div>
            </div>
            <div class="a6003 jss341 ">
                <label class="a6004" data-shrink="true">휴대전화</label>
                <div class="a6005">
                    <input onkeyup="enterkey()" id="mobile" aria-invalid="false" name="mobile" placeholder="휴대전화 번호를 입력하세요." type="tel" class="a6006" value="${mobile}">
                </div>
                <spen class="message" id="msg_search_id" style="margin-bottom: 12px; color: rgba(162, 0, 199, 1);">${msg_search_id}</spen>
            </div>
            <button disabled="disabled" onclick="search_id_rs()" id="searchid_submit"class="a6007" tabindex="0"  id="surch_id"><span class="MuiButton-label">확인</span><span class="MuiTouchRipple-root"></span></button>
        </div>
    <jsp:include page='../common/footer.jsp'/>
</body>
</html>