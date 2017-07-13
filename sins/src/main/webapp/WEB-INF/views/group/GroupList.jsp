<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/group/groupList.css" />
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


	
	$(function(){
		$(".groupList").click(function(){
			var groupNo = $(this).children().first().val();
			var url = "selectGroup.y?groupNo="+groupNo;		
			$(location).prop('href', url);
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
	          <li id="notice2">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	         
	    </ul>
		</div>
		<div id="content" class="box">
			<h2 id="pageName">그룹리스트</h2>
			<c:forEach var="item" items="${list}">
				<div class="groupList" style="background-image: url('/sins/resources/file/${item.userId}/${item.filepath};background-size:230px 200px;repeat: none')">
					<input type="hidden" class="groupNo" value="${item.groupNo}"/>
					<label class="groupName">${item.groupName}</label>
					<div id="cover">
					<div class="memberCount">${item.memberCount} 명</div>
					<div class="category">${item.category1}</div>
					</div>
				</div>
				
			</c:forEach>
		</div>
		<div id="right" class="box">
			<br/>
        	<div id="center">
        	<h3>그룹 개설</h3>
			<form id="createGroup" action="insertGroup.y" method="post" enctype="multipart/form-data">
            	<input type="hidden" name="userId" value="${loginUser.userId}"/>
            	<table id="createTable">
            		
            		<tr><td><input type="text" id="groupName" name="groupName" size="25" 
            					maxlength="11" required placeholder="그룹 이름"></td></tr>
            		
            		<tr><td><textarea id="groupInfo" rows="5" cols="25" 
            					name="groupInfo" placeholder="그룹 정보 입력" style="resize:none"></textarea></td></tr>
            		
            		<tr><td><label>대표 이미지</label>
            				<input type="file" id="filepath" name="file"></td></tr>

            		<tr><td>
            				<label>카테고리</label><br/>
	            			<select id="selectCategory" name="category1">
								<option value="">선택</option>
								<option value="여행">여행</option>
								<option value="책">책</option>
								<option value="뷰티">뷰티</option>
								<option value="패션">패션</option>
								<option value="스터디">스터디</option>						
							</select>
					</td></tr>
            	
            		<tr><td><button type="submit" id="makeGroup" class="create">그룹 생성</button></td></tr>
            	
            	</table>
			</form>
			</div>
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
	<hr style="width:100px; margin:auto;">
	<br/>
	<%@include file="/WEB-INF/views/friend/friendView.jsp" %> 
	
	</div>
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>