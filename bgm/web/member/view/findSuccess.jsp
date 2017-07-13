<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*"%>
<%
	Member user = (Member)request.getAttribute("user");
	Member userp = (Member)request.getAttribute("userp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>찾기 성공 페이지</title>
<link rel="stylesheet" type="text/css" href="/bgm/member/css/success.css">
</head>
<body>
<div align="center">
	<table>
		<tr><td></td><td></td><td></td></tr>
		<%if(user !=null && userp == null){ %>
		<tr><td><label><%=user.getUserName() %></label></td><td>님의 아이디는</td><td>[<%= user.getUserId() %>]입니다.</td></tr>
		<%}else if(user == null && userp != null){ %>
		<tr><td><label><%=userp.getUserName() %></label></td><td>님의 비밀번호는</td><td>[<%= userp.getPassword() %>]입니다.</td></tr>
		<%}else{ %>
		<tr><td><label>일치하는 정보를 찾을수 없습니다</label>/label></td><td>님의 비밀번호는</td><td>[<%= userp.getPassword() %>]입니다.</td></tr>
		<%} %>
		<tr><td align="center" colspan="3"><input type="button" value="닫기" onclick="javascript:window.close()"></td></tr>
	</table>
</div>

</body>
</html>