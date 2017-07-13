<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</script>
</head>
<body>
<div id="main">
	<hr/>
	<br/>
	<h2>회원탈퇴가 완료되었습니다. 그동안 저희 서비스를 이용해주셔서 감사합니다.</h2>
	<a href="alink.do?path=../../index">시작페이지로 가기</a>
	<br/>
	<br/>
	<br/>
	<hr/>
</div>
</body>
</html>