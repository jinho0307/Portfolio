<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>공지사항</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/jindo.min.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/notice/noticeModify.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script>
	
	
	
	
	
	var oEditors = [];
	$(function(){
	   
	   
	   nhn.husky.EZCreator.createInIFrame({
	       oAppRef: oEditors,
	       elPlaceHolder: "textAreaContent",
	       sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2SkinNoPhoto.html",
	       fCreator: "createSEditor2"
	   });
	   
	   
	   setTimeout(function(){
		   
		   
		   var tag= '${notice.content}';
			
		 
			oEditors.getById["textAreaContent"].exec("PASTE_HTML", [tag]);
	   }, 500);
	});

	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	$(document).on("click", "#modifySubmit", function() {
	    // 에디터의 내용이 textarea에 적용된다.
	    
	    
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	 
	    
	    $("#inputForm").submit();
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	  
	  
	});
	
</script>
<style type="text/css">
#noticeModifyTable{
	border-collapse : collapse;
	width : 100%;
	text-align: center;
	border-top : 3px solid;
	border-bottom : 3px solid;
}
#noticeModifyTable td{
	border-bottom : 1px solid;
}


#adminModifyBtn{
	width : 600px;
	text-align : right;
	margin-bottom : 10px;
}
#ftd {
	font-size : 16pt;
	font-weight : bold;
	background-color : #9581BF;
}
#std {
	text-align : left;
	font-size : 9pt;
	background-color : #E7E4F9;
}
#std label {
	text-align : center;
	padding-right : 5px;
	font-weight : bold;
}

#modifySubmit{
position:relative;
float:right;
margin-right:30px;
width:80px;
}
</style>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top">
		</div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			<h2>LEFT</h2>
			<ul>
				<li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
				<li><a href="alink.do?path=channelListView/channelList">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
				<li><h4>뉴스피드</h4></li>
				<li id="notice">고객센터</li>
				<li class="notice"><a href="selectNotice.k">└공지사항</a></li>
	          	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
			</ul>
		</div>
		
		<div id="content" class="box">
			<strong id="titleFont">공지사항</strong>
			<div id="noticeModifyDiv">
				<br />
				<hr />
				<br />
				<form id="inputForm" action="noticeModify.k" method="post">
				<table id="noticeModifyTable" style='text-align: center;'>
					<tr>
						<td id="ftd">
							<label id="title"> 제목 :  </label><input type="text" name="title" value="${notice.title}" />
						</td>	
					</tr>
					<tr>
						<td id="std" >
							<textarea id="textAreaContent" name="content"></textarea>
						</td>
					</tr>
					
					
				</table>
				<br>
				<hr />
				<br>
				<button id="modifySubmit">수정완료</button>
				</form>
				<br>
				<br>
				

			</div>
		</div>
		
		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div> 
	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"><%@include
			file="/WEB-INF/views/common/top.jsp"%></div>
	<div id="spot5"></div>
	</div>
</body>
</html>