		<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = (String)request.getParameter("userid");
	int totalcash = Integer.valueOf(request.getParameter("totalcash"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 총금액 수정</title>
<style type="text/css">
body{
	background: rgb(250,250,250);
}
</style>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
function modifycash() {
	location.href="/bgm/cashmodify?userid=<%=id%>&totalcash="+$('#tocash').val();
}
</script>
</head>
<body>
<div align="center">
	<table>
		<tr><td>아이디</td><td><%= id %></td></tr>
		<tr><td>보유금액</td><td><input id="tocash" type="text" value="<%=totalcash%>">원</td></tr>
		<tr><td><button onclick="modifycash();">수정</button></td><td><input type="button" value="닫기" onclick="javascript:window.close();"></td></tr>
	</table>
</div>

</body>
</html>