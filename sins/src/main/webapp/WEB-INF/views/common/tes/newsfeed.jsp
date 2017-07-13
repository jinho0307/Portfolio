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
<script type="text/javascript">
$( document ).ready(function() { 
    $('#t-l').click(function(){ 
     	$('#spot1, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot1, #overlay_t').hide(); 
	});
 	$('#t-r').click(function(){ 
     	$('#spot2, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot2, #overlay_t').hide(); 
	});
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice").click(function(){
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
        	<h2>LEFT</h2>
	        <ul>
	          <li><a href="alink.do?path=mypage/mypage">MyPage</a></li>
	          <li><a href="alink.do?path=channelListView/channelList">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><h4>뉴스피드</h4></li>
	          <li id="notice">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	          
	          <li><a href="brodcasting.j">채팅</a></li>
	        </ul>
      	</div>
		<div id="content" class="box">
	        <h2>Content</h2>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean nec mollis nulla. 
	        Phasellus lacinia tempus mauris eu laoreet. Proin gravida velit dictum dui consequat 
	        malesuada. Aenean et nibh eu purus scelerisque aliquet nec non justo. Aliquam vitae 
	        aliquet ipsum. Etiam condimentum varius purus ut ultricies. Mauris id odio pretium, 
	        sollicitudin sapien eget, adipiscing risus.</p>
	        
        	<a href="alink.do?path=message/messagemain">메시지 페이지</a>
		</div>
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
    	<c:import url="footer.jsp" charEncoding="UTF-8" />
  	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
	<div id="spot">
	<div id="spot3"></div>
	<div id="spot4"><c:import url="top.jsp" charEncoding="UTF-8" /></div>
	<div id="spot5"></div>
	</div>
</body>
</html>