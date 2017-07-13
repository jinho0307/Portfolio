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
	 
 	
 	//영구 정지 버튼 클릭시
 	$(document).on("click", ".stop", function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().children(".userId").text();
 		$.ajax({
 			url : "banTimePlus.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().prev().children().text("정지 시간 : 영정");
 					th.prop("disabled", "disabled");
 					th.next().removeAttr("disabled");
 				}
 				else {
 					alert("실패");
 				}
 			}
 		})
 	});
 	
 	//영구 정지 취소 버튼 클릭시
 	$(document).on("click", ".cancle", function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().children(".userId").text();
 		$.ajax({
 			url : "banTimeMinus.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().prev().children().text("정지 시간 : 없음");
 					th.prop("disabled", "disabled");
 					th.prev().removeAttr("disabled");
 				}
 				else {
 					alert("실패");
 				}
 			}
 		})
 	});
 	
 	$(".comOut").click(function(){
 		var th = $(this);
 		var userId = th.parent().prev().prev().prev().children(".userId").text();
 		
 		$.ajax({
 			url : "memberDelete.k?userId="+userId,
 			type : "post",
 			success : function(data){
 				if(data == 1){
 					th.parent().parent().remove();
 				}
 			}	
 		})
 	});
 	

 	
});
</script>
<style type="text/css">
	.profile {
		width : 50px;
		height : 50px;
	}
	.idAndName{
		width : 240px;
	}
	.time {
		width : 117px;
	}
	.btn {
		width : 60px;
	}
	.imgmy {
		width : 50px;
		height : 50px;
	}
	.userId {
		margin-left : 10px;
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
	          
	          <li id="notice2">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          
	        </ul>
      	</div>
		<div id="content" class="box">
	        <table id="memberTable">
	        	<c:forEach var="member" items="${allMember }">
	        		<tr >
	        			<td class="profile">
				        	<img class="imgmy" src="/sins/resources/file/${member.userId }/${member.userProfile}" />
	        			</td>
	        			<td class="idAndName">
	        				<label class="userId">${member.userId }</label>&nbsp;<label class="userName">${member.userName }</label>
	        			</td>
	        			<td class="time">
	        				<label class="banTime">정지 시간 : ${member.banTime }</label>
	        			</td>
	        			<td class="plusTime">
	        				<c:set var="mo" value="없음"/>
	        				<c:if test="${member.banTime eq mo }">
	        					<input type="button" value="영정" class="stop"/>&nbsp; <input type="button" value="취소" class="cancle" disabled/>
	        				</c:if> 
	        				<c:if test="${member.banTime ne mo }">
	        					<input type="button" value="영정" class="stop"/>&nbsp; <input type="button" value="취소" class="cancle" />
	        				</c:if>
	        			</td>
	        			<td class="btn">
	        				<input type="button" value="탈퇴" class="comOut" />
	        			</td>
	        		</tr>
	        		
	        	</c:forEach>
	        </table>
	        
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