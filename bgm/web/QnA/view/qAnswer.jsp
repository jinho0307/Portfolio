<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="QnA.model.vo.Q, member.model.vo.Member"%>
<%
	// session이 가지고 있는 request에서 로그인 되어있는 loginUser의 값을 가져옴.
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	Q q = (Q)request.getAttribute("q");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeWriteForm</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#header').load('/bgm/common/view/header.jsp');
	$('#footer').load('/bgm/common/view/footer.jsp');
});
</script>
<style>


#noticeWriteContainer {
	width: 1150px;
	margin: 0 auto;
	padding: 0;
}

#nwTable {
	width: 900px;
	margin: 0 auto;
	margin-bottom: 30px;
	border-collapse: collapse;	
}

#nwTable tr {
	height: 55px;
	border-bottom: 1px solid rgba(200, 200, 200, 0.7);
}

#nwTable tr .first {
	width: 200px;
	padding: 10px;
}

#nwTable #nwQuestionContainer [type=radio] {
	margin-left: 12px;
}

#nwTable #nwSelectCinemaContainer [name=ncinema] {
	margin-left: 12px;
	height: 30px;
	width: 100px;
}

#nwTable #nwTitleContainer [type=text] {
	width: 700px;
	height: 30px;
	margin: 12px;
}

#nwTable #nwContentContainer textarea {
	width: 695px;
	height: 170px;
	margin: 12px;
	resize: vertical;
}

#nwTable #nwUploadContainer [type=file] {
	margin-left: 12px;
}

#nwButtonContainer {
	text-align: center;
}

#nwButtonContainer input {
	width: 70px;
	height: 25px;
	margin-right: 10px;
	background: rgba(200, 0, 0, 0.7);
}
</style>
</head>
<header id="header"></header>
<body>
	<form action="/bgm/qanswer" method="post">
		<div id="noticeWriteContainer">
		<input type="hidden" name="qno" value="<%= q.getqNo() %>">
		<h1>QnA 답변 페이지<%= loginUser.getUserId() %></h1>
			<table id="nwTable">
				<tr id="nwQuestionContainer">
					<td class="first">문의유형</td>
					<td><div><%=q.getqCategory() %></div></td>
				</tr>
				<tr id="nwSelectCinemaContainer">
					<td class="first">영화관선택</td>
					<td><div><%=q.getCinemaId() %></div></td>
				</tr>
				<tr id="nwTitleContainer">
					<td class="first">제목</td>
					<td><div><%=q.getqTitle() %></div></td>
				</tr>
				<tr id="nwContentContainer">
					<td class="first" id="content">내용</td>
					<td><div><%=q.getqContent() %></div></td>
				</tr>
				<tr id="nwContentContainer">
					<td class="first" id="content">답변</td>
					<td><textarea id="writeContentArea" name="answer" placeholder="※관리자 답변 페이지."></textarea></td>
				</tr>
			</table>
			<div id="nwButtonContainer">
				<input type="submit" value="등록하기"/>
				<input type="reset" value="취소"/>
			</div>
		</div>
	</form>
</body>
<footer id="footer"></footer>
</html>