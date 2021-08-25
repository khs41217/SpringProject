function search_pw_rs() {
	var id = $('#id').val();
	$.ajax({
		url: 'search_pw_rs.member',
		data: { 'id': id },
		type: 'post',
		success: function(searchPw) {
			console.log(searchPw);
			var idJ = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
			//아이디 중복check
			//1 중복된 아이디 없음
			//-1중복된 아이디
			//0 서버오류
			if (searchPw == -1) {
				alert('새로운 비밀번호를 보냈습니다!');
				changeContent('loginForm.member')
			} else {
				if (idJ.test(id)) {
					// 0 : 아이디 길이 / 문자열 검사
					$("#msg_search_pw").text("가입되지 않은 이메일 입니다.");
				} else if (id == "") {
					$('#msg_search_pw').text('아이디를 입력하세요.');
				} else {
					$('#msg_search_pw').text("이메일 형식에 맞게 입력해주세요.");
				}
			}
		}, error: function() {
			alert('서버오류 입니다 관리자에게 문의 하세요.');
		}
	});
}
function enterkey() {
	if (window.event.keyCode == 13) {
 		search_pw_rs();
	}
}