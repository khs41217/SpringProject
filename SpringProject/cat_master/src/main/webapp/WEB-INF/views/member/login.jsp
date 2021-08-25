<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="resPath" value="member/resources"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
<script src="resources/member/js/login.js"></script>
<link rel="stylesheet" href="resources/member/css/login.css">
</head>
<body>
    <div class="a5001">
        <h2 class="a5002">로그인</h2>
        <div class="a5003">
                <div class="a5004 jss341 ">
                    <div class="a5005">
                        <input id="id" onkeyup="enterkey()" aria-invalid="false" name="loginId" placeholder="아이디를 입력해주세요." required="" class="MuiInputBase-input MuiFilledInput-input a5006" value=${loginId}>
                    </div>
                </div>
                <div class="a5004 jss341">
                    <div class="a5005 ">
                        <input id="pw" onkeyup="enterkey()" aria-invalid="false" name="password" placeholder="비밀번호를 입력해주세요." required="" type="password" class="MuiInputBase-input MuiFilledInput-input a5006" value=${password}>
                    </div>
                </div>
                 <table>
		                <tr><td colspan="2" id="loginMessage">${message}</td></tr>
		                </table>
                <div class="a5007">
                    <label class="a5008">
                        <span id="login_checkbox"class="jss361" aria-disabled="false">
                            <span class="MuiIconButton-label">
                                <input class="a5009" id="rememberMe"name="rememberMe" type="checkbox"  checked onclick="checkbox()">
                                <svg class="MuiSvgIcon-root" focusable="false" viewbox="0 0 24 24" aria-hidden="true" role="img">
                                    <g fill="none" fill-rule="evenodd">
                                        <path class="a5013" fill="#FF5152"  d="M2 12c0 5.5 4.5 10 10 10s10-4.5 10-10S17.5 2 12 2 2 6.5 2 12z"></path>
                                        <path class="a5013" stroke="#FFF" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 11.882L10.503 15 16 9"></path>
                                        <path class="a5014" fill="#c4c4c6" d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10 10-4.5 10-10S17.5 2 12 2zm0 18c-4.4 0-8-3.6-8-8s3.6-8 8-8 8 3.6 8 8-3.6 8-8 8z"visibility= "hidden"></path>
                                        <path class="a5014" stroke="#c4c4c6" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 11.882L10.503 15 16 9"></path>
                                    </g>
                                </svg>
                            </span>
                            <span class="MuiTouchRipple-root"></span>
                        </span>
                        <span class="MuiTypography-root MuiFormControlLabel-label MuiTypography-body1">자동 로그인</span>
                    </label>
                </div>               
            <button class="a5010" tabindex="0"  id="login_button" onclick="check()"><span class="MuiButton-label">로그인</span><span class="MuiTouchRipple-root"></span></button>
        </div>
        <button class="a5010 a5011 " tabindex="0" aria-disabled="false" onclick="changeContent('Sign_upForm.member')" id="sign_button"><span class="MuiButton-label">회원가입</span><span class="MuiTouchRipple-root"></span></button>
        <div class="a5012">
            <div role="group" class="MuiButtonGroup-root" aria-label="login Help">
                <a onclick="changeContent('search_idForm.member')" class="MuiButtonBase-root MuiButtonGroup-grouped MuiButtonGroup-groupedHorizontal MuiButtonGroup-groupedText MuiButtonGroup-groupedTextHorizontal MuiButtonGroup-groupedTextPrimary" tabindex="0" aria-disabled="false"  style="border-radius: 0px;">아이디 찾기<span class="MuiTouchRipple-root"></span></a>
                <a onclick="changeContent('search_pwForm.member')" class="MuiButtonBase-root MuiButtonGroup-grouped MuiButtonGroup-groupedHorizontal MuiButtonGroup-groupedText MuiButtonGroup-groupedTextHorizontal MuiButtonGroup-groupedTextPrimary" tabindex="0" aria-disabled="false"  style="border-radius: 0px;">비밀번호 찾기<span class="MuiTouchRipple-root"></span></a>                
            </div>
        </div>
    </div>
    <jsp:include page='../common/footer.jsp'/>
</body>
</html>