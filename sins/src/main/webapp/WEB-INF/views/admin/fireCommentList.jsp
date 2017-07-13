<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/admin/adminPage.css" />
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript">
$( document ).ready(function() { 
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
 	
 	
 	$('#content').css('height', $(window).height() -80);
	$(window).resize(function() {
		$('#content').css('height', $(window).height() -80);
		
	});
 	
 	$("#fireContentList").click(function(){
 		location.href = "fireList.k";
 	});
	

 	$(document).on("click", ".deleteBtn", function(){
 		var classify = $(this).next().val();
 		var writeNo = $(this).next().next().val();
 		var commentNo = $(this).next().next().next().val();
 		
 		var th = $(this).parent().parent();
 		
 		$.ajax({
 			url : "commentDelete.k",
 			type : "post",
 			data : { "classify" : classify, "writeNo" : writeNo, "commentNo" : commentNo },
 			success : function(result){
 				th.text("");
 				th.prev().text("");
 				th.prev().prev().text("");
 				th.prev().prev().prev().text("");
 			}
 		})
 		
 	});
 	
});
</script>
<style type="text/css">
	#content {
		text-align : center;
	}
	.tap {
		font-size : 14pt;
		font-weight : bold;
		width : 120px;
		display : block;
		float : left;
	}
	#fireContentList {
		margin-left : 180px;
		border-right : 1px solid gray;
	}
	#fireContent {
		width : 600px;
	}
	#fireCommentList {
		background-color : #9581BF;
	}
	.imgmy {
		width : 50px;
		height : 50px;
	}
	
	#writerChannel {
		width : 100%;
	}
	.writerChannel {
		width : 60%;
		margin : auto;
	}
	.img{
		width : 50px;
		height : 50px;
	}
	.userid {
		text-align : left;
	}
	.writedate {
		text-align : left;
	}
	.content {
		text-align : left;
	}
	.btn {
		text-align : right;
	}
	.writeList{
		overflow : hidden;
	}
	
	@media screen and (max-width:500px) {
	#top {
		margin: auto;
		both: clear;
		width: 65%;
	}
	#t-l {
		display: block;
	}
	#t-r {
		display: block;
	}
	#container {
		width: auto;
	}
	#left {
		display: none;
		float: none;
		width: auto;
	}
	#content {
		overflow:auto;
		float: none;
		width: auto;
		margin: auto 5px 10px 10px;
	}
	#right {
		display: none;
		float: none;
		width: auto;
	}
	
	
	.profile {
		width : 30px;
	}
	.idAndName{
		width : 205px;
	}
	.time {
		width : 40px;
	}
	.plusTime {
		width : 10px;
	}
	.btn {
		width : 10px;
	}
	.imgmy {
		width : 30px;
		height : 30px;
	}
	.userId {
		margin-left : 10px;
	}
	.writerChannel{
		width : 100%;
		margin : auto;
	}
	.tab {
		width : 100px;
	}
	
	#fireContentList{
		margin-left: 60px;
	}
	
	#fireContent{
		width : 100%;
		margin : auto;
	}
	
	
	
}

	
</style>
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
	          <li><a href="alink.do?path=admin/adminPage">회원 관리</a></li>
	          <li><a href="#">채널 관리</a></li>
	          <li><a href="#">그룹 관리</a></li>
	          <li><a href="fireList.k">신고 관리</a></li>
	          
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	        </ul>
      	</div>
		<div id="content" class="box">
		<br/>
	       	<label class="tap" id="fireContentList">게시물 신고</label><label class="tap" id="fireCommentList">댓글 신고</label>
	       	<br/>
	       	<br/>
	       	<br/>
	       	<div id="fireContent">
	       		<div class="writeList" class="box">
					<table class="writerChannel">
						<c:if test="${ not empty channel }">
				       		<c:forEach var="item" items="${channel}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.user_id eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.user_id}</td>
								</tr>
								<tr>
									<td class="writedate">${item.comment_date}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.chan_article_content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="chan_article_no" value="${item.chan_article_no }" />
										<input type="hidden" name="comment_no" value="${item.comment_no }" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not empty group }">
								<c:forEach var="item" items="${group}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.userId eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.userId}</td>
								</tr>
								<tr>
									<td class="writedate">${item.commentDate}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="writeNo" value="${item.writeNo }" />
										<input type="hidden" name="commentNo" value="${item.commentNo }" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
						<c:if test="${not empty mypage }">
								<c:forEach var="item" items="${mypage}">
								<tr class="writerInfoTr">
									<c:set var="check" value="0" />
									<c:forEach var="profile" items="${member }">
										<c:if test="${item.userid eq profile.userId && check eq 0 }">
											<td rowspan="2" class="img"><img class="imgmy" src="/sins/resources/file/${profile.userId }/${profile.userProfile}" /></td>
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<td class="userid">${item.userid}</td>
								</tr>
								<tr>
									<td class="writedate">${item.commentdate}</td>
								</tr>
								<tr>
									<td colspan="2" class="content">
									 	${item.content}
									</td>
								</tr>
								<tr>
									<td colspan="2" class="btn">
										<button class="deleteBtn">삭제하기</button>
										<input type="hidden" name="classify" value="${item.classify }"/>
										<input type="hidden" name="contentno" value="${item.contentno }" />
										<input type="hidden" name="commentno" value="${item.commentno }" />
									</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>
				</div>
	       	</div>
		</div>
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
    	<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
  	</div>
	<div id="spot1">
		<ul>
	          <li><a href="alink.do?path=admin/adminPage">회원 관리</a></li>
	          <li><a href="#">채널 관리</a></li>
	          <li><a href="#">그룹 관리</a></li>
	          <li><a href="fireList.k">신고 관리</a></li>
	          
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