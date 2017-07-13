<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mname = (String)request.getParameter("mname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style type="text/css">
body{
	width:1150px;
	background: rgb(250.250.250);
}
table#login {
      width : 250px;
   }
   button {
      width: 300px;
      height: 30px;
   }
   section { 
   	height: 50px;
   }
   section#space {
   	height: 200px;
   	width : 350px;
   }
   input{
     width: 300px;
     height: 40px;
     font-size:  16pt;
   }
   td {
   	height: 30px;
   }
   table#logint{
   width : 1150px;
   height: 300px;
   	vertical-align: middle;
 
   }
 
   table #first{
   border-bottom: 2px solid rgba(0,0,0,0.8);
   border-top:  2px solid rgba(0,0,0,0.8);
   }
   #footert{
   width : 1150px;
   height: 40px;
   border:1px solid rgba(250, 200, 200, 0.7);
   }
   #footerdiv td{
   	height: 15px;
   	 width : 300px;
   }
   .ftd1{
   		border: 2px solid red;
   }
   .lfa{
	display:block;
   	text-align: center;;
   }
 
</style>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('div#header').load('/bgm/common/view/header.jsp');
	$('footer').load('/bgm/common/view/footer.jsp');
	
	$('#findid').click(function () {
		window.open('/bgm/member/view/FindId.html','아이디찾기',"width=600,height=250, resizable=no,left=500,top=400");
	});
	$('#findpassword').click(function () {
		window.open('/bgm/member/view/findPassword.html','비밀번호 찾기',"width=600,height=250, resizable=no,left=500,top=400");
	});
});
function newmember() {
window.open('/bgm/member/view/newmember.jsp','회원가입');
}
function findId() {
window.open('/bgm/member/view/FindId.html','아이디찾기',"width=600,height=250, resizable=no,left=500,top=400");
}

</script>

</head>
<body>
<header>
<div id="header"></div>

</header>

<br>
<section>
</section>
<div id="body">
<table id="logint">
<tr><td id="first" align="center" style="width:625px">
		<form action="/bgm/login?mname=<%= mname %>" method="post">
		  	<table id="login">
	   			<tr><td colspan="2"><input type="text" name="userId" required autofocus="autofocus" placeholder="아이디"/></td></tr>
	 			<tr><td colspan="2"><input type="password" name="userPwd" required/ placeholder="비밀번호"></td></tr>
	 			<tr><td><td></tr>
	 			<tr><td colspan="2"><button submit="">로그인</button></td></tr>
	  		  	<tr ><td><a href="#" id="findid">아이디 찾기</a>&nbsp;</td><td align="right"><a href="#" ID="findpassword">비밀번호 찾기</a></td></tr>
			</table>
		</form>
	
	</td>
	<td align="center"><viedo controls autoplay name="media">
				<source src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201701/11064_301_1.mp4" type="video/mp4">
				<video controls="" autoplay="" name="media" width="620">
					<source src="http://caching.lottecinema.co.kr//Media/MovieFile/MovieMedia/201701/11064_301_1.mp4" type="video/mp4">
				</video></td></tr>
	
</table>
</div>
<br><br>
<section id="space">
<div id="footerdiv">

<table id="footert"> 
	<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
	<tr><td colspan="3" align="center">저희 홈페이지를 처음방문하셧나요 ? </td>
	<td class="ftd1"><a class="lfa" href="#" onclick="newmember()">회원가입 </a></td>
	<td class="ftd1"><a class="lfa" href="#" onclick="findId()">가입여부 확인</a> </td><td></td></tr>
	<tr><td></td><td></td><td></td><td></td><td></td><td></td></tr>
</table>
</div>
</section>

</body>
<footer>

</footer>
</html>