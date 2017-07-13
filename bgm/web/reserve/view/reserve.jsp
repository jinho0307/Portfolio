<%@page import="movie.model.vo.Movie"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, reserve.model.vo.*, movie.model.dao.*, reserve.model.service.*, reserve.model.dao.*, java.sql.*, member.model.vo.*" %>
<%
	// 영화 정보
	ArrayList<Movie> mlist = (ArrayList<Movie>)request.getAttribute("mlist");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 예매 페이지</title>
<script type="text/javascript" src="common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
isLogin=false;
<%
if(loginUser!=null){
%>
isLogin=true;
<%}%>
	$(function() {
		$('header').load('common/view/header.jsp');
		$('footer').load('common/view/footer.jsp');
		
		$("#seatbtn").attr('disabled', true);
		$("#seatbtn").css("background", "gray");
		
		var mname = "";
		var cname = "";
		var sname = "";
		var dname = "";
		var tname = "";
		var screen = "";
		
		$("#m-m-bdiv > ul > li").click(function(){
			mname = $(this).text();
			$('#m-m-bdiv > ul > li').css("background", "none").css("color", "black");
			$(this).css("background", "#505050").css("color", "white");
			$("#seatbtn").attr('disabled', true);
			$("#seatbtn").css("background", "gray");
			
			$.ajax({
				url:"getc",
				type : 'get',
				data : {mname : mname},
				dataType : "json",
				success : function(clist){
 					var rclist = JSON.stringify(clist);	
					var json = JSON.parse(rclist);
					
					console.log(json);
					
					$("#sul").children().remove();
					$("#dul").children().remove();
					$("#m-t-bdiv").children().remove();
					cname = "";
					sname = "";
					dname = "";
					tname = "";
					
					for(var x in json.clist){
						var str1 = json.clist[x].cinemaName;
						
						$("#sul").append($('<li>', {class : 'sli', text : str1}));
						
									
					}
				}	
			});
		}); 	// 영화명 클릭 이벤트
		
		
		$(document).on("click","#m-s-bdiv > ul > li", function(){
			cname = $(this).text();
			$("#m-s-bdiv > ul > li").css("background", "none").css("color", "black");
			$(this).css("background", "#505050").css("color", "white");
			$("#seatbtn").attr('disabled', true);
			$("#seatbtn").css("background", "gray");
			
			$.ajax({
				url : "getd",
				type : "get",
				data : {mname : mname, cname : cname},
				dataType : "json",
				success : function(tlist){
					var rtlist = JSON.stringify(tlist);	
					var json = JSON.parse(rtlist);
					
					$("#dul").children().remove();
					$("#m-t-bdiv").children().remove();
					sname = "";
					dname = "";
					tname = "";
					
					var tmp;
					var week;
					
					for(var x=0;x<json.list.length;x++){
						var str1 = json.list[x].showTime;
						var sar = str1.split(" ")[0];
						week = getInputDayLabel(sar);
						
						if(sar != tmp){
							$("#dul").append($('<li>', {class : 'dli', text : sar + week}));
							tmp = sar;
						}
						
					}
					
				}
			});
		});	// 극장명 클릭 이벤트
		
		$(document).on("click", "#dul > li", function(){
			dname = $(this).text().split("(")[0];
			
			$("#dul > li").css("background", "none").css("color", "black");
			$(this).css("background", "#505050").css("color", "white");
			$("#seatbtn").attr('disabled', true);
			$("#seatbtn").css("background", "gray");
			
			
			$.ajax({
				url : "gett",
				type : "post",
				data : {mname : mname, cname : cname, dname : dname},
				dataType : "json",
				success : function(list){
					var rlist = JSON.stringify(list);	
					var json = JSON.parse(rlist);
					
					$("#m-t-bdiv").children().remove();
					tname = "";
					
					var tmp = json.list[0].screen;
					
					$("#m-t-bdiv").append("<h3 id='tli' style='text-align:left; font-weight:bold'>"+ tmp +"</h3>");
						
					for(var x=0;x<json.list.length;x++){
						var cnt = json.list[x].cnt;
						var scr = json.list[x].screen;
						console.log(cnt);
						if(scr == tmp){
							var time = json.list[x].time;
							
							
							$("#m-t-bdiv").append("<label class='t-tli'>" + time + "</label>" + "<div style='margin-right : 30px; display : inline-block'> (" + cnt + "/50) </div>");
						
						}
						else {
							$("#m-t-bdiv").append("<h3 id='tli' style='text-align:left; font-weight:bold; margin-top : 30px'>"+ scr +"</h3>");
							var time = json.list[x].time;
							
							$("#m-t-bdiv").append("<label class='t-tli'>" + time + "</label>" + "<div style='margin-right : 30px; display : inline-block'> (" + cnt + "/50) </div>");
							tmp = scr;
						
						}
						
					}
				
					$("#m-t-bdiv").css("text-align", "left");
				}
			});
		});	// 날짜 클릭 이벤트
		
		$(document).on("click", "#m-t-bdiv > label", function(){
			tname = $(this).text();
			screen = $(this).prevAll(":contains('관')").eq(0).text();
	
			
			$("#m-t-bdiv > label").css("background", "none").css("color", "black");
			$("#m-t-bdiv > div").css("background", "none").css("color", "black");
			$(this).css("background", "#505050").css("color", "white");
			$(this).next().css("background", "#505050").css("color", "white");
			
			if(mname != "" && cname != "" && dname != "" && tname != ""){
				$("#seatbtn").attr('disabled', false);
				$("#seatbtn").css("background", "rgba(200, 0, 0, 0.7)");
			}			
			
		});
		
		$("#seatbtn").on("click", function(){
			if(isLogin){
				location.href="/bgm/gets?mname=" + mname + "&cname=" + cname + "&dname=" + dname + "&screen=" + screen + "&tname=" + tname;
			}
			else{
				location.href="/bgm/member/view/login.jsp?mname=" + mname + "&cname=" + cname + "&dname=" + dname + "&tname=" + tname;
			}
		});
		
		
	});
	
	function getInputDayLabel(day) {
		
		var week = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');
		
		var today = new Date(day).getDay();
		var todayLabel = week[today];
		
		return todayLabel;
	} // 요일 구하는 함수
</script>

<style type="text/css">
	* {
	}
	
	#mdiv * {
		margin : 0;
		padding : 0;
	}
	
	#mdiv {
		width : 1150px;
		margin : auto;
		padding-top : 20px;
		padding-bottom : 20px;
		background: rgb(13,13,13); /* Old browsers */
		background: -moz-linear-gradient(top, rgba(13,13,13,1) 0%, rgba(1,1,1,1) 16%, rgba(1,1,1,1) 16%, rgba(149,149,149,1) 48%, rgba(149,149,149,1) 48%, rgba(149,149,149,1) 49%, rgba(149,149,149,1) 52%, rgba(78,78,78,1) 70%, rgba(56,56,56,1) 76%, rgba(56,56,56,1) 80%, rgba(27,27,27,1) 87%, rgba(10,10,10,1) 97%, rgba(10,10,10,1) 100%); /* FF3.6-15 */
		background: -webkit-linear-gradient(top, rgba(13,13,13,1) 0%,rgba(1,1,1,1) 16%,rgba(1,1,1,1) 16%,rgba(149,149,149,1) 48%,rgba(149,149,149,1) 48%,rgba(149,149,149,1) 49%,rgba(149,149,149,1) 52%,rgba(78,78,78,1) 70%,rgba(56,56,56,1) 76%,rgba(56,56,56,1) 80%,rgba(27,27,27,1) 87%,rgba(10,10,10,1) 97%,rgba(10,10,10,1) 100%); /* Chrome10-25,Safari5.1-6 */
		background: linear-gradient(to bottom, rgba(13,13,13,1) 0%,rgba(1,1,1,1) 16%,rgba(1,1,1,1) 16%,rgba(149,149,149,1) 48%,rgba(149,149,149,1) 48%,rgba(149,149,149,1) 49%,rgba(149,149,149,1) 52%,rgba(78,78,78,1) 70%,rgba(56,56,56,1) 76%,rgba(56,56,56,1) 80%,rgba(27,27,27,1) 87%,rgba(10,10,10,1) 97%,rgba(10,10,10,1) 100%); /* W3C, IE10+, FF16+, Chrome26+, Opera12+, Safari7+ */
		filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#0d0d0d', endColorstr='#0a0a0a',GradientType=0 ); /* IE6-9 */
	}
	
	#mdiv #mtable {
		width : 1000px;
	}
	
	#m-mdiv, #m-sdiv, #m-ddiv, #m-tdiv {
		display : inline-block;	
		height: 500px;
	}
	
	#mtd, #std, #dtd, #ttd {
		text-align : center;
	}
	
	.headcolor {
		background : rgb(173, 116, 96);
	}
	
	.bodycolor {
		background : #FFFEF4;
	}
	
	/* 영화div css */
	#m-mdiv{
		width : 212px;
		margin-left : 16px;
		margin-right : 16px;
	}
	
	#mtd{
		width : 212px;
	}
	
	#m-m-hdiv {
		margin-bottom : 5px;
		height : 30px;
		text-align : center;
		border : 1px solid;
	}
	
	#m-m-hdiv h2{
		color : white;
		font-weight : bold;
	}
	
	#m-m-bdiv {
		height : 460px;
		border : 1px solid;
		overflow : auto;
	}
	
	.mli {
		list-style : none;
	}
	
	/* 극장div css */
	#m-sdiv{
		width : 212px;
		margin-left : 16px;
		margin-right : 16px;
	}
	
	#std{
		width : 212px;
		
	}
	
	#m-s-hdiv {
		margin-bottom : 5px;
		height : 30px;
		text-align : center;
		border : 1px solid;
	}
	
	#m-s-hdiv h2{
		color : white;
		font-weight : bold;
	}
	
	#m-s-bdiv {
		height : 460px;
		border : 1px solid;
		overflow : auto;
	}
	
	/* 날짜div css */
	#dtd {
		width : 118px;
	}
	
	#m-ddiv{
		width : 118px;
		margin-left : 16px;
		margin-right : 16px;
	}
	
	#month {
		border : 1px solid;
		margin-bottom : 5px;
	}
	
	#m-d-hdiv {
		margin-bottom : 5px;
		height : 30px;
		text-align : center;
		border : 1px solid;
	}
	
	#m-d-hdiv h2{
		color : white;
		font-weight : bold;
	}
	
	#m-d-bdiv {
		height : 460px;
		overflow : auto;
		border : 1px solid;
	}
	
	.rlid {
		list-style : none;
	}
	
	/* 시간div css */
	#m-tdiv{
		width : 468px;
		margin-left : 16px;
		margin-right : 16px;
	}
	
	#ttd{
		width : 500px;
	}
	
	#m-t-hdiv {
		margin-bottom : 5px;
		height : 30px;
		text-align : center;
		border : 1px solid;
	}
	
	#m-t-hdiv h2{
		color : white;
		font-weight : bold;
	}
	
	#m-t-bdiv {
		height : 460px;
		border : 1px solid;
		overflow : auto;
	}
	
	/* 좌석선택 버튼 */
	#bottomdiv {
		width : 1150px;
		margin : auto;
	}
	
	#seatdiv {
		display : inline;
		float : right;
		margin : 10px;
	}
	#seatbtn {
		width: 120px;
		height: 30px;
		font-size: 12pt;
		color: white;
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

</style>

</head>
<header></header>
<body>
	<div id="boardMenu">
		<h2 id="title" style="margin-top:20px;">예매 > 예매하기</h2>
		<ul id="innerMenu" style="margin-top: 16px; margin-bottom: 16px; padding-left: 40px; height: 30px;">
			<li><a href="/bgm/rsv">예매하기</a></li>
			<li><a href="/bgm/ccv">예매취소</a></li>
		</ul>
	</div>
	<div id="mdiv">
		<table id="mtable" style="matgin-top:0px">
			<tr>
				<td id="mtd">
					<div id="m-mdiv">
						<div id="m-m-hdiv" class="headcolor">
							<h2>영화</h2>
						</div>
						<div id="m-m-bdiv" class="bodycolor">
							<ul>
								<% for(int x=0;x<mlist.size();x++){ %>
								<li class="mli" style="margin-bottom : 10px;"><%= mlist.get(x).getmName() %></li>
								<% } %>
							</ul>
						</div>
					</div>
				</td>

				<td id="std">	
					<div id="m-sdiv">
						<div id="m-s-hdiv" class="headcolor">
							<h2>극장</h2>
						</div>
						<div id="m-s-bdiv" class="bodycolor">
							<ul id="sul">
							
							</ul>
						</div>
					</div>
				</td>
				
				<td id="dtd">	
					<div id="m-ddiv">
						<div id="m-d-hdiv" class="headcolor">
							<h2>날짜</h2>
						</div>
						<div id="m-d-bdiv" class="bodycolor">
							<ul id="dul">
							
							</ul>
						</div>
					</div>
				</td>
				
				<td id="ttd">	
					<div id="m-tdiv">
						<div id="m-t-hdiv" class="headcolor">
							<h2>시간</h2>
						</div>
						<div id="m-t-bdiv" class="bodycolor">
							
						</div>
					</div>
				</td>		
			</tr>
		</table>
	</div>
	<div id="bottomdiv">
		<div id="seatdiv">
			<button id="seatbtn">좌석선택</button>
		</div>
	</div>
	<br>	
</body>
<footer></footer>
</html>