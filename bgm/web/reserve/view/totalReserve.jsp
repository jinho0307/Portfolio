<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.model.vo.*, java.util.*, member.model.vo.*" %>
<%
	Member member = (Member)session.getAttribute("loginUser");
	ArrayList<ReserveName> list = (ArrayList<ReserveName>)request.getAttribute("list");
	Search search = (Search)request.getAttribute("search");	

	//페이지번호 목록
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
<title>관리자 페이지(전체 예매 내역 조회)</title>
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
		
		$(".cancelTicket").click(function(){
			var user = $(this).parent().siblings().eq(0).text();
			var cinema = $(this).parent().siblings().eq(1).text();
			var screen = $(this).parent().siblings().eq(2).text();
			var movie = $(this).parent().siblings().eq(3).text();
			var seat = $(this).parent().siblings().eq(4).text();
			var time = $(this).parent().siblings().eq(5).text();
			
			location.href="/bgm/cct2?user=" + user + "&cinema=" + cinema + "&screen=" + screen + "&movie=" + movie + "&seat=" + seat + "&time=" + time;
		});
	});
	
</script>
<style type="text/css">
	#maindiv {
		width : 1150px;
		margin : auto;
	}
	
	#subdiv {
		width : 1150px;
		margin : auto;
	}
	
	#nlistTable {
		width : 1150px;
		margin : auto;
		text-align : center;
	}
	
	#nlistTable .nTd {
		text-align: center;
		width: 130px;
	}
	
	.thDiv:not(#last) {
		border-right: 1px solid rgba(200, 200, 200, 1);
	}
	
	#nlistTable th {
		border-top: 2px solid rgba(200, 200, 200, 1);
		border-bottom: 2px solid rgba(200, 200, 200, 1);
	}
	
	#nlistTable tr {
		height: 50px;
	}
	
	#paging {
		text-align: center;
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
</style>
</head>
<header id="header"></header>
<body>
	<div id="managerContainer">
		<h2>관리자 페이지</h2>
	</div>
	<form action="/bgm/searchList" method="post">
		<div id="maindiv">

			<div id="nSearchContainer">
				<select class="searchSelect" name="searchCategory">
					<option value="전체">전체</option>
					<option value="1">유저아이디</option>
					<option value="2">영화 이름</option>
					<option value="3">영화관 이름</option>
				</select>
				<input type="text" id="searchText" name="searchText" /> 
				<input type="submit" value="검색" id="submitBtn" style="position: relative;" />
				<span> 총 <strong><%=listCount%></strong>개의 게시물이 있습니다.
				</span>
			</div>
			<div id="subdiv">
				<table id="nlistTable">
					<tr>
						<th><div class="thDiv">유저 아이디</div></th>
						<th><div class="thDiv">영화관</div></th>
						<th><div class="thDiv">상영관</div></th>
						<th><div class="thDiv">영화</div></th>
						<th><div class="thDiv">좌석</div></th>
						<th><div class="thDiv">상영시간</div></th>
						<th><div class="thDiv" id="last">취소</div></th>
					</tr>
					<% for(int x=0;x<list.size();x++){ %>
					<tr>
						<td class="nTd"><%= list.get(x).getUserId() %></td>
						<td class="nTd"><%= list.get(x).getCinemaName() %></td>
						<td class="nTd"><%= list.get(x).getScreenRoomName() %></td>
						<td class="nTd"><%= list.get(x).getMovieName() %></td>
						<td class="nTd"><%= list.get(x).getSeat() %></td>
						<td class="nTd"><%= list.get(x).getShowTime() %></td>
						<td class="nTd"><label class="cancelTicket">예매취소</label></td>
					</tr>
					<% } %>
				</table>
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
							<a href="/bgm/getrsvlist?page=<%=currentPage - 1%>">[이전]</a> &nbsp;
					<%
						}
					%>
					<%
						for (int p = startPage; p <= endPage; p++) {
							if (p == currentPage) {
					%>
								<b>[<%=p%>]</b> &nbsp;
					<%
							} else {
					%>
								<a href="/bgm/getrsvlist?page=<%=p%>">[<%=p%>]</a>
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
							<a href="/bgm/getrsvlist?page=<%=currentPage + 1%>">[다음]</a>
					<%
						}
					%>
						<%
				} else {	//검색어가 있는 경우.
				%>
				<%
					if (currentPage <= 1) {
				%>[이전] &nbsp;
				<%
					} else {
				%>
						<a href="/bgm/searchList?page=<%=currentPage - 1%>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>">[이전]</a> &nbsp;
				<%
					}
				%>
				<%
					for (int p = startPage; p <= endPage; p++) {
						if (p == currentPage) {
				%>
							<b>[<%=p%>]</b> &nbsp;
				<%
						} else {
				%>	
							<a href="/bgm/searchList?page=<%= p %>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>">[<%=p%>]</a>
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
						<a href="/bgm/searchList?page=<%=currentPage + 1%>&searchText=<%=search.getSearchText()%>
						&searchCategory=<%=search.getSearchCategory() %>">[다음]</a>
				<%
					}
				%>
				<% 
				}
				%>
					
				</div>
			</div>
		</div>
		<br><br>
	</form>
</body>
<footer id="footer"></footer>
</html>