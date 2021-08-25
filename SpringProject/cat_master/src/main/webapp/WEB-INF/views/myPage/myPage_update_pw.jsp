<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
	        .a1120 {
	            margin: 0 0 30px 0;
	            font-size: 1.7rem;
	        }
	        .a1121 {
	            border: 1px solid rgba(207, 204, 204, 1);
	            overflow: hidden;
	            border-radius: 4px;
	        }
	        .a1122 {
	            font-size: .9rem;
	            font-weight: 400;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            justify-content: center;
	            background-color: rgba(244, 244, 245, 1);
	            display: flex;
	            padding: 22px 16px;
	            position: relative;
	        }
	        .a1123 {
	            border-top: 0 none;
	            border-bottom: 0 none;
	            margin-bottom: 0;
	            padding: 0;
	        }
	        .a1124 {
	            padding: 40px 232px;
	            border-top: 1px solid rgba(235, 235, 235, 1);
	            margin-top: -1px;
	        }
	        .a1125 {
	            margin-bottom: 20px;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: inline-flex;
	            padding: 0;
	            position: relative;
	            min-width: 0;
	            flex-direction: column;
	            vertical-align: top;
	        }
	        .a1126 {
	            font-size: 1.0rem;
	            padding-bottom: 10px;
	            color: rgba(0, 0, 0, 1);
	            position: relative;
	            transform: none !important;
	            font-weight: 700;
	            pointer-events: none;
	            z-index: 1;
	            transition: color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms,transform 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            transform-origin: top left;
	            top: 0;
	            left: 0;
	            display: block;
	            padding: 0;
	            font-family: Noto Sans KR,sans-serif;
	            line-height: 1;
	
	        }
	        .a1127 {
	            z-index: 1;
	            margin: 10px 0;
	            border: 1px solid rgba(196, 196, 198, 1);
	            padding: 0;
	            background: #fff;
	            border-radius: 4px;
	            position: relative;
	            transition: background-color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	            width: 100%;
	            color: rgba(0, 0, 0, 1);
	            cursor: text;
	            display: inline-flex;
	            font-size: 1.1rem;
	            box-sizing: border-box;
	            align-items: center;
	            font-family: Noto Sans KR,sans-serif;
	            font-weight: 400;
	            line-height: 1.1876em;
	            
	        }
	        .a1128 {
	            height: 52px;
	            padding: 15px 15px;
	            z-index: 10;
	            position: relative;
	            box-sizing: border-box;
	            border-radius: 4px;
	            background-color: transparent;
	            -webkit-appearance: none;
	            font: inherit;
	            color: currentColor;
	            width: 100%;
	            border: 0;
	            margin: 0;
	            display: block;
	            min-width: 0;
	            background: none;
	            animation-name: mui-auto-fill-cancel;
	            letter-spacing: inherit;
	            animation-duration: 10ms;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .a1129 {
	            width: calc(100% + 20px);
	            margin-left: -10px;
	            display: flex;
	            justify-content: space-between;
	        }
	        .a1130 {
	            margin: 0 10px;
	            padding: 13px 16px;
	            font-size: 1.0rem;
	            box-shadow: none !important;
	            font-weight: 500;
	            text-transform: capitalize;
	            width: 100%;
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
	            position: relative;
	            align-items: center;
	            user-select: none;
	            vertical-align: middle;
	            justify-content: center;
	            text-decoration: none;
	            -webkit-appearance: none;
	            -webkit-tap-highlight-color: transparent;
	        }
	        .a1131 {
	            width: 100%;
	            display: inherit;
	            align-items: inherit;
	            justify-content: inherit;
	        }
	        .a1132 {
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
	    </style>
		<title>Insert title here</title>
		<script type="text/javascript">
		function updatePw() {
			
			var pw = $('#pw').val()
			var pwCheck = $('#pwCheck').val()
			
			var regPw = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{6,12}$/

			if(!regPw.test(pw)) {
				alert('비밀번호는 6~12자의 영어, 숫자 조합입니다.')
				return
			}
			
			if(pw!==pwCheck) {
				alert('비밀번호 확인이 다릅니다.')
				return
			}
			
			$.ajax({
				url: 'updatePwAction.myPage',
				data : {'pw':pw},
				async : true,
				type : 'post',
				dataType : 'html',
				cache: false
			}).done(function (data) {
				$('main').html(data)
			})
		}
		</script>
	</head>
	<body>	
		<h2 class="a1120">비밀번호 변경</h2>
        <div class="a1121">
            <div class="a1123">
                <div class="a1124">
                    <div class="a1125">
                        <div class="a1127">
                            <input id="pw" aria-invalid="false" placeholder="비밀번호를 입력하세요." type="password" class="a1128">
                        </div>
                        <div class="a1127">
                            <input id="pwCheck" aria-invalid="false" placeholder="비밀번호를 확인하세요." type="password" class="a1128">
                        </div>
                    </div>
                    <div class="a1129">
                        <button class="a1130" tabindex="0" onclick="updatePw()">
                            <span class="a1131">변경</span>
                            <span class="a1132"></span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
	</body>
</html>