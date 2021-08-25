<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset = UTF-8">
        <link rel="stylesheet" href="resources/member/css/Sign_up.css">
<script src="https://code.jquery.com/jquery-1.11.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="resources/member/js/Sign_up.js"></script>
	<title>회원가입</title>
    </head>
    <body>
        <div class="a4001">
            <h2 class="a4002">회원 가입</h2>
                <div>
                    <div class="a4003">
                        <label class="a4005" data-shrink="true">아이디</label>
                        <div class="a4007">
                            <input onkeyup="enterkey()" id="id" aria-invalid="false" name="id" placeholder="아이디를 입력하세요."  value="" class="a4008">
                        </div>										
                        <spen class="message" id="msg_id" >${message_id}</spen>
                    </div>
                    <div class="a4009">
                        <label class="a4010" data-shrink="true">이름</label>
                        <div class ="a4012">
                            <input onkeyup="enterkey()" id="name" aria-invalid="false" name="name" placeholder="이름을 입력하세요." required="" value="" class="a4013">
                        </div>
                    	<spen class="message" id="msg_name">${message_name}</spen>
                    </div>
                    <div class="a4014">
                        <label class="a4015" data-shrink="true">비밀번호
                        </label>
                        <div class="a4017">
                            <input onkeyup="enterkey()" id="pw"type="password" aria-invalid="false" name="password1" placeholder="비밀번호를 6자 이상 입력해 주세요." required="" value="" minlength="6" maxlength="12" class="a4018">
                        </div>
                        <spen class="message" id="msg_pwd">${message_pwd}</spen>
                    </div>
                    <div class="a4019">
                        <label class="a4020" data-shrink="true">비밀번호 확인
                        </label>
                        <div class="a4022">
                            <input onkeyup="enterkey()" id="pw_check" type="password" aria-invalid="false" name="Password2" placeholder="비밀번호를 한번 더 입력하세요." required="" value="" minlength="6" maxlength="24" class="a4023">
                        </div>
                    	<spen class="message" id="msg_pwd_check">${message_pwd}</spen>
                    </div>
                <div class="a4009" style="margin-bottom:20px;">
                        <label class="a4010" data-shrink="true">핸드폰 번호
                        </label>
                        <div class ="a4012">
                            <input onkeyup="enterkey()" id="phone" aria-invalid="false" name="phoneNumber" placeholder="핸드폰번호를 입력하세요." required="" value="" class="a4013">
                        </div>
                    	<spen class="message" id="msg_phone">${message_phone}</spen>
                    </div>
                </div>
                <button disabled="disabled" onkeyup="enterkey()" class="a4032" tabindex="0" onclick="insert()" id="reg_submit" disabled=disabled>
                    <span class="a4033">회원가입</span>
                    <span class="a4034"></span>
                </button>
                <p class="a4035">본인은 만 14세 이상이며, 고양이대통령 이용약관, <br>
                    개인정보 수집내용을 확인 하였으며, 동의합니다.</p>
        </div>
        <jsp:include page='../common/footer.jsp'/>
    </body>
</html>