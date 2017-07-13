<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, reserve.model.vo.*" %>
<%
	ArrayList<ReserveName> list = (ArrayList<ReserveName>)request.getAttribute("nlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예매 취소 페이지</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('common/view/header.jsp');
		$('footer').load('common/view/footer.jsp');
		
		$(".cancelTicket").click(function(){
			var user = $(this).parent().siblings().eq(0).text();
			var cinema = $(this).parent().siblings().eq(1).text();
			var screen = $(this).parent().siblings().eq(2).text();
			var movie = $(this).parent().siblings().eq(3).text();
			var seat = $(this).parent().siblings().eq(4).text();
			var time = $(this).parent().siblings().eq(5).text();
			alert(user + "님 " + cinema + " " + screen + " " + movie + " " + seat + " " + time + " 예매 정보가 취소되었습니다.");
			location.href="/bgm/cct?user=" + user + "&cinema=" + cinema + "&screen=" + screen + "&movie=" + movie + "&seat=" + seat + "&time=" + time;
		});
	});
</script>
<style type="text/css">
	/* #maindiv * {
		border : 1px solid;
	} */

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
	
	#boardMenu #innerMenu {
		list-style: none;
		overflow: auto;
	}
	
	#boardMenu #innerMenu li {
		float: left;
		margin-right: 30px;
	}
	
	#boardMenu #innerMenu li {
		font-weight : bold;
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
		
</style>

</head>
<header></header>
<body>
<br><br>
	<div id="maindiv">
		<div id="boardMenu">
			<h2 id="title" style="margin-top:20px;">예매 > 예매취소</h2>
				<ul id="innerMenu" style="margin-top: 16px; margin-bottom: 16px; padding-left: 40px; height: 30px;">
					<li><a href="/bgm/rsv">예매하기</a></li>
					<li><a href="/bgm/ccv">예매취소</a></li>
				</ul>
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
					<td class="nTd"><button class="cancelTicket">예매취소</button></td>
				</tr>
				<% } %>
			</table>
		</div>
	</div>
	<br><br>
</body>
<footer></footer>
</html>