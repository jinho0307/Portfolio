<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE DETAIL</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="/sins/resources/js/message/messagedatail.js"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<style type="text/css">

	#msgsenddiv {
	text-align : center;
	}

@media screen and (max-width:500px) {
	
	
	.content {
		padding : 5px;
		float: none;
		width: auto;
		margin: auto 5px 10px 10px;
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
      <div class="content">
        <div id="msgsenddiv">
        	<h2>메시지 자세히보기</h2><br>
        	 <c:if test="${loginUser.userId eq msgone.receivie_id}">
        	
        	 <form name="message_no">
        	 <input type="hidden" name="check_no" value="${msgone.message_no}">
   	 		</form>
   	 		</c:if>
   	 		<c:if test="${loginUser.userId ne msgone.receivie_id}">
   	 		 <input type="button" value="삭제" onclick="senddel()"/>
        	 <form name="message_no">
        	 <input type="hidden" name="check_no" value="${msgone.message_no}">
   	 		</form>
   	 		</c:if>
        		<input type="hidden" id="send_id" name="send_id" value="${loginUser.userId}">
        		
				<label>보낸 사람:</label><label>${msgone.send_id }</label><br/>
        		<textarea rows="10" cols="50" readonly="readonly" name="content" style="resize:none;">${msgone.content }</textarea><br/>
        		
        		<c:if test="${not empty msgone.filepath}">
        		<c:forTokens var="pic" items="jpg,jpeg,bmp,png,gif" delims=",">
   				<c:if test="${fn:split(msgone.filepath,'.')[1] eq pic}">
				<img src="${pageContext.request.contextPath}/resources/file/${msgone.send_id}/${msgone.filepath}" />
				</c:if>
        		</c:forTokens>
        		
   				<c:if test="${fn:split(msgone.filepath,'.')[1] eq 'mp4'}">
				<video width="320" height="240" controls>
  				<source src="${pageContext.request.contextPath}/resources/file/${msgone.send_id}/${msgone.filepath}" type="video/mp4">
  				</video>
				</c:if>
        		
        		<a href="download.p?userId=${msgone.send_id}&fileName=${msgone.filepath}">${fn:split(msgone.filepath,'=')[1]}</a>
        		</c:if>
        		<c:if test="${empty msgone.filepath}">
        		첨부파일 없음
        		</c:if>
        		<br/>
        		
        		 <input type="button" value="답장" onclick="reference()"/>
        		 <input type="button" value="삭제" onclick="recivedel()"/>
        		 <br/>
        		 
        </div>
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