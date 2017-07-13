<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.model.vo.*, reserve.model.vo.*, java.text.SimpleDateFormat, java.util.*, movie.model.vo.*, javax.servlet.RequestDispatcher, javax.servlet.http.*, 
				 javax.servlet.ServletException, javax.servlet.annotation.WebServlet, java.io.IOException"%>
<%
	reserveInfo ri = (reserveInfo)request.getAttribute("ri");
	Movie m = (Movie)request.getAttribute("movie");
	String seat[] = (String[])request.getAttribute("ssar");
	Member member = (Member)session.getAttribute("loginUser");
	
	String gst = ri.getShow_Time();
	String[] stmp = gst.split(" ");
	String[] sdate = stmp[0].split("/");
	
	int year = Integer.parseInt(sdate[0]);
	int month = Integer.parseInt(sdate[1])-1;
	int day = Integer.parseInt(sdate[2]);
	
	SimpleDateFormat sdf = new SimpleDateFormat("(E)");
	Calendar cld = GregorianCalendar.getInstance();
	cld.set(year, month, day);
	
	String week = sdf.format(cld.getTime());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석 선택</title>
<script type="text/javascript" src="common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('/bgm/common/view/header.jsp');
		$('footer').load('/bgm/common/view/footer.jsp');
		
		$("#checkbtn").attr("disable", true);
		$("#checkbtn").css("background", "gray");
		$("#reservebtn").hide();
		
		var count = 0;
		var count1 = 0;
		var count2 = 0;
		var price1 = 0;
		var price2 = 0;
		$(".seat").val(1);
		
		<% for(int x=0;x < seat.length; x++) { %>
				var afterseat = "<%= seat[x] %>";
		
				$(".seat").each(function(i){
					if($(this).text() == afterseat){
						$(this).css("background", "gray");
						$(this).val(3);
					}
				});
		<% } %>	
		var selectseat = "";
		
		$("#ncinema1").change(function(){
			count1 = $(this).val();
			count2 = $("#ncinema2").val();
			
			price1 = 10000 * count1;
			price2 = 8000 * count2;
			
			console.log("1 : " + price1 + ", " + price2);
			
			/* $("#price").text(parseInt(price1) + parseInt(price2)); */
			$("input[name=8]").val(parseInt(price1) + parseInt(price2));
			
			$(".seat").each(function(){
				if($(this).val()==2){
					$(this).val(1);
					$(this).css("background", "none");
					selectseat = "";
				}
			});
		});
		
		$("#ncinema2").change(function(){
			count2 = $(this).val();
			count1 = $("#ncinema1").val();
			
			price1 = 10000 * count1;
			price2 = 8000 * count2;
			
			console.log("1 : " + price1 + ", " + price2);
			
			/* $("#price").text(parseInt(price1) + parseInt(price2)); */
			$("input[name=8]").val(parseInt(price1) + parseInt(price2));
			
			$(".seat").each(function(){
				if($(this).val()==2){
					$(this).val(1);
					$(this).css("background", "none");
					selectseat = "";
				}
			});
		});
		
		$(".seat").click(function(){
		
			if($("#ncinema1").val() == 0 && $("#ncinema2").val() == 0){
				alert("인원을 먼저 선택해 주세요!");
			}
			else {
				
				if(count1 > 0){
					if($(this).val() == 1){
						$(this).css("background", "gray");
						$(this).val(2);
						count1--;
						selectseat += $(this).text() + "_1 ";
						
						if(count1 == 0 && count2 == 0){
							$("#checkbtn").attr('disabled', false);
							$("#checkbtn").css("background", "rgba(200, 0, 0, 0.7)");
						}
					}
				}
				else if(count1 == 0 && count2 > 0){
					if($(this).val() == 1){
						$(this).css("background", "gray");
						$(this).val(2);
						count2--;
						selectseat += $(this).text() + "_2 ";
						
						if(count1 == 0 && count2 == 0){
							$("#checkbtn").attr('disabled', false);
							$("#checkbtn").css("background", "rgba(200, 0, 0, 0.7)");
						}
					}
				}
				else {
					alert("좌석을 다 선택하였습니다.");
				}		
			}
		});
		
		$("#checkbtn").click(function(){
			var price = parseInt(price1) + parseInt(price2);

			var cash = "<%= member.getTotalCash() %>";
			if(cash >= price){
				$("form").append("<input type='hidden' name='7' value='" + selectseat + "'>");
				/* $("form").append("<input type='hidden' name='8' value='" + price + "'>"); */
				alert("예매가 완료되었습니다.");
				$("#reservebtn").click();
				
			}
			else {
				alert("잔액이 부족합니다. 캐쉬 충전 후 다시 진행하세요.");
				location.href = "/bgm/pay/view/payment.jsp";
				
			}
		});
		
		
	});
</script>
<style type="text/css">
	#maindiv * {
		margin : 0;
		padding : 0;
	}

	#tmpdiv {
		width : 1150px;
	}
	
	#tmpdiv2 {
		width : 700px;
		margin : auto;
	}
	
	/* 탑div */
	
	
	#maindiv {
		width : 1150px;
		margin : auto;
	}
	
	#ldiv {
		width : 700px;
		margin : auto;
	}
	
	#stable {
		width : 700px;
		height : 300px;
		background : gray;
		padding : 0px;
		text-align : center;
	}
	
	#imgdiv {
		width : 200px;
		height : 300px;
	}
	
	#img {
		width : 200px;
		height : 300px;
		margin : 0px;
		padding : 0px;
	}
	#stable td {
		border : 1px solid;
	}
	#stable td > label {
		font-size : 10pt;
	}
	
	.lmenu {
		font-size : 10pt;
		font-weight : bold;
	}
	
	#peoplediv{
		text-align : left;
		position : relative;
		height : 150px;
	}
	
	#peoplelabel {
		position : absolute;
		top : 70px;
		left : 10px;
		font-size : 18pt;
	}
	
	#selectpeople {
		width : 300px;
		height : 150px;
		
	}
	
	#selectpeople > div {
		margin-left : 10px;
	}
	
	.peoples {
		width : 25px;
		height : 25px;
		float : left;
		border : 1px solid;
	}
	
	#selectdiv {
		
	}
	
	/* 미드div */
	#sdiv {
		width : 750px;
		margin : auto;
		height : 350px;
	}
	
	#sdiv2 {
		width : 700px;
		margin : auto;
		height : 350px;
		border : 1px solid;
	}
	
	#sdiv3 {
		width : 700px;
		height : 300px;
		margin-top : 26px;
		margin-bottom : 26px;
	}
	
	#screendiv {
		width : 650px;
		background : gray;
		text-align : center;
		margin : auto;
	}
	
	#s-sdiv{
		width : 700px;
	}
	
	#seattable {
		width : 650px;
		text-align : center;
		margin : auto;
	}
	
	#seattable td {
		width : 30px;
		height : 35px;
	}
	
	.seat {
		border : 1px solid;
	}
	
	select {
		width : 100px;
	}
	
	/* 바텀 */
	
	#btndiv {
		display : inline;
		float : right;
		margin : 10px;
		margin-right : 220px;
	}
	
	#checkbtn {
		width: 120px;
		height: 30px;
		font-size: 12pt;
		color: white;
   	}
   	
   	#pricediv {
   		display : inline-black;
   	}
   	
   	#price {
   		text-align : right;
   		border : none;
   	}
</style>
</head>
<header></header>
<body>
	<br>
	<div id="maindiv">
		<div id="tdiv">
			<div id="ldiv">
				<table id="stable">
					<tr><td rowspan="10" style="width : 200px"><div id="imgdiv"><img src="<%= ri.getMoviePoster() %>" id="img"/></div></td><td><label  class="lmenu"> 영화 이름 </label></td><td><label  class="lmenu"> 감독 이름 </label></td></tr>
					<tr><td style='width : 200px;'><label><%= ri.getMovieName() %></label></td><td><label><%= m.getmDirector() %></label></td></tr>
					<tr><td style='width : 200px;'><label  class="lmenu"> 등급 </label></td><td><label  class="lmenu"> 출연진 </label></td></tr>
					<tr><td style='width : 200px;'><label><%= ri.getMovieAge() %></label></td><td><label><%= m.getmCast() %></label></td></tr>
					<tr><td style='width : 200px;'><label  class="lmenu"> 영화관 </label></td><td><label  class="lmenu"> 장르 </label></td></tr>
					<tr><td style='width : 200px;'><label><%= ri.getCinemaName() %></label></td><td><label><%= m.getmGenre() %></label></td></tr>
					<tr><td style='width : 200px;'><label  class="lmenu"> 상영관 </label></td><td><label  class="lmenu"> 누적 관객수 </label></td></tr>
					<tr><td style='width : 200px;'><label><%= ri.getScreenRoomName() %></label></td><td><label><%= m.getMovieReserve() %></label></td></tr>
					<tr><td style='width : 200px;'><label  class="lmenu"> 상영일자 </label></td><td></td></tr>
					<tr><td style='width : 200px;'><label><%=year%>.<%=month+1%>.<%=day%><%=week %>&nbsp;<%=stmp[1]%></label></td>
						<td>
							
		               	</td>
		        	</tr>
				</table>
			</div>
		</div>
		<br><br>
		<div id="tmpdiv">
			<div id="tmpdiv2">
				<label  class="lmenu"> 인원 선택 </label> &nbsp; &nbsp;
				<select id="ncinema1">
					<option value="0">성인</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
				</select> &nbsp;
				<select id="ncinema2">
					<option value="0">청소년</option>
					<option value="1">1명</option>
					<option value="2">2명</option>
					<option value="3">3명</option>
					<option value="4">4명</option>
					<option value="5">5명</option>
					<option value="6">6명</option>
				</select>
			</div>
		</div>
		<br>
		<div id="mdiv">
			<div id="sdiv">
				<div id="sdiv2">
					<div id="sdiv3">
						<div id="screendiv">screen</div>
						<br><br>
						<div id="s-sdiv">
							<table id="seattable">
								<tr><td class="seat">A1</td><td class="seat">A2</td><td></td><td class="seat">A3</td><td class="seat">A4</td><td class="seat">A5</td><td class="seat">A6</td><td class="seat">A7</td><td class="seat">A8</td><td></td><td class="seat">A9</td><td class="seat">A10</td></tr>
								<tr><td class="seat">B1</td><td class="seat">B2</td><td></td><td class="seat">B3</td><td class="seat">B4</td><td class="seat">B5</td><td class="seat">B6</td><td class="seat">B7</td><td class="seat">B8</td><td></td><td class="seat">B9</td><td class="seat">B10</td></tr>
								<tr><td class="seat">C1</td><td class="seat">C2</td><td></td><td class="seat">C3</td><td class="seat">C4</td><td class="seat">C5</td><td class="seat">C6</td><td class="seat">C7</td><td class="seat">C8</td><td></td><td class="seat">C9</td><td class="seat">C10</td></tr>
								<tr><td>입구</td><td colspan="10"></td><td>출구</td></tr>
								<tr><td class="seat">D1</td><td class="seat">D2</td><td></td><td class="seat">D3</td><td class="seat">D4</td><td class="seat">D5</td><td class="seat">D6</td><td class="seat">D7</td><td class="seat">D8</td><td></td><td class="seat">D9</td><td class="seat">D10</td></tr>
								<tr><td class="seat">E1</td><td class="seat">E2</td><td></td><td class="seat">E3</td><td class="seat">E4</td><td class="seat">E5</td><td class="seat">E6</td><td class="seat">E7</td><td class="seat">E8</td><td></td><td class="seat">E9</td><td class="seat">E10</td></tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<div id="btndiv">
			<form action="sets" method="get">
				<input type="hidden" name="1" value="<%= ri.getCinemaName() %>">
				<input type="hidden" name="2" value="<%= ri.getScreenRoomName() %>">
				<input type="hidden" name="3" value="<%= ri.getMovieName() %>">
				<input type="hidden" name="4" value="<%= ri.getMovieAge() %>">
				<input type="hidden" name="5" value="<%= ri.getMoviePoster() %>">
				<input type="hidden" name="6" value="<%= ri.getShow_Time() %>">
	
				<div id="pricediv"><label id="sum">합계 : </label><input type="text" name="8" size="3" id="price" readonly><label> 원</label></div>
				<br>
				<input type="button" value="예매완료" id="checkbtn">
			
				<input type="submit" value="예매완료" id="reservebtn">
			</form>
		</div>
	</div>
	<br><br>
</body>
<footer></footer>
</html>