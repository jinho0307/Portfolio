<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML> 
<html>
<head>
<meta charset="UTF-8">
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/friend/friend-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<style>


#content {
	width: 600px;
	height: 660px;
	padding: 20px;
	margin-left: 20px;
	float: left;
	background-color: white;
	overflow: auto;
	
}
#spot3 {
	margin-left : 20%;
	width: 80%;
	position: absolute;
	top: 0;
	margin : 5px 10%;
	z-index: 101;
	float: left;
}


#container {
	width:1070px;
	height: 770px;
	margin: 0px auto;
	background-color: #E7E4F9;
}


#left{
width: 200px;
}

#FriendTable{
width:100%;
border-spacing:0px;
}
.friendTds{
padding-top:10px;
padding-bottom:10px;
border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;
text-align:left;

}

.nameLink{
color:#9581BF;
cursor:pointer;
}
.nameLink:hover{

text-decoration:underline;
}
.addBtn{
background:white;
outline:0;
border:0;
color:#9581BF;
}

@media screen and (max-width:500px) {
	
	#add{
		height : 100px;
	}
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
		height : 300px;
	}
	#left {
		display: none;
		float: none;
		width: auto;
	}
	#content {
		height : 600px;
		float: none;
		width: auto;
		margin: auto 10px 10px;
	}
	#right {
		display: none;
		float: none;
		width: auto;
	}
	
}


</style>

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
		<div id="left" class="box" >
		
			
			<%@include file="/WEB-INF/views/friend/friendFind.jsp" %>
			
		</div>
		<div id="content" class="box">



			<h3>친구 목록</h3>
			<br><br>
			<hr>
			<br>
			<c:if test="${not empty friendList }">
			
			<table id="FriendTable">
			<tbody>
			 <c:forEach var="member" items="${friendList }">
			
			<tr>
			<td class="friendTds" onclick="location.href='mypage2.b?userid=${member.userId}'" style='width:20%; padding-left:20px;'><img class="nameLink" src="${pageContext.request.contextPath}/resources/file/${member.userId}/${member.userProfile }" style='width: 80px; height: 80px;' /></td>
			<td class="friendTds" style='width:80%;'><label class="nameLink" onclick="location.href='mypage2.b?userid=${member.userId}'" > ${member.userName }</label>
			
			
			</td>
			
			
			</tr>
				
		
			</c:forEach> 
			</tbody>
			</table>
	</c:if>
	<c:if test="${empty friendList }">
		<br><br><label class="font10pt" style='margin-left:200px;'>친구가 없습니다</label>
	</c:if>
	
	

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