<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>아이디 찾기</title>
<link rel="stylesheet" href="resources/member/css/search_id_rs.css">
</head>
<body>
    <div class="a6008 ">
        <h2 class="jss685">아이디 찾기</h2>
        <h3 class="a6010">회원님의 아이디 찾기가 완료되었습니다.</h3>
        <ul class="a6011">
            <li class="a6012">
                <div class="MuiListItemText-root MuiListItemText-multiline">
                    <span class="a6013" id="search_id" name="search_id">${search_id}</span>
                    <p class="a6013 a6014" id="joindate" name="joindate">가입일 :${joindate}</p>
                </div>
            </li>
        </ul>
        <div class="jh">
        <a class="a6016 a6015" tabindex="0" aria-disabled="false" onclick="changeContent('loginForm.member')">
            <span class="MuiButton-label" >로그인</span>
            <span class="MuiTouchRipple-root"></span>
        </a>
        <a class="a6016 a6017 a6015" tabindex="0" aria-disabled="false" onclick="changeContent('search_pwForm.member')">
            <span class="MuiButton-label" >비밀번호 찾기</span>
            <span class="MuiTouchRipple-root"></span>
        </a>
        </div>
    </div>
    <jsp:include page='../common/footer.jsp'/>
</body>
</html>