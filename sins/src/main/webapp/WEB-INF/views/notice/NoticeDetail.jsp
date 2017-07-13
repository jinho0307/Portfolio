<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/noticeDetail.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script>

$(document).ready(function() {
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
 	
});

	$(function(){
		if($("p").height() <= 500){
			$("p").css("height", "500px");
		}
	});
	
	
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
	}
	
	function deleteFn(noticeNo){
		if(confirm("삭제하시겠습니까?")==true)
			location.href="noticeDelete.k?noticeNo="+noticeNo;
	}
	
</script>

</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top">
		</div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
	
			<ul>
				<li><a href="mypage.b">MyPage</a></li>
				<li><a href="selectChannelList.l">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
				<li><a href="newsfeed.b">뉴스피드</a></li>
				<li id="notice1">고객센터</li>
				<li class="notice"><a href="selectNotice.k">└공지사항</a></li>
	          	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
			</ul>
		</div>
		
		<div id="content" class="box">
			<strong id="titleFont">공지사항</strong>
			<div id="noticeDetailDiv">
				<br />
				<hr />
				<br />
				<c:if test="${loginUser.userId eq 'admin'}">
					<div id="adminModifyBtn">
						<button id="delete" class='bbtn' onclick="deleteFn('${notice.noticeNo}');">삭제</button>
				<button id="bbbbbbtn" class='bbtn' onclick="location.href='noticeModify.k?noticeNo=${notice.noticeNo}'">수정</button>
					</div>
				</c:if>
				<table id="noticeDetailTable" style='text-align: center;'>
					<tr>
						<td id="ftd">
							<label id="title">${notice.title}</label>
						</td>	
					</tr>
					<tr>
						<td id="std" >
							작성자 : <label id="admin">관리자</label>
							조회수 : <label id="readCount">(${notice.readCount})</label>
							작성 날짜 :<label id="writeDate">${notice.writeDate}</label>
						</td>
					</tr>
					<tr><td id="ttd"><p id="contentP">${notice.content}</p></td></tr>
					
				</table>
				
				<br>
				<hr />
				
				

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
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>