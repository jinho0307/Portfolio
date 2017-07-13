<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="QnA.model.vo.Q"%>
<%
	Q q = (Q) request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Detail View</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#header').load('/bgm/common/view/header.jsp');
		$('#footer').load('/bgm/common/view/footer.jsp');
	});
</script>
<style>
#qContainer {
	display: block;
	width: 1000px;
	margin-right: auto;
	margin-left: auto;
	margin-top: 40px;
	padding: 0;
}

#qTitleContainer h3 {
	padding-left: 40px;
}

#titleUl {
	list-style: none;
	margin: 0;
	padding: 0;
	padding-left: 40px;	
	border-bottom : 1px solid gray;
	overflow: auto;
}



#titleUl .qtitle {
	margin: 0 40px 10px 0;
	pading: 0 0 0 0;
	float: left;
	font-size: 9pt;
}

#titleUl .qtitle span {
	position: relative;
	left: 5px;
}

#qContentContainer {
	clear: left;
}

#qContentContainer #qConDiv {
	padding: 40px;
}

#qContentContainer #goto {
	list-style: none;
}

#qContentContainer #goto li strong {
	float: left;
}

#qContentContainer #goto li div {
	position: relative;
	left: 50px;
}

/* #qContainer, #qTitleContainer, #qContentContainer, #qConDiv {
	border: 1px solid;
} */

#listbtn {
	display: block;
	position: relative;
	width: 100px;
	height: 30px;
	font-size: 20px;
	font-family: '굴림';
	margin: 8px auto;
}
</style>
</head>
<header id="header"></header>
<body>
	<form action="/bgm/qlist" method="post">
		<div id="qContainer">
			<h1>고객센터 - QnA</h1>
			<div id="qTitleContainer">
				<h3><%=q.getqTitle()%></h3>
				<ul id="titleUl">
					<li class="qtitle" id="titleLi1"><strong>영화관 : </strong><span><%=q.getCinemaId()%></span></li>
					<li class="qtitle" id="titleLi2"><strong>등록일 : </strong><span><%=q.getqDate()%></span></li>
					<li class="qtitle" id="titleLi3"><strong>조회수 : </strong><span><%=q.getqReadCount()%></span></li>
				</ul>
			</div>
			<div class="qCon" id="qContentContainer">
				<div class="qCon" id="qConDiv">
					<%=q.getqContent()%>
				</div>
				<ul id="goto">
					<li><strong>이전글</strong>
						<div id="qBefore">
							<a href="#">글제목</a>
						</div></li>
					<li><strong>다음글</strong>
						<div id="qAfter">
							<a href="#">글제목</a>
						</div></li>
				</ul>
				<input type="submit" id="listbtn" value="목록" />
			</div>
		</div>
	</form>
</body>
<footer id="footer"></footer>
</html>