<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/top-common.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<title>Insert title here</title>
<script type="text/javascript">
	function message() {
		location.href="msgreadlist.j";
	}
	
	function goHome() {
		location.href="alink.do?path=common/newsfeed";
	}
	
	function goMyInfo() {
		location.href="alink.do?path=member/myInfo";
	}
	
	function logout(){
		location.href="logout.k";
	}
	
</script>
	</head>
<body>
<div id="logo" onclick="goHome()"></div>
<div id="serchbar">
	<input id="s" type="text" name="serch" placeholder="검색하기"/>
</div>
<div id="mylayout">
	<div id="message" onclick="message()"></div>
	<div id="allet"></div>
	<div id="logout" onclick="logout()"></div>
	<div id="my" onclick="goMyInfo()"><p id="m">내 정보보기</p></div>
</div>
</body>
</html>