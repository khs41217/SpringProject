function check() {
	var user_id = $('#id').val();
	var user_pw = $('#pw').val();
	if($('input:checkbox[id="rememberMe"]').is(":checked") == true){
		var rememberMe='true';
	}else{
		var rememberMe='false';
	}
	$.ajax({
		url: 'login.member',
		data: {'user_id': user_id, 'user_pw' : user_pw,'rememberMe' : rememberMe},
	    type: 'post',
			success: function(loginRs) {
				if (loginRs == -2 || loginRs== 0) {
					$("#loginMessage").text("이메일(아이디)또는 비밀번호가 일치하지 않습니다.");
				}else{
					// 로그인성공후 페이지 이동처리
					outProduct('main.main')
				}
		}, error: function() {
			alert('서버오류입니다 관리자에게 문의하세요.');
		}
	});
}
	var text = 0;
	function checkbox(){
		var rememberMe = $('#rememberMe').val();
		if (text == 0) {
			$(".a5013").css("visibility", "hidden");
			$(".a5014").css("visibility", "visible");
			text =1 
		} else {
			$(".a5013").css("visibility", "visible");
            $(".a5014").css("visibility","hidden");
			text=0;
		}
	}
	$(".a5006").on("focuce", function(e){
		 $(".a5006").css("outline-style" ,"unset");
		$(".a5006").css("outline-color", "rgba(162, 0, 199, 1)");
		$(".a5006").css("outline-style", "unset");
	});
	
function enterkey() {
	if (window.event.keyCode == 13) {
		var user_id = $('#id').val();
		var user_pw = $('#pw').val();
		var idJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		if (idJ.test(user_id)) {
			$("#loginMessage").text("");
			if (user_pw == "") {
				$("#loginMessage").text("비밀번호를 입력해 주세요.");
				$('#login_button').attr("disabled", true);
			} else {
				$('#login_button').attr("disabled", false);
			}
		} else if (user_id == "") {
			$('#loginMessage').text('아이디를 입력하세요.');
			$("#login_button").attr("disabled", true);
		} else {
			$('#loginMessage').text("올바른 이메일을 입력하세요.");
			$("#login_button").attr("disabled", true);
		}
		if ($("#login_button").attr("disabled") == undefined)
			check();
	}
}

