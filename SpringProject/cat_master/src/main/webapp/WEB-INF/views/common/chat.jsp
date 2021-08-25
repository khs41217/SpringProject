<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
	        .c1002 {
	            height: 100%;
	            opacity: 1;
	            background: white;
	        }
	        .c1003 {
	            height: 35px;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            border-top-left-radius: 0px;
	            border-top-right-radius: 0px;
	            font-size: 16px;
	            font-weight: 600;
	            color: white;
	            background: linear-gradient(103deg, rgb(162, 0, 199) 0%, rgb(162, 0, 199) 50%, rgb(199, 0, 190)) 100% center;
	            box-shadow: rgb(0 0 0 / 10%) 0px 4px 6px 0px;
	            overflow: hidden;
	            z-index: 1;
	            position: absolute;
	            top: 0px;
	            right: 0px;
	            left: 0px;
	            padding: 14px 80px 14px 60px;
	            transform: translateZ(0px);
	        }
	        .c1003-1 {
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            position: absolute;
	            top: 0px;
	            left: 8px;
	            height: 60px;
	            cursor: pointer;
	        }
	        .c1003-2 {
	            width: auto;
	            height: auto;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            cursor: pointer;
	            visibility: visible;
	        }
	        .c1003-2::before {
	            content: "";
	            display: block;
	            width: 18px;
	            height: 18px;
	            background-image: url(https://cdn.channel.io/plugin/images/back3-white.png);
	            background-size: cover;
	            opacity: 0.6;
	        }
	        .c1004 {
	            height: 100%;
	            max-width: 180px;
	        }
	        .c1005 {
	            height: 22px;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	        }
	        .c1006 {
	            flex: 0 1 auto;
	            text-overflow: ellipsis;
	            overflow: hidden;
	            white-space: nowrap;
	        }
	        .c1007 {
	            width: 22px;
	            height: 22px;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            cursor: pointer;
	        }
	        .c1007::before {
	            content: "";
	            display: block;
	            width: 22px;
	            height: 22px;
	            background-image: url(https://cdn.channel.io/plugin/images/instant-white.png);
	            background-size: cover;
	            opacity: 1;
	        }
	        .c1008 {
	            font-size: 11px;
	            line-height: 13px;
	            overflow: hidden;
	            text-overflow: ellipsis;
	            white-space: nowrap;
	            margin-top: 1px;
	            opacity: 0.7;
	            color: white;
	            font-weight: normal;
	        }
	        .c1009 {
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            position: absolute;
	            top: 0px;
	            right: 12px;
	            height: 60px;
	        }
	        .c1010 {
	            display: inline-block;
	            color: white;
	        }
	        .c1011 {
	            width: 30px;
	            height: 30px;
	            display: inline-flex;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            cursor: pointer;
	            visibility: visible;
	        }
	        .c1011::before {
	            content: "";
	            display: block;
	            width: 18px;
	            height: 18px;
	            background-image: url(https://cf.channel.io/asset/plugin/images/more-white.svg);
	            background-size: cover;
	            opacity: 0.6;
	        }
	        .c1012 {
	            width: 30px;
	            height: 30px;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            cursor: pointer;
	            visibility: visible;
	        }
	        .c1012::before {
	            content: "";
	            display: block;
	            width: 18px;
	            height: 18px;
	            background-image: url(https://cdn.channel.io/plugin/images/close2-white.png);
	            background-size: cover;
	            opacity: 0.6;
	        }
	        .c1013 {
	            position: relative;
	            width: 100%;
	            height: 100%;
	            margin-top: 0px;
	        }
	        .c1014{
	            position: relative;
	            width: 100%;
	            height: 100%;
	            display: flex;
	            flex-direction: column;
	            background-color: rgb(255, 255, 255);
	        }
	        .c1015 {
	            -webkit-box-flex: 1;
	            flex: 1 1 0px;
	            position: relative;
	        }
	        .c1016 {
	            position: absolute;
	            inset: 0px;
	            display: flex;
	            flex-direction: column;
	            overflow-x: hidden;
	        }
	        .c1017 {
	            position: relative;
	            -webkit-box-flex: 1;
	            flex: 1 1 0px;
	            height: auto;
	        }
	        .c1018 {
	            z-index: 0;
	            padding-top: 60px;
	            position: absolute;
	            inset: 0px;
	            overflow: hidden auto;
	        }
	        .c1018-1 {
	            overflow-y: hidden !important;
	        }
	        .c1018-2 {
	            overflow-y: visible !important;
	        }
	        .c1019 {
	            display: inline-block;
	            width: 100%;
	        }
	        .c1019-1 {
	            width: calc(100%-12px);
	        }
	        .c1020 {
	            margin: 16px 14px 0px;
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            text-align: center;
	            font-size: 11px;
	            font-weight: 600;
	            color: rgb(167, 167, 170);   
	        }
	        .c1021 {
	            animation: 0.25s ease-in-out 0s 1 normal none running ixNmz;
	            margin-top: 13px;
	            display: flex;
	        }
	        .c1022 {
	            width: 40px;
	            padding-left: 10px;
	        }
	        .c1023 {
	            position: relative;
	            width: 24px;
	            height: 24px;
	            border-radius: 50%;
	            background-image: url("http://localhost:8801/CatPresident/resources/img/catpre_icon.png");
	            background-size: cover;
	            background-position: center center;
	            background-color: rgb(255, 255, 255);
	            box-shadow: none;
	        }
	        .c1024 {
	            -webkit-box-flex: 1;
	            flex: 1 1 0px;
	            overflow: hidden;
	        }
	        .c1025 {
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            font-size: 12px;
	            margin: 4px 20% 4px 0px;
	            color: rgb(36, 36, 40);
	        }
	        .c1026 {
	            flex: 0 1 auto;
	            font-size: 13px;
	            font-weight: 700;
	            overflow: hidden;
	            text-overflow: ellipsis;
	            white-space: nowrap;
	        }
	        .c1027 {
	            margin-left: 7px;
	            font-size: 11px;
	            color: rgb(167, 167, 170);
	        }
	        .c1028 {
	            display: flex;
	            margin-bottom: 4px;
	        }
	        .c1029 {
	            max-width: 280px;
	            padding: 10px;
	            border-radius: 12px;
	            background-color: rgb(240, 240, 241);
	            color: rgb(36, 36, 40);
	        }
	        .c1030 {
	            display: flex;
	        }
	        .c1031 {
	            max-width: 260px;
	            line-height: 20px !important;
	            font-size: 15px !important;
	            display: inline-block !important;
	            text-align: left !important;
	            letter-spacing: -0.1px !important;
	            white-space: pre-line !important;
	            word-break: break-word !important;
	            overflow-wrap: break-word !important;
	            border-radius: 15px !important;
	        }
	        .c1032 {
	            padding-right: 12px;
	            text-align: right;
	            color: rgb(36, 36, 40);
	        }
	        .c1033 {
	            display: block;
	            font-size: 11px;
	            margin: 10px 0px 4px;
	            color: rgb(167, 167, 170);
	        }
	        .c1034 {
	            display: flex;
	            align-items: flex-end;
	            -webkit-box-pack: end;
	            justify-content: flex-end;
	            margin-bottom: 4px;
	        }
	        .c1035 {
	            max-width: 280px;
	            padding: 10px;
	            border-radius: 12px;
	            background-color: rgb(162, 0, 199);
	            color: white;
	        }
	        .c1036 {
	            display: flex;
	        }
	        .c1037 {
	            max-width: 260px;
	            line-height: 20px !important;
	            font-size: 15px !important;
	            display: inline-block !important;
	            text-align: left !important;
	            letter-spacing: -0.1px !important;
	            white-space: pre-line !important;
	            word-break: break-word !important;
	            overflow-wrap: break-word !important;
	            border-radius: 15px !important;
	        }
	        .c1038 {
	            position: static;
	            bottom: 0px;
	            right: 0px;
	            left: 0px;
	            z-index: 1;
	            transform: translateZ(0px);
	            display: flex;
	            -webkit-box-align: center;
	            align-items: center;
	            min-height: 54px;
	            border-top: 1px solid rgb(228, 228, 229);
	            background-color: rgb(255, 255, 255);
	            box-shadow: rgb(0 0 0 / 5%) 0px 2px 6px 0px;
	        }
	        .c1039 {
	            position: relative;
	            display: inline-block;
	            width: 24px;
	            height: 24px;
	            background-image: url(https://cdn.channel.io/plugin/images/clip.png);
	            background-size: cover;
	            cursor: pointer;
	            margin-left: 13px;
	        }
	        .c1038 input, textarea {
	            font-family: "NotoSansKR", "NotoSansJP", "-apple-system", "BlinkMacSystemFont", "Helvetica Neue", "맑은 고딕", "Yu Gothic", "Segoe UI", "Roboto", "system-ui", "sans-serif";
	        }
	        .c1038 textarea {
	            overflow: hidden;
	        }
	        .c1039-1 {
	            -webkit-box-flex: 1;
	            flex: 1 1 0px;
	            display: flex;
	        }
	        .c1040 {
	            width: 100%;
	            min-height: 56px;
	            max-height: 200px;
	            line-height: 20px;
	            font-size: 15px;
	            letter-spacing: -0.1px;
	            min-width: 0px;
	            border: none;
	            resize: none;
	            margin: auto;
	            padding: 18px 10px;
	            white-space: pre-wrap;
	            overflow: hidden scroll;
	            background-color: transparent;
	        }
	        .c1041 {
	            width: 46px;
	            display: flex;
	            align-self: stretch;
	            -webkit-box-align: center;
	            align-items: center;
	            -webkit-box-pack: center;
	            justify-content: center;
	            cursor: not-allowed;
	        }
	        .c1041-1 {
	            cursor: pointer !important;
	        }
	        .c1041::after {
	            content: "";
	            display: inline-block;
	            width: 24px;
	            height: 24px;
	            background-size: cover;
	            background-image: url(https://cdn.channel.io/plugin/images/send-disabled.png);
	        }
	        .c1041::after {
	            background-image: url(https://cdn.channel.io/plugin/images/send.png) !important;
	        }
	        .c1040:focus {
				outline: none;
			}
	    </style>
	    <script>
	        
	    	$(document).ready(function() {
	    		$('.c1018').scrollTop($('.c1018').prop("scrollHeight"))
	    	})
	    
	    	var webSocket = new WebSocket("ws://localhost:8801/CatPresident/chtting.do")
	    	webSocket.onopen = function(message) {
    		}
	    		
    		webSocket.onclose = function(message) {
    		}

	    	webSocket.onmessage = function(message) {
	    		var data = message.data
	    		var sender = data.substring(0, data.indexOf('/'))
	    		var msg = data.substring(data.indexOf('/')+1)
	    		
	    		var item = ''
	    		
	    		item += '<div class="c1021">'
	    		item += '<div class="c1022">'
	    		item += '<div size="24" class="c1023"></div>'
	    		item += '</div>'
	    		item += '<div class="c1024">'
	    		item += '<div class="c1025">'
	    		item += ' <div class="c1026">고양이대통령</div>'
	    		item += '</div>'
	    		item += '<div class="c1028">'
	    		item += '<div class="c1029">'
	    		item += '<div class="c1030">'
	    		item += '<div>'
	    		item += ' <div class="c1031">' + msg + '</div>'
	    		item += '</div></div></div></div></div></div>'

				$('.c1019').append(item)
				
				if($('.c1018').scrollTop() > $('.c1018').prop("scrollHeight") - 1500)
					$('.c1018').scrollTop($('.c1018').prop("scrollHeight"))
	    	}
	    	
	    	function sendMessage() {
				
	    		var msg = $('.c1040').val()
	    		
	    		var item = ''
	    		
	    		item += '<div class="c1032">'
	    		item += '<div class="c1034">'
	    		item += '<div class="c1035">'
	    		item += '<div class="c1036">'
	    		item += '<div>'
	    		item += '<div class="c1037">' + msg + '</div>'
	    		item += '</div></div></div></div></div>'
	    		
	    		$('.c1019').append(item)
	    		
	    		webSocket.send(msg)
	    		$('.c1040').val('')
	    		
	    		if($('.c1018').scrollTop() > $('.c1018').prop("scrollHeight") - 1500)
					$('.c1018').scrollTop($('.c1018').prop("scrollHeight"))
	    	}

	        function closeChat() {
	    		webSocket.close()
	    		$('.c1001').css('display', 'none')
	    		$('.c1001').children().remove()
	        }
		
	    </script>
		<title>Insert title here</title>
	</head>
	<body>
		<div class="c1002">
	        <div class="c1003">
	            <div class="c1003-1">
	                <div class="c1003-2"></div>
	            </div>
	            <div class="c1004">
	                <div class="c1005">
	                    <div class="c1006">고양이대통령</div>
	                    <div class="c1007"></div>
	                </div>
	                <div class="c1008">보통 몇 분 내에 응답합니다.</div>
	            </div>
	            <div class="c1009">
	                <div class="c1010" onclick="closeChat()">
	                    <div class="c1012"></div>
	                </div>
	            </div>
	        </div>
	
	        <div class="c1013">
	            <div class="c1014">
	                <div class="c1015">
	                    <div class="c1016">
	                        <div class="c1017">
	                            <div class="c1018 c1018-2">
	                                <div class="c1019 c1019-1">
	                                    <div class="c1020"></div>
	                                	<c:forEach var="chat" items="${chatList}">
	                                		<c:choose>
	                                			<c:when test="${chat.sender == loginUser}">
		                                			<div class="c1032">
				                                        <div class="c1034">
				                                            <div class="c1035">
				                                                <div class="c1036">
				                                                    <div>
				                                                        <div class="c1037">${chat.content}</div>
				                                                    </div>
				                                                </div>
				                                            </div>
				                                        </div>
				                                    </div>
	                                			</c:when>
	                                			<c:otherwise>
	                                			<div class="c1021">
			                                        <div class="c1022">
			                                            <div size="24" class="c1023"></div>
			                                        </div>
			                                        <div class="c1024">
			                                            <div class="c1025">
			                                                <div class="c1026">고양이대통령</div>
			                                            </div>
			                                            <div class="c1028">
			                                                <div class="c1029">
			                                                    <div class="c1030">
			                                                        <div>
			                                                            <div class="c1031">${chat.content}</div>
			                                                        </div>
			                                                    </div>
			                                                </div>
			                                            </div>
			                                        </div>
			                                    </div>
	                                			</c:otherwise>
	                                		</c:choose>
	                                	</c:forEach>
	                                    
	                                </div>
	                            </div>
	                        </div>
	    
	                        <div class="c1038">
	                            <div class="c1039-1">
	                                <textarea data-ch-testid="messenger-footer-text-area" placeholder="메시지를 입력해주세요." class="c1040" style="height: 56px;"></textarea>
	                            </div>
	                            <div onclick="sendMessage()" data-ch-testid="messenger-footer-send-button" disabled="" class="c1041 c1041-1"></div>
	                        </div>
	
	                    </div>
	                </div>
	            </div>
	        </div>
	
	    </div>

	</body>
</html>