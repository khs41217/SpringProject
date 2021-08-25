<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<style>
			.b1001 {
			    margin: 20px 0 10px;
			    padding: 14px 0;
			    border-bottom: 0 none;
			    background-color: #fff;
			    font-size: 1.3rem;
			    font-weight: 700;
			}
			.b1002 {
			    table-layout: fixed;
			    width: 100%;
			    display: table;
			    border-spacing: 0;
			    border-collapse: collapse;
			}
			.b1003 {
			    display: table-header-group;
			}
			.b1004 {
			    color: inherit;
			    display: table-row;
			    outline: 0;
			    vertical-align: middle;
			}
			.b1005 {
			    border: 0 none;
			    padding: 12px 20px;
			    font-size: 1.0rem;
			    background-color: rgba(244, 244, 245, 1);
			    text-align: center;
			    color: rgba(0, 0, 0, 1);
			    font-weight: 700;
			    line-height: 2.4rem;
			    display: table-cell;
			    font-family: Noto Sans KR,sans-serif;
			    vertical-align: inherit;
			}
			.b1006 {
			    display: table-row-group;
			}
			.b1007 {
			    padding: 24px 20px;
			    font-size: 1.0rem;
			    border-color: rgba(235, 235, 235, 1);
			    text-align: center;
			    color: rgba(0, 0, 0, 1);
			    display: table-cell;
			    font-family: Noto Sans KR,sans-serif;
			    font-weight: 400;
			    line-height: 1.43;
			    border-bottom: 1px solid rgba(224, 224, 224, 1);
			    vertical-align: inherit;
			}
			.b1007-1 {
			    border-left: 1px solid rgba(235, 235, 235, 1);
			}
			.b1008 {
			    color: rgba(60, 60, 67, 0.6);
			}
			.b1009 {
			    padding: 24px 20px;
			    font-size: 1.4rem;
			    border-left: 1px solid rgba(235, 235, 235, 1);
			    border-color: rgba(235, 235, 235, 1);
			    color: rgba(0, 0, 0, 1);
			    display: table-cell;
			    text-align: left;
			    font-family: Noto Sans KR,sans-serif;
			    font-weight: 400;
			    line-height: 1.43;
			    border-bottom: 1px solid rgba(224, 224, 224, 1);
			    vertical-align: inherit;
			}
			.b1009-1 {
			    width: 100%;
			    display: flex;
			    padding: 0;
			}
			.b1010 {
			    width: 100px;
			    height: 100px;
			    position: relative;
			    flex-grow: 0;
			    flex-basis: 100px;
			    flex-shrink: 0;
			    margin-right: 20px;
			}
			.b1011 {
			    display: inline;
			}
			.b1012 {
			    width: 100%;
			    margin: auto;
			    display: block;
			    max-width: 100%;
			}
			.b1013 {
			    flex-grow: 1;
			    min-width: 0;
			}
			.b1014 {
			    margin: 0;
			    font-size: .9rem;
			    font-weight: 400;
			    line-height: 1.5;
			}
			.b1014 > a {
			    color: rgba(0, 0, 0, 1);
			    text-decoration: none;
			}
			.b1015 {
			    font-size: 1.1rem;
			    font-weight: 700;
			}
			.b1016 {
			    font-weight: 700;
			}
			.b1017 {
			    overflow: hidden;
			    color: rgba(162, 0, 199, 1);
			    background-color: rgba(248, 235, 251, 1);
			    padding: 10px 16px;
			    font-size: 1.0rem;
			    box-shadow: none !important;
			    font-weight: 400;
			    text-transform: capitalize;
			    border-color: currentColor;
			    min-width: 64px;
			    box-sizing: border-box;
			    transition: background-color 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,box-shadow 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms,border 250ms cubic-bezier(0.4, 0, 0.2, 1) 0ms;
			    font-family: Noto Sans KR,sans-serif;
			    line-height: 1.75;
			    border-radius: 4px;
			    border: 0;
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
			.b1018 {
			    width: 100%;
			    display: inherit;
			    align-items: inherit;
			    justify-content: inherit;
			}
			.b1019 {
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
		<script type="text/javascript">
			
			var canMore = true
			var page = 1
		
			$(document).ready(function() {
				$(window).scroll(function(){

					if(canMore&&$(window).scrollTop() > ($('body').height()-1000)) {
						canMore = false						
						readMore()
					}

				})
				setBtnEvent()
			})
			
			function readMore() {
				page++
				$.ajax({
			        type: "post", 
			        url: "moreWriteReviews.myPage", 
			        data: {'page':page},
			        success:function (data) {
			        	
			        	var writeReviewList = data.writeReviewList
		            
		            	var item = ''
		            
			        	for(var i=0; i<writeReviewList.length; i++) {
			        		item += '<tr class="b1004">'
			        		item += '<td class="b1007">'
			        		item += '<span class="b1008">' + writeReviewList[i].reviewIdx + '</span>'
			        		item += '</td>'
			        		item += ' <td class="b1007 b1007-1">'
			        		item += '<span class="b1008">' + writeReviewList[i].regDate + '</span>'
			        		item += '</td>'
			        		item += '<td class="b1009">'
			        		item += '<div class="b1009-1">'
			        		item += '<div class="b1010">'
			        		item += '<a  style="cursor: pointer;" onclick="inProduct(\'' +  writeReviewList[i].idx + '\')">'
			        		item += '<picture class="b1011">'
			        		item += '<img class="b1012" src="' + writeReviewList[i].img + '" sizes="auto">'
			        		item += '</picture>'
			        		item += '</a>'
			        		item += '</div>'
			        		item += '<div class="b1013">'
			        		item += '<h3 class="b1014">'
			        		item += '<a>' + writeReviewList[i].name + '</a>'
			        		item += '</h3>'
			        		var price = writeReviewList[i].price + ''
			        		price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",")
			        		item += '<strong class="b1015">' + price + '</strong>'
			        		item += '</div>'
			        		item += '</div>'
			        		item += '</td>'
			        		item += '<td class="b1007 b1007-1">'
			        		item += '<button onclick="reviewModifyForm(\'' + writeReviewList[i].reviewIdx + '\')" class="b1017 buttonP" tabindex="0" type="button">'
			        		item += '<span class="b1018">수정하기</span>'
			        		item += '<span class="b1019"></span>'
			        		item += '</button>'
			        		item += '</td>'
			        		item += '</tr>'
			        	}
			        	$('.b1006').append(item)
			        	
			        	setBtnEvent()
			        	
			        	if(writeReviewList.length>0)
							canMore = true
			        },
			        error:function () {
			        	alert('에러가 발생했습니다.');
			        }
			    })
			}
			function reviewModifyForm(reviewIdx) {
				$(window).unbind()
				$.ajax({
					url: 'reviewModifyForm.myPage',
					data : {'reviewIdx':reviewIdx,},
					async : true,
					type : 'post',
					dataType : 'html',
					cache: false
				}).done(function (data) {
					$('main').html(data)
				})
			}
		</script>
		<title>Insert title here</title>
	</head>
	<body>
		<h2 class="b1001">작성한 리뷰</h2>
	    <table class="b1002" aria-label="customized table">
	        <colgroup>
	            <col width="150px">
	            <col width="140px">
	            <col width="auto">
	            <col width="180px">
	        </colgroup>
	        <thead class="b1003">
	            <tr class="b1004">
	                <th class="b1005" scope="col">리뷰 번호</th>
	                <th class="b1005" scope="col">작성 일자</th>
	                <th class="b1005" scope="col">상품 정보</th>
	                <th class="b1005" scope="col">수정하기</th>
	            </tr>
	        </thead>
	        <tbody class="b1006">
	        	<c:forEach var="goods" items="${writeReviewList}">
		            <tr class="b1004">
		                <td class="b1007">
		                    <span class="b1008">${goods.reviewIdx}</span>
		                </td>
		                <td class="b1007 b1007-1">
		                    <span class="b1008">${goods.regDate}</span>
		                </td>
		                <td class="b1009">
		                    <div class="b1009-1">
		                        <div class="b1010">
		                            <a style="cursor: pointer;" onclick="inProduct('${goods.idx}')">
		                                <picture class="b1011">
		                                    <img class="b1012" src="${goods.img}" sizes="auto">
		                                </picture>
		                            </a>
		                        </div>
		                        <div class="b1013">
		                            <h3 class="b1014">
		                                <a>${goods.name}</a>
		                            </h3>
		                            <strong class="b1015"><fmt:formatNumber value="${goods.price}" pattern="#,###"/></strong>
		                        </div>
		                    </div>
		                </td>
		                <td class="b1007 b1007-1">
		                    <button onclick="reviewModifyForm('${goods.reviewIdx}')" class="b1017 buttonP" tabindex="0" type="button">
		                        <span class="b1018">수정하기</span>
		                        <span class="b1019"></span>
		                    </button>
		                </td>
		            </tr>
	        	</c:forEach>
	        </tbody>
	    </table>
	    
	</body>
</html>