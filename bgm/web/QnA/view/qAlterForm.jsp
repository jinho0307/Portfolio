<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="QnA.model.vo.Q, member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser"); 
	Q q = (Q)request.getAttribute("q");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QAlterForm</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$('#header').load('/bgm/common/view/header.jsp');
	$('#footer').load('/bgm/common/view/footer.jsp');
	
	var category = "<%=q.getqCategory()%>";
	var cinema = "<%=q.getCinemaId()%>";
	
	for(var i = 0; i < 4; i++){
		if(category==$('[name=question]').eq(i).val()){	
			$('[name=question]').eq(i).attr("checked", "checked");
		}
		if(cinema==$("option").eq(i).val()){
			$("option").eq(i).attr("selected", "selected");
		}
	}
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

#nwTable #nwSelectCinemaContainer [name=qcinema] {
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
}
</style>
</head>
<header id="header"></header>
<body>
	
	<form action="/bgm/qaltersub?qno=<%=q.getqNo()%>" method="post">
		<div id="noticeWriteContainer">
		<%if(loginUser != null){ %>
		<input type="hidden" name="qwriter"value="<%= loginUser.getUserId() %>">
		<% } %>
		<h1>공지글 수정 페이지(<%= loginUser.getUserId() %>)</h1>
			<table id="nwTable">
				<tr id="nwQuestionContainer">
					<td class="first">문의유형</td>
					<% if(loginUser.getManager() != 0){ %>
					<td><input type="radio" name="question" value="전체"/>전체
						<input type="radio" name="question" value="영화관 관련"/>영화관 관련
						<input type="radio" name="question" value="예매 관련"/>예매 관련
						<input type="radio" name="question" value="기타"/>기타</td>
					<% } else { %>  
					<td><input type="radio" name="question" value="공지사항" checked/>공지사항</td>
					<% } %>
				</tr>
				<tr id="nwSelectCinemaContainer">
					<td class="first">영화관선택</td>
					<td><select name="qcinema">
						<option value="전체">전체</option>
						<option value="롯데시네마">롯데시네마</option>
						<option value="CGV">CGV</option>
						<option value="메가박스">메가박스</option>
					</select></td>
				</tr>
				<tr id="nwTitleContainer">
					<td class="first">제목</td>
					<td><input type="text" name="qtitle" value="<%=q.getqTitle()%>"></td>
				</tr>
				<tr id="nwContentContainer">
					<td class="first" id="content">내용</td>
					<td><textarea id="writeContentArea" name="qcontent" placeholder="※주민번호 등 개인정보가 포함되지 않도록 유의하시기 바랍니다."><%=q.getqContent()%></textarea></td>
				</tr>
			</table>
			<div id="nwButtonContainer">
				<input type="submit" value="수정완료"/>
				<input type="reset" value="취소"/>
			</div>
		</div>
	</form>
</body>
<footer id="footer"></footer>
</html>