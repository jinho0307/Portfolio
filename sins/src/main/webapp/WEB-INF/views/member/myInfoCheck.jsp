<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>

<!-- datepicker 사용하기위한 파일들 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link rel="stylesheet" type="text/css" href="/sins/resources/css/member/myInfoCheck.css" />
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

		
		$("#userPwd").keydown(function(key){
			if(key.keyCode == 13){
				$("#submit").click();
			}
		});		
		$("#submit").click(function(){
			var id = $("#userId").val();
			var pwd = $("#userPwd").val();
			$.ajax({
				url : 'userCheck.k?userId='+id + "&userPwd="+pwd,
				type : "post",
	            success : function(data){
					if(data == 1){
						location.href = "alink.do?path=member/myInfo";
					}
					else{
						$("#userPwd").css("border", "2px solid red");
					}
				}
			})
		});
	});
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
	          <li id="notice1">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
			</ul>
		</div>
		<div id="content" class="box">
			<div id="myInfodiv">
				<table	id="myInfoTable">
					<tr><td colspan="2" id="tftd"><h1 id="title">내 정보</h1></td></tr>
					<tr><td id="std1" class="ftd"><label>아이디</label></td><td  id="std2"class="std"><input type="text" id="userId" name="userId" size="25" value="${loginUser.userId}" maxlength="25" class="t" readonly/></td></tr>
					<tr><td id="ltd1" class="ftd"><label>비밀번호</label></td><td id="ltd2" class="std"><input type="password" id="userPwd" name="userPwd" size="25"  maxlength="25" class="t"/></td></tr>
					<tr><td colspan="2"><input type="button" id="submit" class="btn" value="정보보기"/><input type="button" id="button" class="btn"  value="취소하기" /></td></tr>
				</table>
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