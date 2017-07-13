<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String massage = (String)request.getAttribute("massage");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영페이지</title>
<style type="text/css">
table {
	width: 420px;
}
body{
	width: 600px;
	background: rgb(250,250,250);	
}
input[type=button]{
	width: 200px;
	height: 30px;
	
}
	/* 일반적인 버튼의 상황 */
button,input[type=button],
button:link,input[type=button]:link
button:visited,input[type=button],input[type=submit] {
	color: #666;
	border: 1px solid #ebebeb;
	border-bottom-color: #c6c6c6;
	box-shadow: 0 2px 2px rgba(0, 0, 0, 0.04);
	background: #fff;
	background: linear-gradient(to bottom, #ffffff 40%, #f6f6f6 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#ffffff', endColorstr='#f6f6f6', GradientType=0 );/*IE*/
}
 
/* 마우스오버 */
button:focus,input[type=button]:forcus,input[type=submit]:forcus,
button:hover,input[type=button]:hover,input[type=submit]:hover {
	background: #f4f4f4;
	background: linear-gradient(to bottom, #fafafa 0%, #fff 100%);
 filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fafafa', endColorstr='#ffffff', GradientType=0 );/*IE*/
}
 
/* 눌려졌거나 선택 된 상황 */
button:active, input[type=button]:active, input[type=submit]:active{
	text-shadow: 0 1px 0px #fff;
	border-color: #ebebeb;
	border-top-color: #ddd;
	background: #f4f4f4;
	box-shadow: none
}
</style>
<style type="text/css">
	body{
		width : 600px;
	}
	input[type=button]{
		width:150px;
		height: 25px;
	}
</style>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function cl() {
	opener.parent.location.reload();
	window.close();	
}
</script>
</head>
<body>
<div align="center">
<table>
	<tr><td><%= massage %></td></tr>
	<tr><td align="center"><input type="button" value="닫기" onclick="cl()"></td></tr>
</table>
</div>

</body>
</html>