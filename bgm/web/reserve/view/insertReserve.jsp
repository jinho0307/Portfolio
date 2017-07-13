<%@page import="movie.model.vo.Movie"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, reserve.model.vo.*, movie.model.dao.*, reserve.model.service.*, reserve.model.dao.*, java.sql.*, member.model.vo.*" %>
<%
	Member member = (Member)session.getAttribute("loginUser");
	// 영화 정보
	ArrayList<Movie> mlist = (ArrayList<Movie>)request.getAttribute("mlist");
	// 영화관 정보
	ArrayList<Cinema> clist = (ArrayList<Cinema>)request.getAttribute("clist");
	// 날짜 정보
	Calendar cld = GregorianCalendar.getInstance();
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd(E)");
	
	// 로그인유저 정보
	Member loginUser = (Member)session.getAttribute("loginUser");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영 정보 등록 페이지</title>
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
		var index = [];
		var count = 0;
		var i = 0;
		
		$("#m-m-bdiv > ul > li").click(function(){
			mname = $(this).text();
			
			$("#m-s-bdiv > ul > li").css("background", "none").css("color", "black");
			$("#dul > li").css("background", "none").css("color", "black");
			$("#m-t-bdiv > label").css("background", "none").css("color", "black");
			$("#m-t-bdiv > div").css("background", "none").css("color", "black");
			

			$('#m-m-bdiv > ul > li').css("background", "none").css("color", "black");
			$(this).css("background", "#0303FF").css("color", "white");
			
		
		}); // 영화명 클릭 이벤트
		
		
		$(document).on("click","#m-s-bdiv > ul > li", function(){
			cname = $(this).text();
			
			$("#m-s-bdiv > ul > li").css("background", "none").css("color", "black");
			$("#dul > li").css("background", "none").css("color", "black");
			$("#m-t-bdiv > label").css("background", "none").css("color", "black");
			$("#m-t-bdiv > div").css("background", "none").css("color", "black");
			
			$(this).css("background", "#0303FF").css("color", "white");

			
		});	// 극장명 클릭 이벤트
		
		$(document).on("click", "#dul > li", function(){
			dname = $(this).text().split("(")[0];
			cname = cname;
			sname = sname;
			mname = mname;
			
			$("#m-t-bdiv > label").css("background", "none").css("color", "black");
			$("#m-t-bdiv > div").css("background", "none").css("color", "black");
			
			$("#dul > li").css("background", "none").css("color", "black");
			$(this).css("background", "#0303FF").css("color", "white");
			
			index = [];
			count = 0;
			i = 0;
			
			$.ajax({
				url : "getscreen",
				type : "post",
				data : {mname : mname, cname : cname, dname : dname},
				dataType : "json",
				success : function(list){
					var rlist = JSON.stringify(list);	
					var json = JSON.parse(rlist);
					
					$("#m-t-bdiv").children().remove();
					
					
					var tmp = json.list[0].screen;
					
					
					$("#m-t-bdiv").append("<h3 id='tli' style='text-align:left; font-weight:bold'>"+ tmp +"</h3>");
					
					for(var x=0;x<json.list.length;x++){
						
						var scr = json.list[x].screen;
						
						if(scr == tmp){
							var time = json.list[x].time;
							var cnt = json.list[x].cnt;
							$("#m-t-bdiv").append("<label class='t-tli' style='margin-right : 30px'>" + time + "</label>");
							count++;
						}
						else {
							$("#m-t-bdiv").append("<h3 id='tli' style='text-align:left; font-weight:bold; margin-top : 30px'>"+ scr +"</h3>");
							var time = json.list[x].time;
							
							$("#m-t-bdiv").append("<label class='t-tli' style='margin-right : 30px'>" + time + "</label>");
							tmp = scr;
							index[i] = count;
							count = 1;
							i++;
						}
					}
					$("#m-t-bdiv").css("text-align", "left");
				}
			});
		});	// 날짜 클릭 이벤트
		
		$(document).on("click", "#m-t-bdiv > label", function(){
			screen = $(this).prevAll(":contains('관')").eq(0).text();
			
			console.log(screen);
			if($(this).text() != "다른 날짜를 선택하싶시오."){
				tname = $(this).text();
			
			
				$("#m-t-bdiv > label").css("background", "none").css("color", "black");
				$("#m-t-bdiv > div").css("background", "none").css("color", "black");
			
				$(this).css("background", "#0303FF").css("color", "white");
			
				$("#seatbtn").attr('disabled', false);
				$("#seatbtn").css("background", "rgba(200, 0, 0, 0.7)");
			}
		}); // 시간 클릭 이벤트
		
		$("#seatbtn").on("click", function(){
			if(isLogin)
				location.href="/bgm/setreserve?mname=" + mname + "&cname=" + cname + "&dname=" + dname + "&tname=" + tname + "&screen=" + screen;
			else
				location.href="/bgm/member/view/login.jsp";
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
		background : black;
		padding-top : 20px;
		padding-bottom : 20px;
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
		background : rgb(200, 56, 45);
	}
	
	.bodycolor {
		background : white;
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
		width : 138px;
	}
	
	#m-ddiv{
		width : 138px;
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
		width : 438px;
		margin-left : 16px;
		margin-right : 16px;
	}
	
	#ttd{
		width : 470px;
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


</style>

</head>
<header></header>
<body>
	<div id="managerContainer">
		<h2>관리자 페이지</h2>
	</div>
	<br>
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
								<li class="mli"><%= mlist.get(x).getmName() %></li>
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
								<% for(int x=0;x<clist.size();x++){ %>
								<li class="cli"><%= clist.get(x).getCinemaName() %></li>
								<% } %>
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
								<% 
								int sum = cld.get(cld.DAY_OF_MONTH) + 30;
								int year = cld.get(cld.YEAR);
								int month = cld.get(cld.MONTH);
								int y = cld.get(cld.DAY_OF_MONTH);
								for(int x=cld.get(cld.DAY_OF_MONTH);x<sum;x++){ 
									if(month == 1 || month == 3 || month == 5 || month == 7 || month == 8 || month == 10 || month == 12){
										if(y >= 31){
											month++;
											y = 1;
										}
									}
									else if(month == 2){
										if(y >= 28){
											month++;
											y = 1;
										}
									}
									else {
										if(y >= 30){
											month++;
											y = 1;
										}
									}
									
									if(month > 12){
										year++;
										month = 0;
									}
									cld.set(year, month, y);
									y++;%>
								<li class="dli"><%= sdf.format(cld.getTime()) %></li>
								<% } %>
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
			<button id="seatbtn">상영정보등록</button>
		</div>
	</div>
	<br>	
</body>
<footer></footer>
</html>