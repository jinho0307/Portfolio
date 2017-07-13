<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String massage = (String)request.getAttribute("massage");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>에러 페이지</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function () {
		$('footer').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");
	}
</script>
</head>
<body>
<header></header>
<div align="center">
<h1><%= massage %></h1>
<h2><a href="/bgm/index.jsp">시작 페이지로</a></h2>


</div>
<footer></footer>
</body>
</html>