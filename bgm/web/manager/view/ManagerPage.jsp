<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*" %>
<%
	Member member = (Member)session.getAttribute("loginUser");
	int movie = (Integer)request.getAttribute("movie");
	int news = (Integer)request.getAttribute("news");
	int charge = (Integer)request.getAttribute("charge");
	int use = (Integer)request.getAttribute("use");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>Manager Page</title>

<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#header').load('/bgm/common/view/header.jsp');
	$('#footer').load('/bgm/common/view/footer.jsp');
	
		
});
</script>
<style>


#payul {
	clear: left;
	list-style: none;
}

#payul li {
	float: left;
	margin-top: 30px;
	margin-right: 50px;
	margin-bottom: 30px;
	font-size: 13px;
}

#payul .payspan {
	margin-right: 15px;
	color: rgb(200, 56, 45);
}

#menulist {
	list-style: none;
}

#menulist li {
	float: left;
	margin-right: 40px;
}

</style>
</head>
<header id="header"></header>
<body>
	<div id="managerContainer">
		<h2>관리자 페이지</h2>
		<div id="managerTop">
			<div>
			<%if(member.getManager() == 0){ %>
				<ul id="menulist">
					<li><a href="/bgm/sall">회원관리</a></li>
					<li><a href="/bgm/sallpay">결제관리</a></li>
					<li><a href="/bgm/acashhistory">총 결제내역</a></li>
					<li><a href="/bgm/getrsvlist">예매관리</a></li>
					<li><a href="/bgm/getrsvinfo">상영관관리</a></li>
					<li><a href="/bgm/mmlist">영화관리</a></li>
					<li><a href="/bgm/news/view/newsMgr.jsp">뉴스관리</a></li>
					<li><a href="/bgm/nmanager">게시판관리</a></li>
				</ul>
				<ul id="payul">
					<li class="payli"><span class="payspan">영화결제금액</span><%=movie %><span> 원</span></li>
					<li class="payli"><span class="payspan">뉴스결제금액</span><%=news %><span> 원</span></li>
					<li class="payli"><span class="payspan">누적충전금액</span><%=charge %><span> 원</span></li>
					<li class="payli"><span class="payspan">누적사용금액</span><%=use %><span> 원</span></li>
				</ul>
							
			<%} %>
			</div>
		</div>
		<div id="managerMid">
		
		</div>
		<div id="managerBottom">
		
		</div>
	</div>
</body>
<footer id="footer"></footer>
</html>