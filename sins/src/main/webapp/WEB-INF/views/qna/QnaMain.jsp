<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>


<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
	
		
<style>
	.font9pt{
		font-size:10pt;
	
	}
	
	.titleLabel{
	font-size:10pt;
	cursor:pointer;
	
	}
	.titleLabel:hover{
	
	text-decoration:underline;
	}
	
	.idLabel{
		color:blue;
		font-size:10pt;
		cursor:pointer;
		
	}
	.idLabel:hover{
	cursor:hand;
	text-decoration:underline;
	color:red;
	}
	

	
	.atag{
	text-decoration:none;
	color:black;
	
	
	}
	

.titleFont {
		font-size: 30px;
		
	}
	.ths{
	font-size:10pt;
	
	
	}
	
	
	
	

	
</style>
	
	
	<script>
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
		
	}
	
$(document).ready(function(){
	
	$('#content').css('height', $(window).height() -60);
	$(window).resize(function() {
		$('#content').css('height', $(window).height() -60);
		
	});
	
	$("#t-l").click(function(){
		$("#spot1, #overlay_t").show(300);
	}); 
 	$("#overlay_t").click(function(e){ 
     	e.preventDefault(); 
     	$("#spot1, #spot2, #overlay_t").hide(300); 
	});
 	$("#t-r").click(function(){
 		$("#spot2, #overlay_t").show(300);
 	}); 
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice1, #notice2").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
 	
 	setTimeout(function(){
 		$('#friend').html(friendTag);
 		
 	},500);

		
	if(${not empty option}){
			if(option==1){
				$("#option1").prop("selected", true);
			}
			if(option==2){
				$("#option2").prop("selected", true);
			}
			if(option==3){
				$("#option3").prop("selected", true);
			}
		}
	
		
	});
	
	function search(){
		
		
		var option=$("#option").val();
		var keyword=$("#key").val();
		location.href="selectQna.n?keyword="+keyword+"&option="+option; 
	}
	
	
	</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
       
	        <ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="newsfeed.b">뉴스피드</a></li>
	          <li id="notice1"><label class="notice1" style='cursor:pointer;'>고객센터</label></li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	         
	        </ul>
      	</div>
		<div id="content" class="box">

			<strong class="titleFont">Q&A</strong><br><br>
			<div id="qnaDiv">
				<hr />
				<br>
				<table id="qnaTable" style='text-align: center;' align="center">

					<tr>
						<th style='width:5%;' class='ths'><label class="ths">No</label></th>
						<th style='width:30%' class='ths'><label class="ths">제목</label></th>
						<th style='width:15%;' class='ths'><label class="ths">작성자</label></th>
						<th style='width:15%;' class='ths'><label class="ths">조회수</label></th>
						<th style='width:15%;' class='ths'><label class="ths">작성일</label></th>
						<th style='width:20%' class='ths'><label class="ths">답변상태</label></th>
					</tr>
					<c:forEach var="qna" items="${qnaList }">
						<tr>
							<td class='tds'><label style='font-size:8pt;'>${qna.qnaNo }</label></td>
							<td class='tds'><a class="atag"
								href="detailQna.n?no=${qna.qnaNo }"><label class="titleLabel">${qna.title }</label></a></td>
							<td class='tds'><a class="atag"
								style='text-decoration: none;' href='#'><label class="idLabel" onclick="location.href='mypage2.b?userid=${qna.userId}'">
								
								
								 <c:set var="sym" value="${fn:indexOf(qna.userId, '@') }"/>
								
						 
								
								 <c:out value="${fn:substring(qna.userId, 0, sym)} "/>   </label></a></td> 
							<td class='tds'><label style='font-size:8pt;'>${qna.readCount }</label></td>
							<td class='tds'><label style='font-size:8pt;'>${qna.writeDate }</label></td>
							<td class='tds'><c:if test="${qna.comCount gt 0}">
									<label style='color: red; font-size:9pt;' >답변 완료</label>
								</c:if> <c:if test="${qna.comCount eq 0}"><label style='font-size:8pt;'>미답변</label></c:if></td>
						</tr>
					</c:forEach>




				</table>
				<br>
				<hr />

			</div>
			<button class="buttons" style='background:white' onclick="writeForm()">질문하기</button>

			<br>
			<br>

			<div id="pageSection" align="center">
			
				<c:if test="${currentPage gt 1 }">
				<a class="atag" href="<c:if test="${empty keyword }">selectQna.n?page=1</c:if>
				<c:if test="${not empty keyword }">selectQna.n?page=1&keyword=${keyword }&option=${option }</c:if>
				">[처음] </a>

				</c:if>
				<c:if test="${currentPage eq 1 }">
				[처음]
				</c:if>
				
					
				<c:if test="${currentPage gt 1 }">
					<a class="atag" href="
					<c:if test="${empty keyword }">selectQna.n?page=${currentPage - 1 }</c:if>
					<c:if test="${not empty keyword }">selectQna.n?page=${currentPage - 1 }&keyword=${keyword }&option=${option }</c:if>
					">[이전]
					</a>
				</c:if>
				<c:if test="${currentPage eq 1 }">[이전] </c:if>

				<c:forEach var="num" begin="${startPage }" end="${endPage }"
					step="1">

					<c:if test="${num eq currentPage }">
						<strong>${num }</strong>&nbsp;
	</c:if>
					<c:if test="${num ne currentPage }">
						<a class="atag" href="
						<c:if test="${empty keyword }">selectQna.n?page=${num }</c:if>
						<c:if test="${not empty keyword}">selectQna.n?page=${num }&keyword=${keyword }&option=${option }</c:if> 
						">${num }</a> &nbsp;
	</c:if>
				</c:forEach>



				<c:if test="${currentPage lt maxPage }">
					<a class="atag" href="
					<c:if test="${empty keyword }">selectQna.n?page=${currentPage + 1 }</c:if>
					<c:if test="${not empty keyword }">selectQna.n?page=${currentPage + 1 }&keyword=${keyword }&option=${option }</c:if>
					
					"> [다음] </a>
				</c:if>
				<c:if test="${currentPage eq maxPage }">[다음]
</c:if>


			<c:if test="${currentPage lt maxPage }">
				<a class="atag" href="
				<c:if test="${empty keyword }">selectQna.n?page=${maxPage }</c:if>
				<c:if test="${not empty keyword }">selectQna.n?page=${maxPage }&keyword=${keyword }&option=${option }</c:if>
				"> [마지막]</a>
				</c:if>
				
				<c:if test="${currentPage eq maxPage }">
				[마지막]
				</c:if>
			</div>

<br><br>
	<div id = "search" align="center">
	
	
	<select id= "option">
	<option id = "option1" value="1" >전체</option>
	<option id = "option2" value="2">제목</option>
	<option id = "option3" value="3">내용</option>


	</select>
	
	
	<input id = "key" value="${keyword }" />
	
	<button style='background:white; width:50px;' onclick="search()">검색</button>
	</div>
	
</div>
		<div id="right" class="box">
			
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>

			
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div>
	<div id="spot1">
		<ul>
			<li><a href="mypage.b">MyPage</a></li>
			<li><a href="friendList.n">친구 목록 보기</a></li>
			<li><a href="mypagePoto.b?userid=${ memberUser.userId }">사진 보기</a></li>
			<li><a href="selectChannelList.l">채널</a></li>
			<li><a href="selectGroupList.y">그룹</a></li>
			<li><a href="newsfeed.b">뉴스피드</a></li>
			<li id="notice2">고객센터</li>
			<li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
			<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
			<li class="notice"><a href="selectQna.n">└QNA</a></li>
		</ul>
	</div>
	<div id="spot2">
		<ul>
			<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
			<li><a href="javascript:message();">메세지 보기</a></li>
			<li><a href="alertlist.j">알림 보기</a></li>
			<li><a href="javascript:logout()">로그 아웃</a></li>
		</ul>
		<hr style="width: 100px; margin: auto;">
		<br />
		<h4 align="center">친구 목록</h4>
		<br>
		<hr style="width: 100px; margin: auto;">
		<div id='friend'></div>

	</div>

	<div id="spot3">
		<c:import url="../common/top.jsp" charEncoding="UTF-8" />
	</div>
</body>
</html>