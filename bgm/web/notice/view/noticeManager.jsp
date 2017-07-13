<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.util.*, notice.model.vo.Notice, member.model.vo.Member, 
		notice.model.vo.Search "%>

<%
	ArrayList<Notice> list = (ArrayList<Notice>) request.getAttribute("list");
	Member loginUser = (Member) session.getAttribute("loginUser");
	Search search = (Search) request.getAttribute("search");
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
		
		$("#checkAll").click(function(){
			
			if($("#checkAll").is(":checked")){
				$("[name=check]").prop("checked", "checked");
			} else {
				$("[name=check]").prop("checked", false);
			}
		});	
		
		$("#allDelete").click(function(){
			var deleteNo;
			var i = 0;
			var arr = new Array();
			$("input[name=check]").each(function(){
				
				if($(this).prop("checked")) {
					
					arr[i] = $(this).val();
					i++;
				}
			});
			location.href="/bgm/deletemanager?arr=" + arr;
		});
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

#nSearchContainer>span {
	right: 0;
	position: absolute;
	text-align: right;
}

#nSearchContainer .searchSelect {
	width: 100px;
	height: 25px;
	margin-right: 5px;
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

#listDiv #nlistTable .nTd {
	text-align: center;
	width: 110px;
}

#listDiv #nlistTable .check {
	width: 40px;
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
<header id="header"></header>
<body>
	<form action="/bgm/nsearch" method="post">
		<div id="nlistContainer">
			
			<div id="boardMenu">
				<h2>관리자페이지 > 게시판관리</h2>
					<ul id="innerMenu">
						<%
							if (loginUser != null) {
						%>
						<li id="btnLi"><input type="button" class="writeBtn"
							onclick="javascript:location.href='/bgm/mynlist?loginUser=<%= loginUser.getUserId() %>'"
							value="내글 보기" />
						<li>
						<li id="btnLi"><input type="button" class="writeBtn"
							onclick="javascript:location.href='/bgm/notice/view/noticeWriteForm.jsp;'"
							value="글 쓰기" />
						<li>
							<%
								}
							%>
					</ul>
			</div>
			<div id="nSearchContainer">
				<select class="searchSelect" name="searchCategory">
					<option value="전체">전체</option>
					<option value="공지">공지</option>
					<option value="질문">질문</option>
					<option value="정보">정보</option>
					<option value="후기">후기</option>
				</select><select class="searchSelect" name="searchCinema">
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
						<th><div class="thDiv check"><input type="checkbox" name="check" id="checkAll"></div></th>
						<th><div class="thDiv">구분</div></th>
						<th><div class="thDiv">영화관</div></th>
						<th><div class="thDiv">제목</div></th>
						<th><div class="thDiv">등록날짜</div></th>
						<th><div class="thDiv">조회수</div></th>
						<th><div class="thDiv" id="last"><input type="button" class="deleteBtn" id="allDelete" value="선택삭제"/></div></th>
					</tr>
					<%
						for (Notice notice : list) {
					%>
					<tr class="nTr">
						<td class="nTd check"><input type="checkbox" name="check" value="<%=notice.getNoticeNo()%>"></td>
						<td class="nTd"><%=notice.getCategory()%></td>
						<td class="nTd"><%=notice.getCinemaId()%></td>
						<% 
							if (loginUser != null) { 
						%>
						<td class="nn" id="td3"><a
							href="/bgm/ndetail?noticeno=<%=notice.getNoticeNo()%>"><%=notice.getNoticeTitle()%></a></td>
						<% 
							} else {
						%>
						<td id="td3"><a
							href="/bgm/member/view/login.jsp"><%=notice.getNoticeTitle()%></a></td>
						<% 
							}
						%>
						<td class="nTd"><%=notice.getNoticeDate()%></td>
						<td class="nTd"><%=notice.getReadCount()%></td>
						<td class="nTd">
							<a href="/bgm/altermanager?noticeno=<%=notice.getNoticeNo()%>"><input type="button" class="alterBtn" value="수정"></a>
							<a href="/bgm/deletemanager?noticeno=<%=notice.getNoticeNo()%>"><input type="button" class="deleteBtn" value="삭제"></a></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
				<% 
				if(loginUser != null){
				%>
			<div style="height: 50px;"><input type="button" class="writeBtn" id="bottomBtn"
						onclick="javascript:location.href='/bgm/notice/view/noticeWriteForm.jsp;'"
						value="글 쓰기" /></div>
				<%
				}
				%>			
			<div id="paging">
				<%
				if(search.getSearchText() == null){ //검색어가 없는 경우.
				%>
				<%
					if (currentPage <= 1) {
				%>		
						[이전] &nbsp;
				<%
					} else {
				%>
						<a href="/bgm/nlist?page=<%=currentPage - 1%>">[이전]</a> &nbsp;
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>
							<b>[<%=p%>]</b>
				<%
						} else {
				%>
							<a href="/bgm/nlist?page=<%=p%>">[<%=p%>]</a>
				<%
						}
				%>
				<%
					}
				%>
				<%
					if (currentPage >= lastPage) {
				%>
						 &nbsp;[다음]
				<%
					} else {
				%>
						 &nbsp; <a href="/bgm/nlist?page=<%=currentPage + 1%>">[다음]</a>
				<%
					}
				%>
				<%
				} else {	//검색어가 있는 경우.
				%>
				<%
					if (currentPage <= 1) {
				%>[이전]
				<%
					} else {
				%>
						<a href="/bgm/nsearch?page=<%=currentPage - 1%>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>&searchType=<%=search.getSearchType()%>
						&searchCinema=<%=search.getSearchCinema()%>">[이전]</a>
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>
							<b>[<%=p%>]</b>
				<%
						} else {
				%>	
							<a href="/bgm/nsearch?page=<%= p %>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>&searchType=<%=search.getSearchType()%>
						&searchCinema=<%=search.getSearchCinema()%>">[<%=p%>]</a>
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
						<a href="/bgm/nsearch?page=<%=currentPage + 1%>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>&searchType=<%=search.getSearchType()%>
						&searchCinema=<%=search.getSearchCinema()%>">[다음]</a>
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