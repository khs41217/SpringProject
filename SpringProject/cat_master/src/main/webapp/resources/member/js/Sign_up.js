$(document).ready(function(){
	$("#id").blur(function() {
		var user_id = $('#id').val();
		$.ajax({
			url: 'checkId.member',
			data: { 'user_id': user_id },
			type: 'post',
			success: function(result) {
				var idJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
				//아이디 중복check
				//1 중복된 아이디 없음
				//-1중복된 아이디
				if (result == -1) {
					// 1 : 아이디가 중복되는 문구
					$("#msg_id").text("이미 사용하고 있는 아이디 입니다.");
					$("#reg_submit").attr("disabled", true);
				}else{
					if(idJ.test(user_id)){
						$("#msg_id").text("");
						$("#reg_submit").attr("disabled", false);
					}else if (user_id == "") {
						$('#msg_id').text('아이디를 입력하세요.');
						$("#reg_submit").attr("disabled", true);
					} else {
						$('#msg_id').text("올바른 이메일을 입력하세요.");
						$("#reg_submit").attr("disabled", true);
					}
				}
			}, error: function() {
				console.log("실패");
			}
		});
	});
	$("#pw").blur(function() {
		var user_pw = $('#pw').val();
		var user_pw_check = $('#pw_check').val();
		var num = user_pw.search(/[0-9]/g);
		var eng = user_pw.search(/[a-z]/ig);
		if(pw.length < 6 || pw.length > 12){
			$('#msg_pwd').text("6자리 ~ 12자리 이내로 입력해주세요.");
			$("#reg_submit").attr("disabled", true);
		}else if(user_pw.search(/\s/) != -1){
			$('#msg_pwd').text("비밀번호는 공백 없이 입력해주세요.");
			$("#reg_submit").attr("disabled", true);
		}else if(num < 0 || eng < 0 ){
			$('#msg_pwd').text("영문,숫자를 혼합하여 입력해주세요.");
			$("#reg_submit").attr("disabled", true);
		}else {
			$('#msg_pwd').text("");
			$("#reg_submit").attr("disabled", false);
		}
	});
	$("#pw_check").blur(function() {
		var user_pw = $('#pw').val();
		var user_pw_check = $('#pw_check').val();
		if (user_pw == '') {
			$('#msg_pwd_check').text('비밀번호를 입력해주세요.');
			$("#reg_submit").attr("disabled", true);
		}else if(user_pw !== user_pw_check){
			$('#msg_pwd_check').text('비밀번호가 동일하지 않습니다.');
			$("#reg_submit").attr("disabled", true);
		}else{
			$('#msg_pwd_check').text('');
			$("#reg_submit").attr("disabled", false);
		}
	});
	$("#name").blur(function() {
		var user_name = $('#name').val();
		if (user_name == "") {
			$('#msg_name').text('이름을 입력해주세요.');
			$("#reg_submit").attr("disabled", true);
		} else {
			$('#msg_name').text('');
			$("#reg_submit").attr("disabled", false);
		}
	});
	$("#phone").keyup(function() {
		var user_phone = $('#phone').val();	
		var regPhone = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
		var user_phone2 = user_phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
		if (user_phone == "") {
			$('#msg_phone').text('핸드폰번호를 입력하세요.');
			$("#reg_submit").attr("disabled", true);
		} else {
			if(regPhone.test(user_phone)&&user_phone == user_phone2){
				$('#msg_phone').text('');
				$.ajax({
					url: 'checkPhone.member',
					data: { 'user_phone' : user_phone },
					type: 'post',
					success: function(rs) {
						if(rs==-1){
							$('#msg_phone').text('이미 사용중인 핸드폰번호입니다.');
							$("#reg_submit").attr("disabled", true);
						}else{
							$("#reg_submit").attr("disabled", false);
						}
					}, error: function() {
						
					}
				});
			}else if (user_phone != user_phone2) {
				$('#msg_phone').text('하이픈을 입력하세요.');
				$("#reg_submit").attr("disabled", true);
			}else {
				$('#msg_phone').text('핸드폰번호를 올바르게 입력하세요.');
				$("#reg_submit").attr("disabled", true);
			}
		}
	});
});
function insert(){
	var id = $('#id').val();
	var pw = $('#pw').val();
	var name = $('#name').val();
	var phone = $('#phone').val();
	$.ajax({
		url: 'insertMember.member',
		data: { 'id': id,'pw' : pw, 'name' : name,'phone' : phone},
		type: 'post',
		success: function() {
	         alert("회원가입에 성공 했습니다");
	         changeContent('loginForm.member')
		}, error: function() {
			alert("회원가입에 실패하셨습니다.");
		}
	});
}
function enterkey() {
	var user_id = $('#id').val();
	var user_pw = $('#pw').val();
	var user_name = $('#name').val();
	var user_phone = $('#phone').val();
	if (window.event.keyCode == 13) {
		if($("#reg_submit").attr("disabled") == undefined){
			if(user_id == ""){
				$('#msg_id').text('아이디를 입력하세요.');
			}else if(user_pw == ""){
				$('#msg_pwd').text('비밀번호를 입력해주세요.');
			}else if(user_name == ""){
				$('#msg_name').text('이름을 입력해주세요.');
			}else{
				insert();
			}
		}
			
	}
}
	
	

