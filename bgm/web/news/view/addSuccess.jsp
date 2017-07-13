<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
int result = (Integer)request.getAttribute("result");
System.out.println(result);

%>
<html>
<head>
<meta charset="UTF-8">
<script src="/bgm/common/js/jquery-3.1.1.min.js"></script>

<script>
$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");
	
});
</script>
<style>
#page{
width:1150px;
height:800px;
}
.btn{
width:150px;
height:30px;
}

#print{
margin-top:100px;
width:500px;
height:300px;
}


</style>
<title>추가 성공</title>
</head>
<header></header>
<body>
<div id= "page">
<br>
<center>
<div id="print">
<hr>
<br>
<h2>추가에 성공하였습니다.</h2>
<h3>계속 추가하시겠습니까?</h3>
<br>
<hr>


<%if(result==1){%>
<button class = "btn" onclick="location.href='/bgm/news/view/addCompany.jsp'">
<%}else if(result==2){%>
<button class = "btn" onclick="location.href='/bgm/news/view/addNewsForm.jsp'">
<%}%>


계속 추가</button>
<button class = "btn" id = "main" onclick="location.href='/bgm/index.jsp'">메인 페이지로 이동</button>
</div>
</center>
</div>
</body>
<footer></footer>
</html>