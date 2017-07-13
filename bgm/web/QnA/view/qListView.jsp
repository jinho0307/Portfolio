<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, QnA.model.vo.Q, member.model.vo.Member, 
			QnA.model.vo.QSearch"%>

<%
	ArrayList<Q> list = (ArrayList<Q>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
	int manager = 4;
	if(loginUser != null)
		manager = loginUser.getManager();
	QSearch search = (QSearch) request.getAttribute("search");
	// 페이지번호 목록
	int listCount = ((Integer) request.getAttribute("listCount")).intValue();
	//현재 페이지 번호
	int currentPage = ((Integer) request.getAttribute("currentPage")).intValue();
	// 현재 페이지(19)의 시작 페이지(11)
	int startPage = ((Integer) request.getAttribute("startPage")).intValue();
	// 현재 페이지(19)의 마지막 페이지(20)
	int endPage = ((Integer) request.getAttribute("endPage")).intValue();
	// 맨 마지막 페이지
	int lastPage = ((Integer) request.getAttribute("lastPage")).intValue();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BGM-고객센터</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#header').load('/bgm/common/view/header.jsp');
		$('#footer').load('/bgm/common/view/footer.jsp');

		$("#listDiv #nlistTable a").hover(function() {
			$(this).css("color", "black");
		}, function() {
			$(this).css("color", "#555");
		});	
		
		// 답변이 달렸으면 마우스 커서 바꿈.
		$(".titleDiv").css("cursor", "pointer");
		
		$(".hideTr").hide();
		$(".hideTr").css("background", "rgba(150, 120, 100, 0.1)");

		//클릭시 숨겨져있으면 보이고, 보이는상태면 숨기기
		$(".nTr").on("click", function(){
			var next = $(this).next();	
			var isVisible = $(this).next().is(":visible");
			
			$(".hideTr").hide();
			next.show();	
			
			//if문으로 answer 없는글 answer 제거
			if(next.next().children().eq(1).text() != 'null')
				next.next().show();
			
			if(isVisible == true){
				$(".hideTr").hide();
			}
		});
	});
</script>
<style>
#nlistContainer {
	width: 1150px;
	margin: auto;
}

.thDiv:not(#last){
	border-right:1px solid rgba(173, 116, 96, 0.3);
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

.answerBtn {
	width: 80px;
	height: 25px;
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

#nSearchContainer>span {
	right: 0;
	position: absolute;
	text-align: right;
}

#nSearchContainer #searchText {
	position: absolute;
	top: 0;
	width: 150px;
	height: 20px;
}

#nSearchContainer #submitBtn {
	position: absolute;
	top: 0;
	height: 25px;
	left: 160px;
}

#nSearchContainer .searchSelect {
	width: 100px;
	height: 25px;
	margin-right: 5px;
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
	border-top: 2px solid rgba(173, 116, 96, 0.5);
	border-bottom: 2px solid rgba(173, 116, 96, 0.3);
}

#listDiv #nlistTable tr {
	height: 50px;
}

#listDiv #nlistTable .hideTd {
	font-weight: bold;
	color: red;
}

#listDiv #nlistTable .nTd {
	text-align: center;
	width: 130px;
}

#listDiv #nlistTable .td3 {
	padding-left: 20px;
	padding-right: 20px;
	-webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;

}

#listDiv #nlistTable tr {
	border-bottom: 1px solid rgba(173, 116, 96, 0.3);
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

.hideBtn {
	text-align: center;	
}
</style>
</head>
<header id="header"></header>
<body>
	<form action="/bgm/qsearch" method="post">
		<div id="nlistContainer">
			<h2>고객센터 > Q&A</h2>
			<div id="boardMenu">
				<ul id="innerMenu">
					<li><a href="/bgm/nlist">자유게시판</a></li>
					<li><a href="/bgm/qlist">Q&A</a></li>
					<%
						if (loginUser != null) {
					%>
					<li id="btnLi"><input type="button" class="writeBtn"
						onclick="javascript:location.href='/bgm/QnA/view/qWriteForm.jsp;'"
						value="글쓰기" />
					<li>
						<%
							}
						%>
					
				</ul>
			</div>
			<div id="nSearchContainer">
				<select class="searchSelect" name="searchCategory">
					<option value="전체">전체</option>
					<option value="영화관 관련">영화관 관련</option>
					<option value="예매 관련">예매 관련</option>
					<option value="기타 문의">기타 문의</option>
				</select><select class="searchSelect" title="영화관선택" name="searchCinema">
					<option value="전체">전체</option>
					<option value="롯데시네마">롯데시네마</option>
					<option value="CGV">CGV</option>
					<option value="메가박스">메가박스</option>
				</select> <select class="searchSelect" title="제목" name="searchType">
					<option value="title" selected>제목</option>
					<option value="content">내용</option>
					<option value="allsearch">제목 + 내용</option>
				</select> <input type="text" id="searchText" name="searchText" /> <input
					type="submit" value="검색" id="submitBtn" style="position: relative;" />
				<span> 총 <strong><%=listCount%></strong>개의 게시물이 있습니다.
				</span>
			</div>
			<div id="listDiv">
				<table id="nlistTable">
					<tr>
						<th><div class="thDiv">구분</div></th>
						<th><div class="thDiv">영화관</div></th>
						<th><div class="thDiv">제목</div></th>
						<th><div class="thDiv">등록날짜</div></th>
						<th><div class="thDiv" id="last">답변유무</div></th>
					</tr>
					<%
						for (Q q : list) {
					%>
					<tr class="nTr">
						<td class="nTd"><%=q.getqCategory()%></td>
						<td class="nTd"><%=q.getCinemaId()%></td>
						<td class="td3"><div class="titleDiv"><%=q.getqTitle()%></div></td>
						<td class="nTd"><%=q.getqDate()%></td>
						<td class="nTd"><% if(q.getAnswer() != null){ %>O<%} else { %>X<%} %></td>
					</tr>
					<tr class="hideTr">
						<td class="nTd hideTd question">Question</td>
						<% 
						if(loginUser != null) {
							if(manager==0) {
						%>
						<td colspan=3><div class="hideDiv"><%=q.getqContent()%></div></td>
						<td class="hideBtn"><a href="/bgm/qdetail?qno=<%=q.getqNo() %>">
						<input type="button" value="답변" class="answerBtn"/></a></td>
						<% 
							} else if(loginUser.getUserId().equals(q.getUserId())) { 
						%>
						<td colspan=3><div class="hideDiv"><%=q.getqContent()%></div></td>
						<td class="hideBtn"><a href="/bgm/qalter?qno=<%=q.getqNo() %>">
						<input type="button" value="수정" class="answerBtn"/></a></td>
						<% 
							} else { 
						%>
						<td colspan=4><div><%=q.getqContent()%></div></td>
						<%
							}
						} else {
						%>
						<td colspan=4><div><%=q.getqContent()%></div></td>
						<%
						} 
						%>
					</tr>
					<tr class="hideTr">
						<td class="nTd hideTd answer">Answer</td>
						<td colspan=4><div class="hideDiv"><%=q.getAnswer()%></div></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div style="height: 50px;">
					<%
						if (loginUser != null) {
					%>
				<input type="button" class="writeBtn" id="bottomBtn"
					onclick="javascript:location.href='/bgm/q/view/qWriteForm.jsp;'"
					value="글쓰기" />
					<%
						}
					%>
			</div>
			<div id="paging">
				<%
					if (search.getSearchText() == null) { //검색어가 없는 경우.
				%>
				<%
					if (currentPage <= 1) {
				%>
				[이전] &nbsp;
				<%
					} else {
				%>
				<a href="/bgm/qlist?page=<%=currentPage - 1%>">[이전]</a> &nbsp;
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
				%>
				<b>[<%=p%>]
				</b> &nbsp;
				<%
					} else {
				%>
				<a href="/bgm/qlist?page=<%=p%>">[<%=p%>]
				</a>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage >= lastPage) {
				%>
				[다음]
				<%
					} else {
				%>
				<a href="/bgm/qsearch?page=<%=currentPage + 1%>">[다음]</a>
				<%
					}
				%>
				<%
					} else { //검색어가 있는 경우.
				%>
				<%
					if (currentPage <= 1) {
				%>[이전] &nbsp;
				<%
					} else {
				%>
				<a
					href="/bgm/qsearch?page=<%=currentPage - 1%>&searchText=<%=search.getSearchText()%>
						&searchType=<%=search.getSearchType()%>&searchCinema=<%=search.getSearchCinema()%>">[이전]</a>
				&nbsp;
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
				%>
				<b>[<%=p%>]
				</b> &nbsp;
				<%
					} else {
				%>
				<a
					href="/bgm/qsearch?page=<%=p%>&searchText=<%=search.getSearchText()%>
						&searchType=<%=search.getSearchType()%>&searchCinema=<%=search.getSearchCinema()%>">[<%=p%>]
				</a>
				<%
					}
				%>
				<%
					}
				%>
				<%
					if (currentPage >= lastPage) {
				%>
				[다음]
				<%
					} else {
				%>
				<a
					href="/bgm/qsearch?page=<%=currentPage + 1%>&searchText=<%=search.getSearchText()%>
						&searchType=<%=search.getSearchType()%>&searchCinema=<%=search.getSearchCinema()%>">[다음]</a>
				<%
					}
				%>
				<%
					}
				%>
			</div>
		</div>
	</form>
</body>
<footer id="footer"></footer>


</html>