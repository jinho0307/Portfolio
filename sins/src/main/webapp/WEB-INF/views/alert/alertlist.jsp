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
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript" src="/sins/resources/js/alert/alertlist.js"></script>
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

</script>
<style type="text/css">
.sendtr{
	cursor:pointer;
}
.content {
	width : auto;
}

#content {
	height : 100%;
}

.contents {	
	width : 500px;
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
		<div id="content" >
			<div class="content">
	        <h2>알림</h2>
	        <font name="alertajax">
	        	<input type="hidden" id="count" value="${count }"/>
	        	<input type="hidden" id="limit" value="${limit }">
	        </font>
	        <form name="alertdelet">
	        	<input type="hidden" id="user_id" name="user_id"/>
	        	<input type="hidden" id="classify" name="classify"/>
	        	<input type="hidden" id="content_no" name="content_no"/>
	        	<input type="hidden" id="userid" name="userid"/>
	        </form>
	        <div id="contentDiv">
				<hr>
			<c:if test="${not empty list }">
			<table id="alertTable">	
			<tbody>
			 <c:forEach var="alert" items="${list }">
			<tr class="sendtr" onclick="visit('${alert.send_id}','${alert.user_id }','${alert.classify }'
			,${alert.content_no })">
				<td class='alertid' style='width:20%'><img class='curs' src="${pageContext.request.contextPath}/resources/file/${alert.send_id}/${alert.filepath }" style='width: 80px; height: 80px;' /></td>
				<td class='contents' style='text-align:left; border:1px solid #E7E4F9;'><label class='curs'>${alert.classify }</label><br><label class="grayc">
				</label>
			</tr>
			</c:forEach> 
			</tbody>
			</table>	
	</c:if>
	
	<c:if test="${empty list }">
		<br><br><label class="font10pt" style='margin-left:170px;'>알람이 존재하지 않습니다.</label>
	</c:if>
			</div>
			<a href="#" onclick="appendalert()"></a>
			</div>
			</div>
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
    	<c:import url="/WEB-INF/views/common/footer.jsp" charEncoding="UTF-8" />
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