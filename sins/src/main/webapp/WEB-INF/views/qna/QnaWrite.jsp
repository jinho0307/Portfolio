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


$(document).ready(function(){
	
	
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

fileName = "";	


var oEditors = [];
$(function(){
	
	
	
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors,
	    elPlaceHolder: "textAreaContent",
	    sSkinURI: "<%=request.getContextPath()%>/resources/se2/SmartEditor2Skin.html",
	    fCreator: "createSEditor2"
	});
	
	
	
	
	
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
        	
	        <ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="newsfeed.b">뉴스피드</a></li>
	          <li id="notice1"><label class="notice1" style='cursor:pointer;'>고객센터</label></li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	        
	        </ul>
      	</div>
		<div id="content" class="box" >
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a> - 문의하기</strong><br><br>
		
		<div id="writeForm" >
			<form id="write_form" action="write.n" method="post">
			<input type="hidden" id="fileName" name="fileName" value=""/>
		
				
					
					
					제목 <input id="title" name="title" style='width:300px;' />
				
				<br><br>
						
		<textarea name="content" id="textAreaContent" style="width:100%; min-width:300px; display:none; overflow:auto;" ></textarea>
		
		
				<br>
				
				</form>
			
			
			<button id= "submitBtn" style='position:relative; float:right; width:100px; background:white;'>작성</button>



		</div>
		</div>
		<div id="right" class="box">
		
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

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