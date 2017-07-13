<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">


</head>

<script>

fileName = "";	


var oEditors = [];
$(function(){
	
	
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "textAreaContent",
	    sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	
	setTimeout(function(){
		loading();	
	},500);
	
	
});


$(document).on("click", "#submitBtn", function(){
	oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#fileName").attr("value", fileName);
	
	
	if($("#title").val().length>0)
	 	$("#write_form").submit();
	else{
		alert("제목을 입력해주세요.")
	}
	
});
 


function pasteHTML(filepath){
	var tag="<img src='${pageContext.request.contextPath}/temp/"+filepath+"' style='width:300px; height:300px;'>";
	
	fileName+=filepath+" ";
	
	oEditors.getById["textAreaContent"].exec("PASTE_HTML", [tag]);
}


function loading(){
	
	var tag= '${qna.content}';
		
		
		
	oEditors.getById["textAreaContent"].exec("PASTE_HTML", [tag]);
}


</script>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"></div>
		<div id="t-r"></div>
	</div>
	<div id="container" >
		<div id="left" class="box">
        	<h2>LEFT</h2>
	        <ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="newsfeed.b">뉴스피드</a></li>
	          <li id="notice"><label class="notice1" style='cursor:pointer;'>고객센터</label></li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><h4>└QNA</h4></li>
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	        </ul>
      	</div>
		<div id="content" class="box" >
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a> - 문의하기</strong><br><br>
		
		<div id="writeForm" style='width:600px;'>
			<form id="write_form" action="updateQna.n" method="post">
			<input type="hidden" id="fileName" name="fileName" value=""/>
			<input type="hidden" name="qnaNo" value="${qna.qnaNo }"/>
			<input type="hidden" name="orignFileName" value="${qna.filepath }"/>
					
					
					제목 <input id="title" name="title" style='width:530px;' value='${qna.title }'/>
				
				<br><br>
						
		<textarea style="width: 100%" rows="10" name="content" id="textAreaContent" cols="80">
		</textarea>
		
				<br>
				
				</form>
			
			
			<button id= "submitBtn" style='position:relative; float:left; left:470px; width:100px; background:white;'>작성</button>



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