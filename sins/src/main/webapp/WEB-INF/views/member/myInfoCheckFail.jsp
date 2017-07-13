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

<!-- datepicker 사용하기위한 파일들 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 

<link rel="stylesheet" type="text/css" href="/sins/resources/css/member/myInfoCheck.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
    
<script type="text/javascript">
var pwd = "";
	$( document ).ready(function() { 
		$("#userPwd").blur(function(){
			pwd = $(this).val();
		});
	});
	
	function check(){
		if(pwd != ""){
			return true;
		}
		else {
			return false;			
		}
	}
</script>
<style type="text/css">
	#myInfodiv {
		width : 400px;
		margin-left : 100px;
	}
	#myInfoTable {
		height : 200px;
		width : 400px;
		border-spacing : 0px;
	}
	.t {
		margin-left : 28.5px;
		height : 20px;
		font-size : 15px;
	}
	.ftd{
		width : 120px;
	}
	#title{
		text-align : center;
	}
	.ftd{
		background-color : #9581BF;
	}
	#userId {
		border : none;
	}
	#std1, #std2 {
		border-top : 1px double #9581BF;
	}
	#ltd1, #ltd2{
		border-bottom : 1px double #9581BF;
	}
	#myInfodiv {
		margin-top : 100px;
	}
	.btn {
		width : 60px;
		height : 25px;
	}
	#submit {
		margin-left : 130px;
	}
	#button{
		margin-left : 20px;
	}
</style>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div> 
		<div id="t-l"></div>
		<div id="top"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
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
			<li><a href="selectQna.n">고객센터</a></li>
			</ul>
		</div>
		<div id="content" class="box">
			<div id="myInfodiv">
				<form action="userCheck.k" method="post" onsubmit="return check()">
					<table	id="myInfoTable">
						<tr><td colspan="2" id="tftd"><h1 id="title">내 정보</h1></td></tr>
						<tr><td id="std1" class="ftd"><label>아이디</label></td><td  id="std2"class="std"><input type="text" id="userId" name="userId" size="25" value="${loginUser.userId}" maxlength="25" class="t" readonly/></td></tr>
						<tr><td id="ltd1" class="ftd"><label>비밀번호</label></td><td id="ltd2" class="std"><input type="text" id="userPwd" name="userPwd" size="25"  maxlength="25" class="t"/></td></tr>
						<tr><td colspan="2"><input type="submit" id="submit" class="btn" value="정보보기"/><input type="button" id="button" class="btn"  value="취소하기" /></td></tr>
					</table>
				</form>
			</div>
		</div>
		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>