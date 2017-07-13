<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Channel List</title>
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
 	

});

	$(function() {
		$(".channelList").click(function() {
			var channel_no = $(this).children().first().val();
			var url = "selectChannelPage.l?channel_no=" + channel_no;
			$(location).attr('href', url);
		});
	});
</script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/channel/channelList.css" />
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
		<div id="content" class="box">
			<h2 id="pageName">채널리스트</h2>
			<c:forEach var="item" items="${channellist}">
			<c:if test ="${item.delete_yn eq N}"> 
				<div class="channelList" style="background-image:url('/sins/resources/file/${item.channel_user_id}/${item.channel_filepath}');background-size:230px 200px; "  >
					<input type="hidden" class="channelNo" value="${item.channel_no}" />
					<label class="channelName">${item.channel_name}</label>
					<div id="cover">
					<div class="category">${item.category1}</div>
					</div>
					</div>
			</c:if>
			</c:forEach>
		
		</div>
		
		<div id="right" class="box">
			<br>
			<div id="center">
				<h3>채널 개설</h3>
			
			<form id="insertChannel" action="insertChannel.l" method="post"
				enctype="multipart/form-data">
				
					<div id="side">
						<br/> <br/>
						<div class="channel_name">
							<input type="text" id="channel_name" name="channelName" size="18"
								maxlength="11" required placeholder="채널 이름">
							<button type="button" id="dupcheck" name="dupcheck"
								onclick="checkTitle()"></button>
							<br/><br/><hr/> <br/>
						</div>
						<div id="channel_info">
							<textarea class="channelInfo" rows="5" cols="25"
								name="channelInfo" id="channel_info" placeholder="채널 정보 입력"></textarea>
						</div>
						<br/><hr/> <br/>
						<div id="channel_filepath">
						<label>대표 이미지</label>
							<input type="file" name="file" id="channel_filepath">
						</div>
						<br/><hr/> <br/>
						<div id="category1">
							<select name="category1" id="category1">
								<option value="">카테고리 선택</option>
								<option value="여행">여행</option>
								<option value="책">책</option>
								<option value="뷰티">뷰티</option>
								<option value="패션">패션</option>
								<option value="스터디">스터디</option>
							</select>
						</div>
						<br/><hr/> <br/>
						<input type="hidden" value="${loginUser.userId }" name="channel_user_id"/>
						<textarea class="form-control" rows="5" cols="25"
							id="channel_keyword" name="channelKeyword" placeholder="태그 설정"></textarea>
					</div>
					<br/><hr/> <br/> <input type="submit" name="skins"
						class="btn btn-default2" id="makeGroup" onclick="return check()"
						value="채널생성" />
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" name="reset" class="btn btn-default3">선택
						취소</button>
					<br> <br>
			
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