<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.model.vo.Member" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");

	int listCount = ((Integer)request.getAttribute("listCount")).intValue();
	//현제 보여질 목록 페이지
	int currentPage = ((Integer)request.getAttribute("currentPAge")).intValue();
	//현제피이지(19)의 시작페이지 (11)
	int startPage = ((Integer)request.getAttribute("startPage")).intValue();
	//현제 페이지의(19)의 마지막 페이지(20)
	int endPage = ((Integer)request.getAttribute("endPage")).intValue();
	//맨 마지막 페이지
	int maxPage = ((Integer)request.getAttribute("maxPage")).intValue();
	//키워드 
	String keyword = (String)request.getAttribute("keyword");
	String seach = (String)request.getAttribute("seach");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원관리 페이지</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('/bgm/common/view/header.jsp');
		$('footer').load('/bgm/common/view/footer.jsp');
		
		$('.cashtr').on("click",function () {
			var id = $(this).children().eq(1).text();
			var cash = $(this).children().eq(4).text();
			$(this).on("click", ".paybtn", function () {
				window.open('/bgm/pay/view/modifycash.jsp?userid='+id+'&totalcash='+cash,'','width=400px,height=150px');
			})
		});
	});
</script>
<style type="text/css">


#nlistContainer {
	width: 1150px;
	margin: auto;
}

.thDiv:not(#last) {
	border-right: 1px solid rgba(200, 200, 200, 1);
}

#boardMenu #innerMenu {
	list-style: none;
	overflow: auto;
}

#boardMenu #innerMenu li {
	float: left;
	margin-right: 30px;
}

#boardMenu #innerMenu li a {
	color: black;
	font-weight: bold;
}

#boardMenu #innerMenu #btnLi {
	float: right;
}

.writeBtn {
	width: 120px;
	height: 30px;
	font-size: 12pt;
	color: white;
	background: rgba(200, 0, 0, 0.7);
}

#nSearchContainer {
	position: relative;
	clear: left;
	height: 25px;
	margin: 30px;
}

#nSearchContainer span {
	right: 0;
	position: absolute;
	text-align: right;
}
#nSearchContainer  #rspan {
	right: 0;
	position: absolute;
	text-align: right;
}


#nSearchContainer .searchSelect {
	width: 100px;
	height: 25px;
	margin-right: 5px;
}

#nSearchContainer #fbtn {
	position: absolute;
	top: 0;
	width: 100px;
	height: 20px;
}

#nSearchContainer #seachbtn {
	position : relative;
	top : 2px;
	width : 80px;
	height: 26px;
}

#nSearchContainer #seach{
	height: 25px;
}

#listDiv #memberList {
	width: 1100px;
	margin: 0 auto;
	border-collapse: collapse;
}

#listDiv #memberList a {
	color: #555;
}

#listDiv #memberList th {
	border-top: 2px solid rgba(200, 200, 200, 1);
	border-bottom: 2px solid rgba(200, 200, 200, 1);
}

#listDiv #memberList tr {
	height: 50px;
}

#listDiv #memberList .nTd {
	text-align: center;
	width: 130px;
}

#listDiv #memberList #td3 {
	padding-left: 20px;
}

#listDiv #memberList tr {
	border-bottom: 1px solid rgba(200, 200, 200, 0.5);
}

#paging {
	text-align: center;
}

#listDiv {
	height: 400px auto;
	margin-bottom: 40px;
}

#bottomBtn {
	float: right;
	margin-right: 30px;
}
</style>
<header></header>
</head>
<body>
<div id="nlistContainer">
<h2>총 멤버 보유금액 조회</h2>
<div id="boardMenu">
	<ul id="innerMenu">
		<li><a href="/bgm/sallpay">멤버 보유금액</a></li>
	</ul>
</div>
<div id="nSearchContainer">
<form action="/bgm/pseach" method="post">
<div align="center">
<a href="/bgm/sallpay">전체목록</a>
<select name="seachItem" class="searchSelect">
	<option value="userId" selected="selected">아이디</option>
	<option value="userNAme">이름</option>
	<option value="userEmail">이메일</option>
	
</select>
<input type="search" id="seach" name="keyword" size="30">
<input type="submit" id="seachbtn" value="검색">

</form>
</div>		
</div>



<div align="center" id="listDiv">

	<table align="center" id="memberList">
		<tr><th>아이디</th><th>이름</th><th>가입일</th><th>이메일</th><th>토탈캐쉬(원)</th><th>총금액 수정</th></tr>
		
		<%for(Member n : list){ %>
		
			<tr class="cashtr"><td align="center" class="id"><a href="/bgm/chistory?userid=<%=n.getUserId() %>"><%=n.getUserId() %></a></td>
			<td align="center"><%= n.getUserName() %></td>
			<td align="center"><%=n.getEnroll_date() %></td>
			<td align="center"><%=n.getEmail() %></td>
			<td align="center"><%=n.getTotalCash()%></td>
			<td align="center"><button class="paybtn" >수정</button></td></tr>
		
		<%} %>
	</table>
</div>
<div align="center">
<%if(keyword == null){ %>
<%
	if(currentPage <= 1){
%>[이전] &nbsp;
<%}else{ %>
	<a href="/bgm/sallpay?page=<%= currentPage - 1%>">[이전]</a>&nbsp;
<%} %>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%><b>[<%= p %>]</b>&nbsp;
<% }else{ %>
<a href="/bgm/sallpay?page=<%=p %>">[<%= p %>]</a>&nbsp;
<%}} %>
<% if(currentPage >= maxPage){ %>
[다음]&nbsp;
<%}else{ %>
<a href="/bgm/sallpay?=<%= currentPage + 1%>">[다음]</a>
<%}}else{ %> 
<!-- 검색결고가있을때 -->
<%
	if(currentPage <= 1){
%>[이전] &nbsp;
<%}else{ %>
	<a href="/bgm/pseach?page=<%= currentPage - 1%>&keyword1=<%=keyword%>&seachItem=<%=seach%>">[이전]</a>%nbsp;
<%} %>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%><b>[<%= p %>]</b>&nbsp;
<% }else{ %>
<a href="/bgm/pseach?page=<%=p %>&keyword1=<%=keyword%>&seachItem=<%=seach%>">[<%= p %>]</a>&nbsp;
<%}} %>
<% if(currentPage >= maxPage){ %>
[다음]&nbsp;
<%}else{ %>
<a href="/bgm/pseach?page=<%= currentPage + 1%>&keyword1=<%=keyword%>&seachItem=<%=seach%>">[다음]</a>
<%}} %>
</div>

</body>
<footer></footer>
</html>