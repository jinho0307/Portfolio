<%@page import="java.lang.reflect.Array"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, member.model.vo.Member, pay.model.vo.*" %>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	String user = loginUser.getUserId();
	ArrayList<Cash> list = (ArrayList<Cash>)request.getAttribute("list");

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
	String keyword = (String)request.getAttribute("selectitem");
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
	});

</script>
<style>


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

#nSearchContainer #submitBtn {
	height: 26px;
}

#listDiv #nlistTable {
	width: 1100px;
	margin: 0 auto;
	border-collapse: collapse;
}

#listDiv #nlistTable a {
	color: #555;
}

#listDiv #nlistTable th {
	border-top: 2px solid rgba(200, 200, 200, 1);
	border-bottom: 2px solid rgba(200, 200, 200, 1);
}

#listDiv #nlistTable tr {
	height: 50px;
}

#listDiv #nlistTable .nTd {
	text-align: center;
	width: 130px;
}

#listDiv #nlistTable #td3 {
	padding-left: 20px;
}

#listDiv #nlistTable tr {
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
</head>
<body>
<header></header>

<div id="nlistContainer">
<h2>Cash 내역</h2>
<div id="boardMenu">
	<ul id="innerMenu">
		<li><a href="/bgm/chistory?userid=<%=loginUser.getUserId()%>">내 Cash 사용내역</a></li>
	</ul>
</div>
<div id="nSearchContainer">
<form action="/bgm/chistory" method="post">
<a href="/bgm/chistory?userid=<%=loginUser.getUserId()%>">전체목록</a>
<input type="hidden" name="userid" value="<%=user%>">
<select name="seachItem" class="searchSelect">
	<option value=""  selected="selected">종류</option>
	<option value="charge">충전</option>
	<option value="use">사용</option>
	<option value="mov">영화</option>
	<option value="news">뉴스</option>

</select>
<input type="submit" id="fbtn" value="확인">
<span>
<a href="/bgm/chistory?userid=<%=loginUser.getUserId()%>&seachItem=1month">1개월</a>&nbsp;
<a href="/bgm/chistory?userid=<%=loginUser.getUserId()%>&seachItem=6month">6개월</a>&nbsp;
<a href="/bgm/chistory?userid=<%=loginUser.getUserId()%>&seachItem=1year">1년</a>&nbsp;
<strong>잔여 금액 :<%= loginUser.getTotalCash() %>원</strong></span>
</div>
</form>		
</div>
<div id="listDiv">
	<table align="center" id="nlistTable">
		<tr><th><div class="thDiv">아이디</div></th><th><div class="thDiv">영화(코드)</div></th><th><div class="thDiv">뉴스(코드)</div></th><th><div class="thDiv">금액</div></th><th><div class="thDiv" id="last">결제일</div></th>
					</tr>
		<%for(Cash n : list){ %>
		<tr><td align="center"><%=n.getUserId() %></td>
		<%if(n.getMovieId()==null){ %>
		<td align="center">정보 없음</td>
		<%}else{ %>
		<td align="center"><a href="/bgm/msearch?movieid=<%=n.getMovieId() %>"><%=n.getMovieId() %></a></td>
		<%} %>
		<%if(n.getCompany_no()==0){ %>
		<td align="center">정보 없음</td>
		<%}else{ %>
		<td align="center"><%=  n.getCompany_no()%></td>
		<%} %>
		<td align="center"><%=n.getCash() %></td>
		<td align="center"><%=n.getUser_date() %></td>
		</tr>
		<%} %>
	</table>
</div>
<div align="center">
<%if(keyword == null){ %>
<%
	if(currentPage <= 1){
%>[이전] &nbsp;
<%}else{ %>
	<a href="/bgm/chistory?page=<%= currentPage - 1%>&userid=<%=user%>">[이전]</a>&nbsp;
<%} %>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%><b>[<%= p %>]</b>&nbsp;
<% }else{ %>

<a href="/bgm/chistory?page=<%=p %>&userid=<%=user%>">[<%= p %>]</a>&nbsp;
<%}} %>
<% if(currentPage >= maxPage){ %>
[다음]&nbsp;
<%}else{ %>
<a href="/bgm/chistory?=<%= currentPage + 1%>&userid=<%=user%>">[다음]</a>
<%}}else{ %> 
<!-- 검색결고가있을때 -->
<%
	if(currentPage <= 1){
%>[이전] &nbsp;
<%}else{ %>
	<a href="/bgm/chistory?page=<%= currentPage - 1%>&userid=<%=user%>&seachItem=<%=keyword%>&seachItem=<%=seach%>">[이전]</a>%nbsp;
<%} %>
<% for(int p = startPage; p <= endPage; p++){ 
	if(p == currentPage){
%><b>[<%= p %>]</b>&nbsp;
<% }else{ %>

<a href="/bgm/chistory?page=<%=p %>&userid=<%=user%>&seachItem=<%=keyword%>&seachItem=<%=seach%>">[<%= p %>]</a>&nbsp;
<%}} %>
<% if(currentPage >= maxPage){ %>
[다음]&nbsp;
<%}else{ %>
<a href="/bgm/chistory?page=<%= currentPage + 1%>&userid=<%=user%>&seachItem=<%=keyword%>&seachItem=<%=seach%>">[다음]</a>
<%}} %>


<footer></footer>
</body>
</html>