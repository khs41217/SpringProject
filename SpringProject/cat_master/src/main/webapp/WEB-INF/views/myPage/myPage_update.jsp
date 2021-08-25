<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
	        .a1133 {
	            margin: 0 0 30px 0;
	            font-size: 1.7rem;
	        }
	        .a1134 {
	            margin: 20px 0 10px;
	            padding: 14px 0;
	            border-bottom: 0 none;
	            background-color: #fff;
	            font-size: 1.3rem;
	            font-weight: 700;
	        }
	        .a1135 {
	        color: rgba(0, 0, 0, 1);
	        display: flex;
	        padding: 8px 0;
	        align-items: center;
	        border-bottom: 0 none;
	        position: relative;
	        margin: 0;
	        }
	        .a1136 {
	            color: rgba(60, 60, 67, 0.6);
	            width: 80px;
	            align-self: flex-start;
	            font-weight: 400;
	            margin: 0;
	            padding: 0;
	        }
	        .a1137 {
	            margin: 0 0 0 5;
	            display: flex;
	            font-size: 1.0rem;
	            align-items: center;
	            padding: 0;
	        }
	        .a1138 {
	            display: flex;
	            padding: 8px 0;
	            align-items: center;
	            border-bottom: 0 none;
	            margin: 0;
	            position: relative;
	        }
	        .a1139 {
	            width: auto;
	            border: 1px solid #cfcfd0;
	            height: 20px;
	            padding: 0 4px;
	            position: relative;
	            margin-left: 16px;
	            border-radius: 4px;
	            justify-content: flex-start;
	            top: 0;
	            left: 0;
	            font-size: .7rem;
	            box-sizing: border-box;
	            font-family: Noto Sans KR, sans-serif;
	            color: inherit;
	            cursor: pointer;
	            display: inline-flex;
	            outline: 0;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            text-decoration: none;
	            background-color: transparent;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .a1139 > svg {
	            width: 12px;
	            height: 12px;
	            fill: currentColor;
	            display: inline-block;
	            font-size: 2.4rem;
	            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            flex-shrink: 0;
	            user-select: none;
	        }
	        .a1139 > svg > path {
	            fill: rgba(0, 0, 0, 1);
	        }
	        .a1140 {
	            top: 0;
	            left: 0;
	            right: 0;
	            bottom: 0;
	            z-index: 0;
	            overflow: hidden;
	            position: absolute;
	            border-radius: inherit;
	            pointer-events: none;
	        }
	        .a1141 {
	            margin-top: 10px;
	        }
	        .a1142 {
	            margin-right: 4px;
	            color: rgba(138, 138, 142, 1);
	            border: 0 none;
	            background-color: rgba(244, 244, 245, 1);
	            padding: 2px 14px;
	            font-size: .9rem;
	            box-shadow: none !important;
	            font-weight: 400;
	            text-transform: capitalize;
	            min-width: 64px;
	            box-sizing: border-box;
	            transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1.75;
	            border-radius: 4px;
	            cursor: pointer;
	            margin: 0;
	            display: inline-flex;
	            outline: 0;
	            position: relative;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            justify-content: center;
	            text-decoration: none;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .a1143 {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .a1144 {
	            border: 1px solid rgba(162, 0, 199, 1);
	            width: 250px;
	            height: 250px;
	            position: relative;
	        }
	        .a1145 {
	            padding: 13px 16px;
	            font-size: 1.0rem;
	            box-shadow: none !important;
	            font-weight: 500;
	            text-transform: capitalize;
	            width: 230px;
	            color: #fff;
	            background-color: rgba(162, 0, 199, 1);
	            min-width: 64px;
	            box-sizing: border-box;
	            transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1.75;
	            border-radius: 4px;
	            border: 0;
	            cursor: pointer;
	            display: inline-flex;
	            outline: 0;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            justify-content: center;
	            text-decoration: none;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	            position: absolute;
	            left: 10px;
	            bottom: 10px;
	        }
	        .a1145 > span {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .a1146 {
	            margin-top: 30px;
	            display: flex;
	            justify-content: center;
	        }
	        .a1147 {
	            cursor: pointer;
	            font-size: 1.6rem;
	            padding-bottom: 10px;
	            transform: none !important;
	            font-weight: 500;
	            color: rgba(0, 0, 0, 1);
	            position: relative;
	            transition: color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms,transform 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            display: block;
	            transform-origin: top left;
	            font-family: Noto Sans KR,sans-serif;
	            padding: 0;
	            line-height: 1;
	        }
	        .a1148 {
	            width: 98px;
	            height: 98px;
	            margin: 0 auto;
	            position: relative;
	        }
	        .a1149 {
	            border: 1px solid #cfcfd0;
	            border-radius: 50%;
	            background-color: #fff;
	            width: 100%;
	            height: 100%;
	            display: block;
	            overflow: hidden;
	            position: relative;
	        }
	        .a1150 {
	            border-radius: 50%;
	            top: 0;
	            left: 0;
	            right: 0;
	            width: 100%;
	            bottom: 0;
	            height: 100%;
	            overflow: hidden;
	            position: absolute;
	            object-fit: cover;
	            pointer-events: none;
	            margin: auto;
	            display: block;
	            max-width: 100%;
	        }
	        .a1151 {
	            right: 0;
	            bottom: 0;
	            width: 16px;
	            height: 16px;
	            padding: 4px;
	            position: absolute;
	            background: rgba(153, 153, 153, 1);
	            border-radius: 50%;
	        }
	        .a1152 {
	            width: 16px;
	            height: 16px;
	            fill: currentColor;
	            display: inline-block;
	            transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	            flex-shrink: 0;
	            user-select: none;
	            position: absolute;
	            right: 4px;
	            bottom: 4px;
	        }
	        .a1152 > path {
	            fill: #fff;
	        }
	    </style>
	    <script>
	      	$(document).ready(function() {
	      		document.querySelectorAll('.a1142').forEach(function(button) {
	      			
	                button.addEventListener('mouseover', function() {
	                    button.style.backgroundColor = 'rgba(224, 224, 224, 1)'
	                })
	                button.addEventListener('mouseout', function() {
	                    button.style.backgroundColor = 'rgba(255, 255, 255, 1)'
	                })
	            })
	      	})
	      	
	      	function withdrawal() {
	      		
	      		if(!confirm('회원 탈퇴를 진행하시겠습니까?')) {
	      			return
	      		}
	      		
	      		$.ajax({
					type: 'post', 
					url: 'withdrawal.member',
					success:function (data) {
						outProduct('main.main')
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
	      	}

        	function readURL(input) {
        		if (input.files && input.files[0]) {
        			var reader = new FileReader()
        			reader.onload = function(e) {
        				$('.a1150').attr('src', e.target.result)
        			}
        			reader.readAsDataURL(input.files[0])
        		}
        	}
			
        	$(document).ready(function() {
        		
	        	$('#label-id-0').change(function() {
	        		
	        		if( $('#label-id-0').val() == '' ) {
	        			$('.a1150').attr('src' , '') 
	        		}
	        		readURL(this)
	        	})
	        	
        	})
        	
        	function send_profile() {
            	
            	if($('#label-id-0')[0].files[0] === undefined) {
            		alert('프로필을 지정하세요.')
            		return
            	}
            	
               	var form = new FormData();
                form.append('profile', $('#label-id-0')[0].files[0] );
                
                $.ajax({
                    url : "upload_profile.member",
                    type : 'post',
                    processData : false,
                    contentType : false,
                    data : form,
                    success:function (data) {
                        if(data === 'error') {
                        	alert('프로필 업로드에 실패하였습니다.')
                        }else {
                        	alert('프로필 업로드에 성공하셨습니다.')
                        	var path = '/CatPresident/resources/profile/${member.id}/' + data
            				$('#myPageProfile').attr('src', path)
                        }
                    },
                    error:function () {
                        alert('에러가 발생했습니다.')
                    }
                })
            }
        	
	    </script>
		<title>Insert title here</title>
	</head>
	<body>
		<h2 class="a1133">회원정보</h2>
	    <div>
	        <h3 class="a1134">나의 정보</h3>
	        <div>
	            <dl class="a1135">
	                <dt class="a1136">이름</dt>
	                <dd class="a1137">${member.name}</dd>
	            </dl>
	            <dl class="a1135">
	                <dt class="a1136">이메일</dt>
	                <dd class="a1137">${member.id}</dd>
	            </dl>
	            <dl class="a1138">
	                <dt class="a1136">휴대전화</dt>
	                <dd class="a1137">
	                    ${member.phone}
	                    <a class="a1139" tabindex="0" aria-disabled="false" onclick="changeView('updatePhone.myPage')">
	                        <span>수정</span>
	                        <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
	                            <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
	                        </svg>
	                        <span class="a1140"></span>
	                    </a>
	                </dd>
	            </dl>
	            <dl class="a1138">
	                <dt class="a1136">비밀번호</dt>
	                <dd class="a1137">
	                    *******
	                    <a class="a1139" tabindex="0" aria-disabled="false" onclick="changeView('updatePw.myPage')">
	                        <span>수정</span>
	                        <svg focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
	                            <path d="M8.828 12L17.413 20.645 15.999 22.06 6 12 15.999 2.002 17.413 3.417z" transform="matrix(-1 0 0 1 23.413 0)"></path>
	                        </svg>
	                        <span class="a1140"></span>
	                    </a>
	                </dd>
	            </dl>
	
	            <div class="a1141">
	                <button onclick="logout()" class="a1142" tabindex="0" type="button">
	                    <span class="a1143">로그아웃</span>
	                </button>
	                <a onclick="withdrawal()" class="a1142" tabindex="0" aria-disabled="false">
	                    <span class="a1143">회원탈퇴</span>
	                </a>
	            </div>
	        </div>
	        <hr class="MuiDivider-root jss580">
	
	        <h3 class="a1134">나의 고양이</h3>
	        <div class="a1144">
	            <div class="a1146">
	            
	                <label class="a1147" for="label-id-0">
	                    <input id="label-id-0" type="file" style="display: none;">
	                    <div class="a1148">
	                        <div class="a1149">
	                            <img class="a1150" src="${contextPath}/resources/profile/${member.id}/${member.profile}" alt="프로필" sizes="auto">
	                        </div>                                                           
	                        <span class="a1151">
	                            <svg class="a1152" focusable="false" viewBox="0 0 24 24" aria-hidden="true" role="img">
	                                <path d="M2 3.993c.004-.546.446-.989.992-.993h18.016c.548 0 .992.445.992.993v16.014c-.004.546-.446.989-.992.993H2.992C2.444 21 2 20.555 2 20.007V3.993zM4 5v14h16V5H4zm8 10c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm0 2c-2.761 0-5-2.239-5-5s2.239-5 5-5 5 2.239 5 5-2.239 5-5 5zm5-11h2v2h-2V6z"></path>
	                            </svg>
	                        </span>
	                    </div>
	                </label>
	                
	            </div>
	            <button onclick="send_profile()" class="a1145">
	                <span>등록하기</span>
	            </button>
	        </div>
	    </div>
	</body>
</html>