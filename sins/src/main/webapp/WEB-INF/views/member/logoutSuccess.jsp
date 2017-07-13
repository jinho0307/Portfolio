<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>회원가입 실패</title>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/email.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript">
	// 뒤로가기 버튼 막기
	history.pushState(null, null, location.href); 
	window.onpopstate = function(event) { 
		history.go(1); 
	}
	
	function index1(){
		parent.locat();
		window.close();
	}
</script>

</head>
<body>
<div id="main">
	<hr/>
	<br/>
	<c:set var="admin" value="admin"/>
	<h2>정상적으로 로그아웃처리 되었습니다.</h2>
	<c:if test="${user eq admin}">
	어드민
		<a href="http://192.168.20.89:9999/sins">시작페이지로 가기</a>
	</c:if>
	<c:if test="${user ne admin }">
	<a href="#" onclick="index1()">시작페이지로 가기</a>
	</c:if>
	<br/>
	<br/>
	<br/>
	<hr/>
</div>
</body>
</html>