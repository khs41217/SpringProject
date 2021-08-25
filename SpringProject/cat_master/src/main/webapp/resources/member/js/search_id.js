function search_id_rs() {
	var name = $('#name').val();
	var phone = $('#mobile').val();
	$.ajax({
		url: 'search_id.member',
		data: { 'name': name, 'phone': phone },
		type: 'post',
		dataType: 'json',
		success: function(json) {
			if (json.id == 'nothing') {
				$('#msg_search_id').text('일치하는 정보가 없습니다.');
			} else {
				$('#search_id').text(json.id);
				console.log(json.id);
				$('#joindate').text('가입일 :' + json.joindate);
				changeContent('search_id_rs.member')
			}
		}, error: function() {
			alert('서버오류 입니다 관리자에게 문의 하세요.');
		}
	});
}
function enterkey() {
	if (window.event.keyCode == 13) {
		var user_phone = $('#mobile').val();
		var regPhone = /^01([0|1|6|7|8|9]?)-([0-9]{3,4})-([0-9]{4})$/;
		var user_phone2 = user_phone.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/, "$1-$2-$3");
		var user_name= $('#name').val();
		if(user_name == ""){
			$('#msg_search_id').text('이름을 입력하세요.');
			$("#searchid_submit").attr("disabled", true);
		}else{
			if (user_phone == "") {
				$('#msg_search_id').text('핸드폰번호를 입력하세요.');
				$("#searchid_submit").attr("disabled", true);
			} else {
				if (regPhone.test(user_phone) && user_phone == user_phone2) {
					$('#msg_search_id').text('');
					$("#searchid_submit").attr("disabled", false);
				} else if (user_phone != user_phone2) {
					$('#msg_search_id').text('하이픈을 입력하세요.');
					$("#searchid_submit").attr("disabled", true);
				} else {
					$('#msg_search_id').text('핸드폰번호를 올바르게 입력하세요.');
					$("#searchid_submit").attr("disabled", true);
				}
			}
		}
		if ($("#searchid_submit").attr("disabled") == undefined)
			search_id_rs();
	}
}
