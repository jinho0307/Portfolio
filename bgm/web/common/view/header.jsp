<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script type="text/javascript">
function delmember() {
	$('#dialog').dialog({
		autoOpen: false,
		resizable: false,
		title : "정말 탈퇴하시겟습니까?",
		buttons: [
			{
				text: "OK",
				click: function() {
					<%if(loginUser != null){ %>
					location.href="/bgm/delmember?userid=<%=loginUser.getUserId()%>";
					<%}%>
					$(this).dialog("close");
				}
			},
			{
				text: "Cancel",
				click: function() {
					
					$(this).dialog("close");
				}
			}
		]
	});
	$('#dialog').dialog('open');
}
</script>
<style type="text/css">
#dialog{
	width : 1150px;
	height: 50px;
	display: none;
}
body{
	width:1150px;	
	margin-left: auto;
	margin-right: auto;
		
}
	 a {
		text-decoration: none;
	}
	input{
		border: 1px solid rgb(222,222,222,0.5);
	}
	

	
	/* 일반적인 버튼의 상황 */
button,input[type=button],
button:link,input[type=button]:link
button:visited,input[type=button],input[type=submit] {
	color: #666;
	border: 1px solid #ebebeb;
	border-bottom-color: #c6c6c6;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
	background: #fff;
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );/*IE*/
}
 
/* 마우스오버 */
button:focus,input[type=button]:focus,input[type=submit]:focus,
button:hover,input[type=button]:hover,input[type=submit]:hover {
	background: #f4f4f4;
	background: linear-gradient(to bottom, #fafafa 0%, #fff 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fafafa', endColorstr='#ffffff', GradientType=0 );/*IE*/
}
 
/* 눌려졌거나 선택 된 상황 */
button:active, input[type=button]:active, input[type=submit]:active{
	text-shadow: 0 1px 0px #fff;
	border-color: #ebebeb;
	border-top-color: #ddd;
	background: #f4f4f4;
	box-shadow: none
}

.navi {
   list-style-type: none;
   height: 40px;
   padding: 0;
   width: 800px;
   margin: auto;
}

.navi li {
   float: left;
   position: relative;
   padding: 0;
   margin: auto;
   width:200px;
   line-height: 30px;
   
}

.navi li a {
   display: block;
   font-family: "굴림";
   font-weight: 600;
   font-size: 14px;
   padding: 5px 25px;
   color: black;
   text-decoration: none;
}

.navi li a:hover {
   color: #F90;
}

.navi li ul {
   opacity: 0;
   position: absolute;
   left: 0;
   width: 180px;
   background: #D8AFAF;
   list-style-type: none;
   padding: 0;
   margin: 0;
}

.navi li:hover ul {
   opacity: 1;
}

.navi li ul li {
   float: none;
   position: static;
   height: 0;
   line-height: 0;
   background: none;
}

.navi li:hover ul li {
   height: 30px;
   line-height: 30px;
   padding: 5px 0;
}

.navi li ul li a {
   background: #D8AFAF;
   font-family: "굴림";
   font-weight: 600;
   font-size: 14px;
   color: #900;
}

.navi li ul li a:hover {
   background: #900;
}





div#top {
   width: 1150px;
   margin: auto;   
}

.navisub {
   list-style-type: none;
   width: 450px;
   height: 20px;
   padding: 0;
   margin: 0;
   
}

.navisub li {
   margin-right: 20px;
   float: right;
   position: relative;
   padding: 0;
   font-size: 9pt;
   
}

.navisub li a {
   position: relative;
   text-decoration: none;
}

div#mainmenu {
   
   width: 1150px;
   padding: auto;
   margin: 0 auto;
   color: black;
   border-bottom: 4px solid rgb(200, 56, 45);
   /* border-bottom: 4px solid rgb(0,0,80); */
}

hr {
	width : 1150px;
	border: 1px solid rgba(173, 116, 96, 0.3);
}
#title{
color:rgb(200, 56, 45);
}

</style>
</head>
<body>

<div id="top" align="right">
	<ul class="navisub">
	<%if(loginUser != null){ %> 
		<%if(loginUser.getManager() ==0 ){ %>
		<li><a href="/bgm/chistory?userid=<%= loginUser.getUserId()%>">사용내역</a></li>
		<li><a href="/bgm/pay/view/payment.jsp">충전</a></li>
		<li><label><%=loginUser.getTotalCash() %>원</label></li>
		<li><a href="/bgm/sslement">관리자페이지</a></li>
		<li><a href="#" onclick="javaxcript:window.open('/bgm/sone?userid=<%= loginUser.getUserId() %>','내 정보 수정','width=900px, height=870px,channelmode=yes');">내정보 수정</a></li>
		<li><a href="/bgm/logout">로그아웃</a></li>
		<%}else{ %>
		<li><a href="#" onclick="delmember()">회원 탈퇴</a>
		<li><a href="/bgm/pay/view/payment.jsp">충전</a></li>
		<li><label><%=loginUser.getTotalCash() %>원</label></li>
		<li><a href="#" onclick="javaxcript:window.open('/bgm/sone?userid=<%= loginUser.getUserId() %>','내 정보 수정','width=900px, height=870px,channelmode=yes');">내정보 수정</a></li>
		<li><a href="/bgm/logout">로그아웃</a></li>
		<%} %>
	<%}else{%>
		<li><a href="#" onclick="javaxcript:window.open('/bgm/member/view/terms.html','회원정보 수정','width=900px, height=870px,channelmode=yes');">회원가입</a>
		<li><a href="/bgm/member/view/login.jsp">로그인</a>
	<%} %>
	</ul>
</div>
<br>
<hr>
<div align="center"> 
	<h1><a href="/bgm/index.jsp" id = title>BGS.COM</a></h1>
</div>
<hr>
<div id="mainmenu" align="center">
<section>
<ul class="navi">
	<li ><a href="/bgm/newscontroll" class = "news"> news </a></li>
	<li><a href="/bgm/movieMap" class = "movie"> 영화</a>
		

	</li>
	<li><a href="/bgm/rsv" class="reserve"> 예매</a>


	</li>
	<li><a href="/bgm/nlist" class="notice"> 고객센터</a>
        

    </li>
   </ul>
  </section>
</div>
<div id="dialog"></div>
</body>
</html>