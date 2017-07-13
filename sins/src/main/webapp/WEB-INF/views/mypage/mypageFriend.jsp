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
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/mypage/mypage-common.css" />
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

			<br/>
			<h2>Mypage</h2>
			<br/>
			<c:if test="${memberUser.userProfile != null}">
				<img src="${memberUser.userProfile}"
					style="width: 160px; height: 160px;">
			</c:if>
			<c:if test="${memberUser.userProfile eq null}">
				<img src="/sins/resources/images/missingNO.jpg"
					style="width: 160px; height: 160px;">
			</c:if>

			<h3>${ memberUser.userName }님</h3>
			<br> ${ memberUser.phone }<br>
			<ul>
				<li><a href="mypage.b">MyPage</a></li>
				<li><a href="friendList.n">친구 목록 보기</a></li>
				<li><a href="mypagePoto.b">사진 보기</a></li>
				<li><a href="alink.do?path=member/myInfo">내정보 보기</a></li>
			</ul>

		</div>
      <div id="content">
       <div class="content1">
        <input id="serch" type="text" name="serch" placeholder="친구검색하기"/><button>검색하기</button></div>
        <br>
      <div class="content2">
        <h2>Friend</h2>
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        
        <table class="tablef">
        <tr><td>
        <img src="" style="width:100px; height:100px;">
        </td><td><h3>${ loginUser.userName } 님</h3></td>
        <td>
        <img src="" style="width:100px; height:100px;">
        <td><td><h3>${ loginUser.userName } 님</h3></td></tr>
        </table>
        </div>
        <br>
        
       
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
			<li><a href="alink.do?path=mypage/mypageFriend">친구 목록 보기</a></li>
			<li><a href="mypagePoto.b">사진 보기</a></li>
			<li><a href="selectChannelList.l">채널</a></li>
			<li><a href="selectGroupList.y">그룹</a></li>
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