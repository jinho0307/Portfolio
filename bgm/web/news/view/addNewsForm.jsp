<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import= "java.util.*, news.model.vo.*"%>
<!DOCTYPE html>

<%
	ArrayList<NewsCompany> list = (ArrayList<NewsCompany>) request.getAttribute("list");

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


function check(){
	var value = $("#select").text();
	
	if(value=="뉴스사 선택"){
		alert("뉴스사를 선택해주세요.");
		return false;
		
	}else{
		return true;
	}
	
}


</script>
<title>뉴스 추가</title>
<style>
#page{
width:1150px;
height:800px;

}

#input{
margin-top:100px;
width:600px;
height:450px;
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
#btns{
	color: #666;
	border: 1px solid #ebebeb;
	border-bottom-color: #c6c6c6;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
	background: #fff;
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
 	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );
}



</style>
</head>

<header></header>
<body>

<div id = "page">




<center>

<div id = "input">

<h1>새 뉴스 추가</h1>
<hr style='width:inherit'>
<br>

<form action="/bgm/addnews" method="post" enctype="multipart/form-data">
<table>
<tr class= "tr"><td>뉴스사</td><td><select class="textf" id = "select" name="comName" required>
	
	<% for(int i=0; i<list.size();i++){%>
		<option value="<%=list.get(i).getCompanyName()%>"><%=list.get(i).getCompanyName()%></option>
	<%} %>
</select></td></tr>


<tr class = "tr"><td>뉴스 URL</td>&nbsp;&nbsp;<td><input type="text" class = "textf" name="url" required/></td></tr>
<tr class = "tr"><td>뉴스 제목</td>&nbsp;&nbsp;<td><input type="text" class = "textf" name="title" required /></td></tr>
<tr class = "tr"><td>뉴스 작성일</td>&nbsp;&nbsp;<td><input type="text" class = "textf" name="date" required placeholder = "yyyymmdd"/></td></tr>
<tr class = "tr"><td>폴더 이름</td>&nbsp;&nbsp;<td><input type="text" class = "textf" name = "folder" required/></td></tr>
<tr class = "tr"><td>뉴스 이미지</td>&nbsp;&nbsp;<td><input type="file" name="upfile" required /></td></tr>

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
<hr style='width:inherit'>

</div>
</center>
</div>
</body>
<footer></footer>
</html>