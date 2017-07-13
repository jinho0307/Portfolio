<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/common/newsfeed-common.css" />

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
	});
	
	$(function(){
		$(".disagreeBtn").click(function(){
			var userId = $(this).siblings().prop('type', 'hidden');
		
			
		});
	});
	
	function resultMember(userId, result){
		var groupNo = ${group.groupNo};
		var url;
		
		if(result == 'agree')
		 	url = "agreeGroupMember.y?userId=" + userId + "&groupNo=" + groupNo;
		else
			url = "disagreeGroupMember.y?userId=" + userId + "&groupNo=" + groupNo;
			
		location.href = url;
	};
	
	function deleteGroupMember() {
		var groupNo = ${group.groupNo};
		var userId = "${loginUser.userId}";
		var url = 'deleteGroupMember.y?groupNo=' + groupNo + "&userId=" + userId;
		
		location.href = url;
	}
	
</script>
<style>
	
	#content {
		margin-left : 5px;
	}
	#pageName {
		width: 100%;
		background-color: white;
		margin-bottom: 10px;
	}
	#requestContainer {
		width: 100%;
		background-color: white;
		margin-bottom: 10px;
	}
	#adminContainer {
		width: 100%;
		background-color: white;
		margin-bottom: 10px;
	}
	
	#memberContainer {
		width: 100%;
		background-color: white;
		margin-bottom: 10px;
	}
	
	.memberbtn {
		float: right;
		margin: 5px;
	}
	
	/* ---------------------------------------------------- */
	#groupexit {
		float: right;
		margin: 5px;
	}
	
	.userprofile {
		width: 40px;
		height: 40px;
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
				<li><a href="selectGroup.y?groupNo=${group.groupNo}">그룹 메인</a></li>
				<li><a href="selectGroupList.y">그룹 리스트</a></li>
				<li><a href="selectGroupList.y">그룹생성</a></li>
				<li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
	          	<li id="notice2">고객센터</li>
	          	<li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          <li><a href="brodcasting.j">채팅</a></li>
			</ul>
		</div>
		<div id="content">
			<h2 id="pageName">그룹 멤버<input type="button" id="groupexit" value="그룹 탈퇴" onclick="deleteGroupMember();"/></h2>
				
				<c:if test="${member.grade <= 1}">
					<div id="requestContainer">
						<h4>가입 요청한 회원</h4>
						
							<c:forEach var="item" items="${list}">
								<c:if test="${item.groupAccept == 'N'}">
									<table>
										<tr>
											<td><img class="userprofile" src="/sins/resources/file/${item.userId}/${item.userProfile}"/></td>
											<td>${item.userName}</td>
											<td><input type="button" class="agreeBtn" onclick="resultMember('${item.userId}', 'agree');" value="수락"/></td>
											<td><input type="button" class="disagreeBtn" onclick="resultMember('${item.userId}', 'disagree');" value="거절"/></td>
										</tr>
									</table>
								</c:if>
							</c:forEach>
						
					</div>
				</c:if>
			
			<div id="adminContainer">
				<h4>운영진</h4>
					<c:forEach var="item" items="${list}">
						<c:if test="${item.grade <= 1}">
							<table class="memberTable">
								<tr>
									<td><img class="userprofile" src="/sins/resources/file/${item.userId}/${item.userProfile}"/></td>
									<td>${item.userName}</td>
								</tr>
							</table>
						</c:if>
					</c:forEach>
			</div>
			
			<div id="memberContainer">
				<h4>회원</h4>
				
					<c:forEach var="item" items="${list}">
						<c:if test="${item.grade == 2 && item.groupAccept == 'Y'}">
							<table class="">
								<tr>
									<td><img class="userprofile" src="/sins/resources/file/${item.userId}/${item.userProfile}"/></td>
									<td>${item.userName}</td>
								</tr>
							</table>
							
						</c:if>
					</c:forEach>
				
			</div>
		</div>
		<div id="right" class="box">
    		<%@include file="/WEB-INF/views/friend/friendView.jsp" %> </div>
   	</div>
 	<div id="footer">
    	<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
  	</div>
	<div id="spot1">
		<ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroup.y?groupNo=${group.groupNo}">그룹 메인</a></li>
			  <li><a href="selectGroupList.y">그룹 리스트</a></li>
			  <li><a href="selectGroupList.y">그룹생성</a></li>
	          <li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
	          <li id="notice2">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	    </ul>
	</div>
	<div id="spot2">
		<ul>
		<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
		<li><a href="javascript:message();">메세지 보기</a></li>
		<li><a href="javascript:alertover()">알림 보기</a></li>
		<li><a href="javascript:logout()">로그 아웃</a></li>
	</ul>
	<hr style="width:100px; margin:auto;">
	<br/>
	<h4 align="center">친구 목록</h4><br>
	<hr style="width:100px; margin:auto;">
	<div id='friend'></div>
	
	</div>
	
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>