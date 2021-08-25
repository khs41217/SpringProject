<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
.b1020 {
	margin: 0 0 12px 0;
	font-size: 1.8rem;
	text-align: center;
}

.b1021 {
	border: 1px solid rgba(207, 204, 204, 1);
	overflow: hidden;
	border-radius: 4px;
}

.b1022 {
	border-top: 0 none;
	border-bottom: 0 none;
	margin-bottom: 0;
	padding: 0;
	background-color: #fff;
}

.b1023 {
	padding-top: 30px;
	padding-bottom: 30px;
	padding: 40px 232px;
	border-top: 1px solid rgba(235, 235, 235, 1);
	margin-top: -1px;
}

.b1024 {
	border: 0 none;
	overflow: hidden;
	background-color: #fff;
	margin: 0;
	padding: 0;
	position: relative;
	list-style: none;
}

.b1025 {
	border-top: 0 none;
	border: 0 none;
	display: flex;
	padding: 0 16px;
	position: relative;
	margin-top: -1px;
	flex-direction: column;
	background-color: #fff;
	width: 100%;
	box-sizing: border-box;
	text-align: left;
	align-items: center;
	justify-content: flex-start;
	text-decoration: none;
}

.b1026 {
	width: 100%;
	display: flex;
	padding: 14px 0;
}

.b1027 {
	width: 110px;
	height: 110px;
	overflow: hidden;
	position: relative;
	flex-grow: 0;
	flex-basis: 110px;
	flex-shrink: 0;
	margin-right: 14px;
	cursor: pointer;
}

.b1028 {
	width: 100%;
	height: 100%;
	object-fit: cover;
	margin: auto;
	display: block;
	max-width: 100%;
}

.b1029 {
	flex-grow: 1;
	min-width: 0;
}

.b1030 {
	padding-right: 220px;
	height: 100%;
	display: flex;
	position: relative;
	align-items: flex-start;
	flex-direction: column;
}

.b1031 {
	color: rgba(60, 60, 67, 0.6);
	font-size: .9rem;
}

.b1032 {
	margin: 0;
	font-size: 1.0rem;
	font-weight: 400;
	line-height: 1.5;
}

.b1033 {
	font-size: 1.4rem;
	color: rgba(60, 60, 67, 0.6);
	margin-top: 4px;
}

.b1034 {
	border-top: 0 none;
	border-bottom: 0 none;
	margin-bottom: 0;
	padding: 0;
	background-color: #fff;
}

.b1035 {
	padding: 40px 232px;
	border-top: 1px solid rgba(235, 235, 235, 1);
	margin-top: -1px;
}

.b1036 {
	padding-top: 0;
	text-align: center;
}

.b1037 {
	font-size: 1.2rem;
}

.b1038 {
	margin-top: 8px;
}

.b1039 {
	color: #ffb400;
	cursor: pointer;
	display: inline-flex;
	position: relative;
	font-size: 2.4rem;
	text-align: left;
	-webkit-tap-highlight-color: transparent;
}

.b1040 {
	cursor: inherit;
}

.b1041 {
	margin: 0;
	color: rgba(0, 0, 0, 0.26);
	display: flex;
	transition: transform 150ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	pointer-events: none;
}

.b1042 {
	width: 38px;
	height: 38px;
	fill: currentColor;
	display: inline-block;
	font-size: 2.4rem;
	transition: fill 200ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	flex-shrink: 0;
	user-select: none;
}

.b1043 {
	top: 20px;
	clip: rect(0, 0, 0, 0);
	color: #000;
	width: 1px;
	border: 0;
	height: 1px;
	margin: -1px;
	padding: 0;
	overflow: hidden;
	position: absolute;
}

.b1044 {
	padding: 40px 232px;
	border-top: 1px solid rgba(235, 235, 235, 1);
	margin-top: -1px;
}

.b1045 {
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

.b1046 {
	font-size: 1.1rem;
	padding-bottom: 10px;
	color: rgba(0, 0, 0, 1);
	position: relative;
	transform: none !important;
	font-weight: 500;
	pointer-events: none;
	transition: color 200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms, transform
		200ms cubic-bezier(0.0, 0, 0.2, 1) 0ms;
	transform-origin: top left;
	top: 0;
	left: 0;
	display: block;
	padding: 0;
	font-family: Noto Sans KR, sans-serif;
	line-height: 1;
	margin: 10px 0;
}

.b1047 {
	z-index: 1;
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
	font-family: Noto Sans KR, sans-serif;
	font-weight: 400;
	line-height: 1.1876em;
}

.b1048 {
	height: 52px;
	padding: 17.5px 44px 17.5px 16px;
	z-index: 10;
	position: relative;
	font-size: 1.1rem;
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

.b1049 {
	z-index: 1;
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

.b1050 {
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
	font-family: Noto Sans KR, sans-serif;
	font-weight: 400;
	line-height: 1.1876em;
}

.b1051 {
	min-height: 270px;
	padding: 17.5px 16px 17.5px;
	z-index: 10;
	position: relative;
	font-size: 1.1rem;
	box-sizing: border-box;
	border-radius: 4px;
	background-color: transparent;
	-webkit-appearance: none;
	resize: none;
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

.b1052 {
	border-top: 0 none;
	border-bottom: 0 none;
	margin-bottom: 0;
	padding: 0;
	background-color: #fff;
}

.b1053 {
	padding: 40px 232px;
	border-top: 1px solid rgba(235, 235, 235, 1);
	margin-top: -1px;
}

.b1054 {
	width: calc(100% + 20px);
	margin-left: -10px;
	justify-content: space-between;
	display: flex;
}

.b1055 {
	overflow: hidden;
	margin: 0 10px;
	color: rgba(138, 138, 142, 1);
	background-color: rgba(244, 244, 245, 1);
	padding: 13px 16px;
	font-size: 1.6rem;
	box-shadow: none !important;
	font-weight: 500;
	text-transform: capitalize;
	width: 100%;
	border-color: currentColor;
	min-width: 64px;
	box-sizing: border-box;
	transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,
		box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border 250ms
		cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	font-family: Noto Sans KR, sans-serif;
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

.b1056 {
	width: 100%;
	display: inherit;
	align-items: inherit;
	justify-content: inherit;
}

.b1057 {
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

.b1058 {
	overflow: hidden;
	margin: 0 10px;
	padding: 13px 16px;
	font-size: 1.6rem;
	box-shadow: none !important;
	font-weight: 500;
	text-transform: capitalize;
	width: 100%;
	color: #fff;
	background-color: rgba(162, 0, 199, 1);
	min-width: 64px;
	box-sizing: border-box;
	transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,
		box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms, border 250ms
		cubic-bezier(0.4, 0, 0.2, 1) 0ms;
	font-family: Noto Sans KR, sans-serif;
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
</style>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	        $(document).ready(function(){
	    
	            $('.b1040').click(function() {
	            	
	            	let star = $('.b1040').index(this)
	                let idx = $('.b1040').index(this)*2 + 1
	    
	                $('.review_star').val(star+1)
	                
	                for(let i=1; i<=idx; i+=2) {
	                    $('.b1040:nth-child(' + i + ')').children('.b1041').children('.b1042').children().attr('fill', '#a200c7')
	                }
	                for(let i=9; i>idx; i-=2) {
	                    $('.b1040:nth-child(' + i + ')').children('.b1041').children('.b1042').children().attr('fill', '#c4c4c6')
	                }
	            })
	    
	        })
	    	function sendReview(idx) {
	    		var title = $('.reviewTitle').val();
	    		var content = $('.reviewContent').val();
	    		var star = $('.review_star').val();
	        	if($('.reviewTitle').val() == ""){
	        		alert("제목을 입력해주세요..");
	        		return;
	        	}else if($('.reviewContent').val() == ""){
	        		alert("리뷰내용을 입력해주세요..");
	        		return;
	        	}else if($('.review_star').val() == ""){
	        		alert("리뷰별점을 선택해주세요..");
	        		return;
	        	}
	        	
	        	var reviewIdx = ${ReviewIdx}
	        	
	    		$.ajax({
					type: 'post', 
					url: 'insertReview.myPage', 
				 	data: {'reviewIdx':reviewIdx, 'idx':idx, 'title': title, 'content':content, 'star': star},
					success:function (data) {
						
						if(data==='error') {
							alert('리뷰 작성에 실패하셨습니다.')
						}else {
							
							var canWriteReviewCount = $('.jss1004').text() * 1
							$('.jss1004').text(--canWriteReviewCount)
							
							
							var reviewCount = $('.jss1005').text() * 1
							$('.jss1005').text(++reviewCount)
						}
						changeView('orders.myPage')
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
	<div>
		<h2 class="b1020">구매후기 작성</h2>
		<div class="b1021">
			<div class="b1022">
				<div class="b1023">
					<ul class="b1024" aria-label="customized table">
						<li class="b1025">
							<div class="b1026">
								<div class="b1027" onclick="inProduct('${goods.idx}')">
									<picture style="display: inline;">
									<img class="b1028"
										src="${goods.img}"
										sizes="auto"> </picture>
								</div>
								<div class="b1029">
									<div class="b1030">
										<div class="b1031">${regDate}</div>
										<h3 class="b1032 ">${goods.name}</h3>
										<div class="b1033"></div>
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
			</div>
			<div class="b1034">
				<div class="b1035">
					<div class="b1036">
						<h2 class="b1037">상품은 어떠셨나요?</h2>
						<div class="b1038">
							<span class="b1039"> <label class="b1040" for="star-1">
									<span class="b1041"> <svg class="b1042"
											focusable="false" viewBox="0 0 48 48" aria-hidden="true"
											role="img">
	                                            <path fill="#c4c4c6"
												fill-rule="evenodd"
												d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
	                                        </svg>
								</span> <span class="b1043">1 Star</span>
							</label> <input id="star-1" type="radio" name="star" class="b1043"
								value="1"> <label class="b1040" for="star-2"> <span
									class="b1041"> <svg class="b1042" focusable="false"
											viewBox="0 0 48 48" aria-hidden="true" role="img">
	                                            <path fill="#c4c4c6"
												fill-rule="evenodd"
												d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
	                                        </svg>
								</span> <span class="b1043">2 Stars</span>
							</label> <input id="star-2" type="radio" name="star" class="b1043"
								value="2"> <label class="b1040" for="star-3"> <span
									class="b1041"> <svg class="b1042" focusable="false"
											viewBox="0 0 48 48" aria-hidden="true" role="img">
	                                            <path fill="#c4c4c6"
												fill-rule="evenodd"
												d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
	                                        </svg>
								</span> <span class="b1043">3 Stars</span>
							</label> <input id="star-3" type="radio" name="star" class="b1043"
								value="3"> <label class="b1040" for="star-4"> <span
									class="b1041"> <svg class="b1042" focusable="false"
											viewBox="0 0 48 48" aria-hidden="true" role="img">
	                                            <path fill="#c4c4c6"
												fill-rule="evenodd"
												d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
	                                        </svg>
								</span> <span class="b1043">4 Stars</span>
							</label> <input id="star-4" type="radio" name="star" class="b1043"
								value="4"> <label class="b1040" for="star-5"> <span
									class="b1041"> <svg class="b1042" focusable="false"
											viewBox="0 0 48 48" aria-hidden="true" role="img">
	                                            <path fill="#c4c4c6"
												fill-rule="evenodd"
												d="M35.236 44c-.325 0-.65-.092-.94-.275L24 37.214l-10.297 6.511c-.624.396-1.415.362-2.008-.09-.592-.45-.868-1.227-.702-1.973l2.732-12.27-9.098-8.257c-.552-.5-.764-1.3-.538-2.03.226-.727.846-1.242 1.575-1.308l11.98-1.065 4.681-11.57C22.611 4.457 23.27 4 24 4c.73 0 1.39.457 1.675 1.162l4.682 11.57 11.979 1.065c.729.066 1.35.58 1.575 1.309.226.728.014 1.528-.538 2.029l-9.098 8.257 2.732 12.27c.166.746-.11 1.523-.702 1.974-.317.242-.693.363-1.07.363"></path>
	                                        </svg>
								</span> <span class="b1043">5 Stars</span>
							</label> <input id="star-5" type="radio" name="star" class="b1043"
								value="5">
							</span>
						</div>
					</div>
				</div>
				<div class="b1044">
					<input type="hidden" class="review_star">
					<div class="b1045">
						<label class="b1046" data-shrink="true">제목</label>
						<div class="b1047">
							<input aria-invalid="false" name="title" placeholder="제목을 입력하세요."
								class="b1048 reviewTitle" value="">
						</div>
					</div>
					<div class="b1049">
						<label class="b1046" data-shrink="true">내용</label>
						<div class="b1050">
							<textarea rows="1" aria-invalid="false" name="body"
								placeholder="내용을 입력하세요." class="b1051 reviewContent"
								style="height: 270px; overflow: hidden;"></textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="b1052">
				<div class="b1053">
					<div class="b1054">
						<button class="b1055 buttonG" tabindex="0" type="button">
							<span class="b1056">취소</span> <span class="b1057"></span>
						</button>
						<button class="b1058 buttonDP" onclick="sendReview('${goods.idx}')"
							tabindex="0" type="button" data-testid="submit">
							<span class="b1056">등록</span> <span class="b1057"></span>
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>