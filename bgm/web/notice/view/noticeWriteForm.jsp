<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, member.model.vo.Member"%>
<%
	// session이 가지고 있는 request에서 로그인 되어있는 loginUser의 값을 가져옴.
	Member loginUser = (Member)session.getAttribute("loginUser"); 
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
	
	<form action="/bgm/nwrite" method="post" enctype="multipart/form-data">
		<div id="noticeWriteContainer">
		<%if(loginUser != null){ %>
		<input type="hidden" name="nwriter"value="<%= loginUser.getUserId() %>">
		<% } %>
		<h1>공지글 쓰기 페이지<%= loginUser.getUserId() %></h1>
			<table id="nwTable">
				<tr id="nwQuestionContainer">
					<td class="first">문의유형</td>
					<% if(!loginUser.getUserId().equals("admin")){ %>
					<td><input type="radio" name="nquestion" value="전체" checked/>전체
						<input type="radio" name="nquestion" value="질문"/>질문
						<input type="radio" name="nquestion" value="정보"/>정보
						<input type="radio" name="nquestion" value="후기"/>후기</td>
					<% } else { %>  
					<td><input type="radio" name="nquestion" value="공지" checked/>공지</td>
					<% } %>
				</tr>
				<tr id="nwSelectCinemaContainer">
					<td class="first">영화관선택</td>
					<td><select name="ncinema">
						<option value="전체">전체</option>
						<option value="롯데시네마">롯데시네마</option>
						<option value="CGV">CGV</option>
						<option value="메가박스">메가박스</option>
					</select></td>
				</tr>
				<tr id="nwTitleContainer">
					<td class="first">제목</td>
					<td><input type="text" name="ntitle"></td>
				</tr>
				<tr id="nwContentContainer">
					<td class="first" id="content">내용</td>
					<td><textarea id="writeContentArea" name="ncontent" placeholder="※주민번호 등 개인정보가 포함되지 않도록 유의하시기 바랍니다."></textarea></td>
				</tr>
				<tr id="nwUploadContainer">
					<td class="first">첨부파일</td>
					<td><input type="file" name="upfile"/></td>
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