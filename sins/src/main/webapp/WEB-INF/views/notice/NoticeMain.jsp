<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/notice.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">

<script type="text/javascript">
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

		$(".answerTr").hide();

		var nowIndex = -1;

		$(".questionTr").click(function() {
			var index = $(this).index();
			if (nowIndex < 0 && nowIndex != index) {
				$(this).next($(".answerTr")).slideDown("slow");
				nowIndex = index;
			} else if (nowIndex >= 0 && nowIndex == index) {
				$(this).next($(".answerTr")).slideUp("slow");
				nowIndex = -1;
			} else if (nowIndex >= 0 && nowIndex != index) {
				$(".answerTr").slideUp("slow");
				$(this).next($(".answerTr")).slideDown("slow");
				nowIndex = index;
			}


		});
		
	
	});
	
	function writeBtn(){
		location.href = "alink.do?path=notice/NoticeNew";
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
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	         
			</ul>
		</div>
		<div id="content" class="box">
			<strong id="titleFont">공지사항</strong>
			<div id="noticeDiv">
				<br />
				<hr />
				<br />
				
				<c:if test="${loginUser.userId eq 'admin'}">
					<div id="adminWriteBtn">
						<button onclick="writeBtn()">글쓰기</button>
					</div>
				</c:if>
				<table id="noticeTable" style='text-align: center;'>
					<tr>
						<th class="noticeNo">글번호</th>
						<th class="title">제목</th>
						<th class="admin">작성자</th>
						<th class="writeDate">작성 날짜</th>
						<th class="readCount">조회수</th>
					</tr>
					<c:forEach var="notice" items="${list}">
						<tr>
							<td class="noticeNo">${notice.noticeNo}</td>
							<td class="title"><a href="noticeDetail.k?noticeNo=${notice.noticeNo }" class="titleA">${notice.title}</a></td>
							<td class="admin">관리자</td>
							<td class="writeDate">${notice.writeDate}</td>
							<td class="readCount">${notice.readCount}</td>
						</tr>
					</c:forEach>
				</table>
				<br> <br>

				<div id="pageSection" align="center">
					<c:if test="${currentPage eq 1}">[처음]</c:if>
					<c:if test="${currentPage gt 1}"><a class="atag" href="selectNotice.k?page=1">[처음]</a></c:if>
					<c:if test="${currentPage eq 1 }">[이전]</c:if>
					<c:if test="${currentPage gt 1 }"><a href="selectNotice.k?page=${currentPage - 1}">[이전]</a></c:if>

					<c:forEach var="num" begin="${startPage}" end="${endPage}" step="1">
						<c:if test="${num eq currentPage }">
							<strong><b>${num}</b></strong>&nbsp;
						</c:if>
						<c:if test="${num ne currentPage }">
							<a class="atag" href="selectNotice.k?page=${num}">${num}</a> &nbsp;
						</c:if>
					</c:forEach>

					<c:if test="${currentPage lt maxPage }"><a class="atag"href="selectNotice.k?page=${currentPage + 1 }">[다음]</a></c:if>
					<c:if test="${currentPage eq maxPage }">[다음]</c:if>
					
					<c:if test="${currentPage lt maxPage}"><a class="atag" href="selectNotice.k?page=${maxPage }">[마지막]</a></c:if>
					<c:if test="${currentPage eq maxPage}">[마지막]</c:if>
				</div>
			</div>

		</div>
		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp"%>
		</div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
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