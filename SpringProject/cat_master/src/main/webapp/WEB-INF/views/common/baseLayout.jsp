
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>고양이 대통령</title>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
		<script type="text/javascript">
			
			$(document).ready(function() {
				changeContent('main.main')
			})
		
			function changeContent(path) {
				$(window).unbind()
				setHeaderEvent()
				$('html').scrollTop(0)
				$.ajax({
					url: path,
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
			}
			function changeReviewPage(page) {
				$(window).unbind()
				setHeaderEvent()
				$('html').scrollTop(0)
				$.ajax({
					url: "reviews.main",
					data: {"page": page},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					if(page == 0){
						alert("선택할수 없는 페이지입니다.");
						location.back();
					}
					$('#htmlContent').html(data)
				})
			}
			function inProduct(idx) {
				$('html').scrollTop(0)
				$(window).unbind()
				$.ajax({
					url: 'product.main',
					data: {"idx": idx},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#outermost_box').children().remove()
					$('#product_box').html(data)
				})
			}
			
			function outProduct(path) {
				$('html').scrollTop(0);
				$(window).unbind()
				$.ajax({
					url: 'header.main',
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#product_box').children().remove()
					$('#outermost_box').html(data)
					var item = ''
					item += '<div>'
					item += '<div class="a2038"></div>'
					item += '<div id="htmlContent" style="position: relative; top: 168px;">'
					item += '</div>'
					item += '</div>'
					$('#outermost_box').append(item)
					changeContent(path)
				})
			}

	        function logout() {
	        	$.ajax({
					type: 'post', 
					url: 'logout.member',
					success:function (data) {
						outProduct('main.main')
					},
					error:function () {
						alert('에러가 발생했습니다.')
					}
				})
	        }
	        
	        function search(page,keyword){
	        	var keyword = keyword;
	        	var page = page;	        	
	        	$.ajax({
					url: 'search.main',
					async : true,
					data : {"keyword": keyword, "page": page},
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#htmlContent').html(data)
				})
	        }
			
			function inProductSearch(inputKeyword) {
				var inputkeyWord = inputKeyword;
				var keyword;
				if(inputkeyWord == null){
					keyword = $('#searchInput').val();
				}else{
					keyword = inputkeyWord;
				}
				$.ajax({
					url: 'header.main',
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('#product_box').children().remove()
					$('#outermost_box').html(data)
					var item = ''
					item += '<div>'
					item += '<div class="a2038"></div>'
					item += '<div id="htmlContent" style="position: relative; top: 168px;">'
					item += '</div>'
					item += '</div>'
					$('#outermost_box').append(item)
					search('1',keyword);
				})
			}
		</script>
	</head>
	<body>
		
		<div id="outermost_box">
			<jsp:include page="./header.jsp"></jsp:include>
		
			<div>
		        <div class="a2038"></div>
		        <div id="htmlContent" style="position: relative; top: 168px;">
		        
		        </div>
		    </div>
		</div>
		
		<div id="product_box">
			
		</div>
		
	</body>
</html>