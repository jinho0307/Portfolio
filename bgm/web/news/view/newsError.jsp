<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>

<%
	String message = (String)request.getAttribute("message");

%>
<html>
<head>
<meta charset="UTF-8">
<script src="/bgm/common/js/jquery-3.1.1.min.js">
	
</script>

<script>


$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");

});

</script>
<title>에러페이지</title>
<style>
#page{
width:1150px;
height:800px;

}


</style>
</head>
<header></header>
<body>
<br><br>
<div id="page">
<center>
<h2><strong>에러!</strong></h2><br>
<h3><%=message %></h3>
</center>
</div>
</body>
<footer></footer>
</html>