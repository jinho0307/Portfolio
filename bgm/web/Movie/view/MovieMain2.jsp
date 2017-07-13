<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*,java.util.*"%>
<%
ArrayList <MovieFileLink> movieMap = (ArrayList <MovieFileLink>)request.getAttribute("movieMap");
/* Map<String, MovieFileLink> movieMap = (Map<String, MovieFileLink>) request.getAttribute("movieMap");
	Set<Map.Entry<String, MovieFileLink>> entryset = movieMap.entrySet();
	Iterator<Map.Entry<String, MovieFileLink>> iter = entryset.iterator(); */
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('/bgm/common/view/header.jsp');
		$('footer').load('/bgm/common/view/footer.jsp');

		$("#btn").click(function() {
			var isHidden = $("#div1").is(":hidden");
			if (isHidden) {
				$("#div1").show(2000);
			} else {
				$("#div1").hide(2000);
			}

		});
		$("a.movie").mouseover(function() {
			if((".movie2").mouseover==true){
				
			}else{
			$(this).prepend("<div class='movie2' tabindex='0' style='width:252px; height:365px; background:rgba(1,1,1,0.5);  z-index: 9999;  position: absolute;'><center><table style='height:355px; color:white;'><tr><td><h1>상세보기</h1></td></tr></table></center></div>");
			}
			
		});
		
		
		$("td.td1").mouseout(function() {
			$(".movie2").hide();
		});
		$("form.movie2").mouseout(function() {
			$(".movie2").remove();
		});
		$("header").mouseover(function(){
			$(".movie2").remove();
		});
		$("footer").mouseover(function(){
			$(".movie2").remove();
		});
		$("hr").mouseover(function(){
			$(".movie2").remove();
		});
		$("span").mouseover(function(){
			$(".movie2").remove();
		});
		$("#div1").mouseover(function(){
			$(".movie2").remove();
		});
		$("header").mouseout(function(){
			$(".movie2").remove();
		});
		$("footer").mouseout(function(){
			$(".movie2").remove();
		});
		$("hr").mouseout(function(){
			$(".movie2").remove();
		});
		$("span").mouseout(function(){
			$(".movie2").remove();
		});
		$("#div1").mouseout(function(){
			$(".movie2").remove();
		});
		$("input").mouseover(function(){
			$(".movie2").remove();
		});
		/* $("div").mouseout(function(){
			$(".movie2").remove();
		}); */
		
		
		
		
	
	
	
	});
</script>
<style>
@charset 'utf-8'; 

body, html {
	width: 100%;
	height: 100%;
}

center, button, dd, dl, dt, fieldset, form, h2, h3, h4, h5, h6, input,
	legend, li, ol, p, select, table, td, textarea, th, ul {
	margin: 0;
	padding: 0
}

.jender {
	position: relative;
	z-index: 10;
	display: block;
	float: left;
	width: 49.8%;
	height: 31px;
	border-right: solid 1px #dcdcdc
}

.jender+.jender {
	border: none
}

.jender input {
	position: absolute;
	z-index: 9;
	top: 0;
	left: 0;
	width: 575px;
	height: 31px
}

.jender label {
	line-height: 31px;
	position: absolute;
	z-index: 10;
	top: 0;
	left: 0;
	display: block;
	width: 575px;
	height: 31px;
	cursor: pointer;
	text-align: center;
	color: #9a9a9a;
	background: #fafafa;
	border:solid 1px #eaeaea;
	
}

.jender input:checked+label {
	z-index: 100;
	margin: 0px;
	color: gold;
	border: solid 1px gold;
	background: gray;
}

.jender label.on {
	z-index: 100;
	margin: 0px;
	color: #2eaa08;
	border: solid 1px #2eaa08
}
</style>
<style type="text/css">
img {
	width: 252px;
	height:365px;
	
}

table.movie {
	width: 1150px;
	height: 395px;
	align : center;
	/* background : blue; */
	/* BORDER:100; */
	/* ALIGN: center; */
	/* border-style: outset; */
	color: #121212;
	
}

td.td1 {
	border:solid 1px #eaeaea;
	color: #121212;
	align : center;
	display: inline-block;
	margin: 1em;
	
}



.box {
	display: inline-block;
	width: 220px;
	height: 310px;
	margin: 1em;
	color: #121212;
}



center {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	bachground:#f2f2f2;
	background-size: 100%;
}

.right {
	text-align: right;
}

A.movie:link {
	text-decoration: none;
	color: #121212
}

A.movie:visited {
	text-decoration: none;
	color: #121212
}

A.movie:hover {
	text-decoration: none;
	color: #121212
}

div.background {
	background: black;
}

#wrap {
	margin: 0px auto;
	width: 1150px;
	height: 500px;
	overflow: hidden;
	position: relative;
}

#slideConteiner {
	width: 8000px;
	position: absolute;
	-webkit-transition: all 1.2s ease-in-out;
	-moz-transition: all 1.2s ease-in-out;
	-o-transition: all 1.2s ease-in-out;
}

#slideConteiner img {
	float: left;
}
#page{
width:1150px;
height:1500px;
}
</style>
</head>
<header></header>
<body>
<div id="page">
	<center>


		<br> <br>
		<hr>
		<br>
<form action="/bgm/mmsearch" method="post"
			onsubmit="return validate();" style="width: 1150px;"><select name="sel" id="sel">
	<option value="1" selected>전체검색</option>
	<option value="2">영화제목</option>
	<option value="3">감독</option>
	<option value="4">장르</option>
  </select><input type="text" id="select" name="select"  placeholder="검색 단어 입력">
<input type="submit" value="검색하기" id="sub1">
</form>
<br> <br>
		<hr>
		<br>

		<!-- <button id="btn">동영상보기</button> -->
		<%
			int j = 0;
			String movieMp4[] = new String[999];
			for (j=0; j<movieMap.size(); j++) {
				MovieFileLink movieLink = movieMap.get(j);
				movieMp4[j] = movieLink.getMovieMp4();
				
			}
			int random = (int) (Math.random() * j);
		%>

		<form id="div1" style=" width: 1150px;  height: 545px; background: black; border-radius: 40px 40px 40px 40px; margin:0;padding:0;">
		<center>
		<div id="wrap">
					<div id="slideConteiner">
					<div id="dd" style="top:227px; left:1010px; position:absolute; z-index:10;">
						<a class="btn2" 
						title=""><img src="/bgm/Movie/영화포스터/btnc_play.png" style="width:100px; height:100px;"></a>
						</div>
						<div id="dd2" style="top:210px; left:91px; position:absolute; z-index:10;">
						<a class="btn2" 
						title=""><img src="/bgm/Movie/영화포스터/1.jpg" style="width:10px; height:100px;"></a>
						</div>
						<div id="dd3" style="top:255px; left:45px; position:absolute; z-index:10;">
						<a class="btn2" 
						title=""><img src="/bgm/Movie/영화포스터/제목 없음.png" style="width:10px; height:10px;"></a>
						</div>
						<div id="dd4" style="top:350px; left:89px; position:absolute; z-index:10;">
						<a class="btn2" 
						title=""><img src="/bgm/Movie/영화포스터/제목 없음.png" style="width:15px; height:15px;"></a>
						</div>
						</div>
				<br><br>
				<viedo controls autoplay name="media">
				<source src="<%=movieMp4[random]%>" type="video/mp4"></viedo>
				
				<video controls="" autoplay="" name="media" width="788" height="452" style="border-radius: 25px 25px 25px 25px;">
					<source src="<%=movieMp4[random]%>" type="video/mp4">
				</video>
				
				</div>
			</center>
		</form>
		<form style="margin: 0px; padding: 0px; width: 1150px;">
			<br><h1>MovieChart</h1>
<br><br>
			<span class="sex"> <span class="jender"><input
					type="radio" id="man" name="sex" value="0" onclick="checkSex()"
					><label id="manLb" for="man"  onclick="location='/bgm/movieMap'">현재상영작 </label> </span><span
				class="jender"><input type="radio" id="woman" name="sex"
					value="1" checked><label
					id="womanLb" for="woman" >상영예정작 </label></span>
			</span>




			<hr>

			<table class="movie">

				<tr>

					
					<%
						int i = 0;

						for (i=0; i<movieMap.size(); i++) {
							
							MovieFileLink movieLink = movieMap.get(i);

							if (i % 4 != 0 || i == 0) {
					%>
					<td class="td1"><a
						href="/bgm/msearch?movieid=<%=movieLink.getMovieId()%>"
						class="movie" style="color: #121212; "><img
							src="<%=movieLink.getMoviePoster()%>"><br>
							<div
								style=" overflow: hidden; white-space: nowrap; width:  200px; text-overflow: ellipsis; display: block; "><%=movieLink.getMovieName()%></div></a>개봉일
						:<%=movieLink.getMovieDate()%><br> <input type="button"
						onclick="'location='/bgm/rsv'" value="예매하기">
						</div></td>
					<%
						i++;
							} else {
					%>
				</tr>
			</table>
			<hr>
			<table class="movie">
				<tr>
					<td class="td1"><a
						href="/bgm/msearch?movieid=<%=movieLink.getMovieId()%>"
						class="movie" style="color: #121212; "><img
							src="<%=movieLink.getMoviePoster()%>"><br>
							<div
								style=" overflow: hidden; white-space: nowrap; width: 275px; text-overflow: ellipsis; display: block;"><%=movieLink.getMovieName()%></div></a>개봉일
						:<%=movieLink.getMovieDate()%><br> <input type="button"
						onclick="'location='/bgm/rsv'"value="예매하기"></td>
					<%
						i++;
							}
						}
					%>

				</tr>
			</table>
<footer></footer>


		</form>
	</center>
	</div>
</body>

</html>