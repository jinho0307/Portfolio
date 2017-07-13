<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

#input{
margin-top:100px;
width:600px;
height:300px;
}
.tr{
height:30px;
font-size:1.1em;

}
.textf{
height:30px;
width:350px;
font-size:1.2em;
}

.btn{
width:150px;
height:30px;


}


</style>
<title>뉴스사 추가</title>
</head>
<header></header>
<body>
<div id= "page">
<center>
<div id = "input">

<h1>뉴스사 추가</h1>
<hr style='width:inherit;'>
<br>
<form action="/bgm/addcompany" method="post" enctype="multipart/form-data">
<table>

<tr class = "tr"><td>뉴스사 이름</td><td><input type="text" class = "textf" name="comName" required /></td></tr>
<tr class = "tr"><td>뉴스사 메인URL</td><td><input type="text" class = "textf" name="mainURL" required/></td></tr>
<tr class = "tr"><td>이미지 파일</td><td><input type="file"  name="upfile" required /></td></tr>
<tr class = "tr"><td>한달 구독료</td><td><input type="number" class = "textf" name="price" required/></td></tr>
<tr class = "tr"><td>계약료</td><td><input type="number" class = "textf" name="deposit" required/></td></tr>


</table>
<br>
<input type="submit" id="submit" class="btn" value="확인"/>
<input type="reset" id="reset" class="btn" value="다시입력" style='
color: #666;
border: 1px solid #ebebeb;
border-bottom-color: #c6c6c6;
box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
background: #fff;
background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );

'/>
</form>
<br>
<hr style='width:inherit;'>

</div>
</center>
</div>
</body>
<footer></footer>
</html>