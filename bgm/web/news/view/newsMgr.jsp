<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>뉴스 관리자 페이지</title>
<script src="/bgm/common/js/jquery-3.1.1.min.js"></script>

<script>
$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");
	
});
</script>
</head>
<style>
#page{
width:1150px;
height:400px;

}
#select{
margin-top:100px;
}
</style>
<header></header>
<body>

<div id="page">
<center>
<div id="select" style='width:600px;'>
<hr style='width:inherit;'>
<br>
<h2>수행할 작업을 선택하세요</h2>
<a href="/bgm/addform">새 뉴스 추가</a><br>
<a href="/bgm/news/view/addCompany.jsp">뉴스사 추가</a>

<br><br><br>
<hr style='width:inherit;'>
</div>
</center>

</div>



</body>
<footer></footer>
</html>