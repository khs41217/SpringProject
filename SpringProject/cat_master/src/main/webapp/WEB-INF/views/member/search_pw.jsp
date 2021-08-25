<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>
	<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript"></script>
    <script src="resources/member/js/search_pw.js"></script>
<link rel="stylesheet" href="resources/member/css/search_pw.css">
</head>
<body>
	<div class="a6001 MuiContainer-disableGutters MuiContainer-maxWidthLg">
		<h2 class="a6002">비밀번호 찾기</h2>
		<div class="a6003 jss341">
			<label class="a6004" data-shrink="true">이메일(아이디)<span
				aria-hidden="true"
				class="MuiFormLabel-asterisk MuiInputLabel-asterisk"> *</span></label>
			<div class="a6005">
				<input onkeyup="enterkey()" aria-invalid="false" id="id" name="id" placeholder="이메일을 입력하세요."
					required="" class="a6006" value="${id}">
			</div>
		</div>
		<spen class="message" id="msg_search_pw">${message_pwd}</spen>
		<button onclick="search_pw_rs()" class="a6007" tabindex="0" id="surch_pw">
			<span class="MuiButton-label">확인</span>
			<span class="MuiTouchRipple-root"></span>
		</button>
	</div>
	<jsp:include page='../common/footer.jsp' />
</body>
</html>