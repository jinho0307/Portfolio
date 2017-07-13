<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>MESSAGE SEND</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/sins/resources/js/message/messagesendlist.js"></script>   
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/newsfeed-common.css" />
<link rel="stylesheet" type="text/css" href="/sins/resources/css/message/messageread.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">

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
        <div id="listdiv">
        	<h2>보낸 메세지함</h2><br>
        	<form action="userpage">
        		<input type="hidden" id="userid"/>
        	</form>
        	<form name = "detailform">
        		<input type="hidden" id="msgno" name="msgno"/>
        	</form>
        	<input type="hidden" id="selectid" value="${select}"/>
        	<form id="seachform" name="seachform" action="msgsendlist.j">
        		<input type="button" value="삭제" onclick="send_del()"/>
        		<input type="hidden" name="loginid" value="${loginUser.userId }"/>
        		<input type="hidden" id="page" name="page" value="1"/>
        		<select id="select" name="select">
			    	<option value="id">아이디 </option>
		       		<option value="name">이름</option>
		       		<option value="cont">내용</option>
		    	</select>
		    	<input type="search" id="seach" name="seach" value="${seach}"/>
        		<input type="submit" value="찾기"/>
	        	<div id="pages">${currentPage } / ${maxPage } page</div>
        	</form>
        	<form name = "chkform">
				<input type="hidden" name="check_no"/>
        	</form>  
        	<table id="listtable" align="center">
	        	<tr><th id="chkth"><input type="checkbox" id="msgallchk"></th><th id="userth">받는사람</th><th id="contentth">내용</th><th id="dateth">보낸날자</th><th id="fileth">첨부파일</th><th id="readth">수신여부</th></tr>
	        	<c:forEach var="msg" items="${msgsendlist }">
	        		<tr><td><input type="checkbox" class="msgchkbox" name="msg_no" value="${msg.message_no}"></td>
		        	<td><a href="#" class="atagname" onmouseover="view('${msg.receivie_id}','${msg.profile }')" onclick="userpage($${msg.receivie_id}','${profile}')">${msg.user_name }</a></td>
		        	<td class="contents">
		        	<a href="#" onclick="msgdetail(${msg.message_no})">${msg.content}</a>
		        
		        	</td>
		        	<td>${msg.message_date }</td>
		        	<td><c:if test="${empty msg.filepath }"> 파일없음 </c:if>
		        	<c:if test="${not empty msg.filepath }">
		        	<img src="${pageContext.request.contextPath}/resources/images/file.png" width="20px"/>
		        	</c:if>
		        	</td>
		        	<td>${msg.read_check }
		        </tr>
	        	</c:forEach>
	        </table>      	
	        
	        <br>
	        <hr>
	        <div id="paging">
		        <a class = "atag"  onclick="pagefn(1)" href="#">[처음] </a> 
	
				<c:if test="${startPage gt 1 }">
					<a class = "atag"  onclick="pagefn(${startPage - 1 })" href="#">[이전] </a> 
				</c:if>
				<c:if test="${startPage eq 1 }">[이전] </c:if>
				
				<c:forEach var="num" begin="${startPage }" end="${endPage }" step="1">
					<c:if test="${num eq currentPage }">
						<strong><b>${num }</b></strong>&nbsp;
					</c:if>
					<c:if test="${num ne currentPage }">
						<a class = "atag"  onclick="pagefn(${num })" href="#">${num }</a> &nbsp;
					</c:if>
				</c:forEach>
				
				<c:if test="${endPage lt maxPage }">
					<a class = "atag"  onclick="pagefn(${endPage + 1 })" href="#"> [다음] </a>
				</c:if>
				<c:if test="${endPage eq maxPage }">
					[다음]
				</c:if>
				
				<a class = "atag" onclick="pagefn(${maxPage })" href=""> [마지막]</a>
			</div>
        </div>
        
        
      </div>
      </div>
      <div id="right" class="box">
    		<%@include file="/WEB-INF/views/friend/friendView.jsp" %> </div>
    </div>
  
     <div id="mouseover" style="position:absolute; display:none;">
    	<img alt="" id="proimg" src="" style="width: 50px; height: 50px; border: 1px solid black;">
    	<input type="hidden" id="propath" value="${pageContext.request.contextPath}/resources/file/">
   	<div id="mouseoverid">
    	<div id="movtext">유저 아이디 넣을 공간 div</div></div>
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