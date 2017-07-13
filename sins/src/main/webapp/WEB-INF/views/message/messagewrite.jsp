<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE WRITE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/sins/resources/js/message/messagewrite.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<style type="text/css">

#msgsenddiv {
	background-color : white;
	margin-left : 10px;
	padding : 10px;
	text-align : center;
}

#reciveid {
	width : 150px;
}

@media screen and (max-width:500px) {
	
	#msgsenddiv {
	margin-left : 5px;
	margin-right : 5px;
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
        <br/> <h2>&nbsp;&nbsp;&nbsp;메시지함</h2><br>
        <ul>
        	<li><a class = "atag" href="msgreadlist.j">받은 메세지</a></li>
        	<li><a class = "atag" href="msgbeforewrite.j">메시지 쓰기</a></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li><a class = "atag" href="msgspamlist.j">스팸 보관함</a></li>
          	<li><a class = "atag" href="msgspamuserlist.j">스팸 유저</a></li>
        </ul>
      </div>
      <div id="content">
        <div id="msgsenddiv">
        	<br/><h2>메시지 쓰기</h2><br>
        	<input type="hidden"id="alluser"value="${allmember }"/>
        	<form action="msgsead.j" enctype="multipart/form-data" method="post" name="sendform" onsubmit="return subsub(file)" accept-charset="UTF-8">
        		<input type="hidden" id="send_id" name="send_id" value="${loginUser.userId}">
        		
        		<input type="hidden" name="sendid" value="user01">
				<c:if test="${empty msgone.send_id}">
				<div class="areadiv">
				<label for="reciveid">받는 사람 :</label><input type="text" required="required" id="reciveid" name="receivie_id"/>&nbsp;&nbsp;&nbsp;&nbsp;<label class="keycnt" >0</label>/600글자<br/>
        		<textarea rows="10" cols="50" name="content" onkeyup="areakeyup()"></textarea><br/>
        		</div>
        		</c:if>
        		<c:if test="${not empty msgone.send_id}">
        		<label>답장</label>
        		<div class="areadiv">
        		<label for="reciveid">받는 사람 :</label><input type="text" required="required" id="reciveid" name="receivie_id" value="${msgone.send_id }"/><label class="keycnt" >0</label>/600글자<br/>
        		<textarea rows="10" cols="70" name="content" onkeyup="areakeyup()">RE : ${msgone.content }</textarea><br/>
        		</div>
        		</c:if>
				<input type="file" name="file">
				<input type="submit" id="msgsendbtn" value="쪽지보내기"/><br/><br/><br/>

        	</form>
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
			<li><a class = "atag" href="msgreadlist.j">받은 메세지</a></li>
        	<li><a class = "atag" href="msgbeforewrite.j">메시지 쓰기</a></li>
          	<li><a class = "atag" href="msgsendlist.j">보낸 메시지</a></li>
          	<li><a class = "atag" href="msgspamlist.j">스팸 보관함</a></li>
          	<li><a class = "atag" href="msgspamuserlist.j">스팸 유저</a></li>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="alink.do?path=common/newsfeed">뉴스피드</a></li>
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
	<hr style="width:100px; margin:auto;">
	<br/>
	<h4 align="center">친구 목록</h4><br>
	<hr style="width:100px; margin:auto;">
	<div id='friend'></div>
	
	</div>
	
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
  </body>
</html>