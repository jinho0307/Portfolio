<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*,java.util.*, java.text.*"%>
<%
    Object search = request.getAttribute("mId");
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
			$(this).css("background", "black").css("color", "skyblue");
		});
		$("a.movie").mouseout(function() {
			$(this).css("background", "none").css("color", "black");
		});
	});
</script>
<style>
@charset 'utf-8'; 
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


center, button, dd, dl, dt, fieldset, form, h2, h3, h4, h5, h6, input,
	legend, li, ol, p, select, table, td, textarea, th, ul {
	margin: 0;
	padding: 0;
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
	border:solid 1px #eaeaea;
}

.jender input:checked+label {
	z-index: 100;
	margin: 0px;
	color: gold;
	border: solid 1px gold;
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

#page{
width:1150px;
height:1900px;
}
</style>
</head>
<header></header>
<body>
	
<br> <br>
		<hr>
		<br>
		<br><center>
<form action="/bgm/mmsearch" method="post"
			onsubmit="return validate();" style="width: 1150px;">
			<select name="sel" id="sel" class="selectField">
	<option value="1">전체검색</option>
	<option value="2">영화제목</option>
	<option value="3">감독</option>
	<option value="4">장르</option>
  </select><input type="text" id="select" name="select" placeholder="검색 단어 입력">
<input type="submit" value="검색하기">
</form></center>
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
			if (j == 0) {
		%><br>
		<br><br>
		<br>
		<h2>'<%=search %>' 의 검색 결과가 없습니다.</h2>
		<br>
		<br><br>
		<br>
		
		<table>
			<tr>
				<td>- 단어의 철자가 정확한지 확인해 주세요.</td>
			</tr>
			<tr>
				<td>- 검색어의 단어수를 줄이거나, 다른 검색어로 검색해 보세요.</td>
			</tr>
			<tr>
				<td>- 보다 일반적인 검색어로 다시 검색해 보세요.</td>
			</tr>
			<tr>
				<td>- 자동완성어를 이용하시면 보다 완벽한 검색 결과를 얻으실 수 있습니다.</td>
			</tr>
		</table>
	<br>
		<br><br>
		<br>	<%
			} else {
				int random = (int) (Math.random() * j);
		%>
<center>
		<form id="div1" style=" width: 1150px; height: 491px; background: black; border-radius: 30px 30px 30px 30px; margin:0;padding:0;">
		
		<div id="wrap">
					<div id="slideConteiner">
					<div id="dd" style="top:200px; left:1010px; position:absolute; z-index:10;">
						<a class="btn2" href="#"
						title=""><img src="/bgm/Movie/영화포스터/btnc_play.png" style="width:100px; height:100px;"></a>
						</div>
						<div id="dd2" style="top:190px; left:91px; position:absolute; z-index:10;">
						<a class="btn2" href="#"
						title=""><img src="/bgm/Movie/영화포스터/1.jpg" style="width:10px; height:100px;"></a>
						</div>
						<div id="dd3" style="top:235px; left:45px; position:absolute; z-index:10;">
						<a class="btn2" href="#"
						title=""><img src="/bgm/Movie/영화포스터/제목 없음.png" style="width:10px; height:10px;"></a>
						</div>
						<div id="dd4" style="top:330px; left:89px; position:absolute; z-index:10;">
						<a class="btn2" href="#"
						title=""><img src="/bgm/Movie/영화포스터/제목 없음.png" style="width:15px; height:15px;"></a>
						</div>
						</div>
				<br>
				<viedo controls autoplay name="media">
				<source src="<%=movieMp4[random]%>" type="video/mp4"></viedo>
				
				<video controls="" autoplay="" name="media" width="784" height="441" style="border-radius: 15px 15px 15px 15px;">
					<source src="<%=movieMp4[random]%>" type="video/mp4">
				</video>
				
				</div>
			</center>
		</form>
		<center>
		<form style="margin: 0px; padding: 0px; width: 1150px;">
		<br><br>	<h1>'<%=search %>' 의  검색 결과</h1>


<br><br>



			

					
					<%
						int i = 0;

					for (i=0; i<movieMap.size(); i++) {
						
						MovieFileLink movieLink = movieMap.get(i);
								
								

								
					%>
				
			
			
			<table class="movie">
				<tr>
					<td class="td1"><a
						href="/bgm/msearch?movieid=<%=movieLink.getMovieId()%>"
						class="movie"><img
							src="<%=movieLink.getMoviePoster()%>"><br>
							<div style="overflow: hidden; white-space: nowrap; width: 252px; text-overflow: ellipsis; display: block;"><%=movieLink.getMovieName()%></div></a>개봉일
						:<%=movieLink.getMovieDate()%><br> <input type="button"
						onclick="'location='/bgm/rsv'" value="예매하기"></td><td>
						<table class="tb" style="width: 606px; height: 440px;">
						<tr><td>누적 관객수 : <%=movieLink.getMovieReserve()%> 명</td></tr>
						<tr>
					<td>감독 : <%=movieLink.getmDirector()%></td>
				</tr>
				<tr>
					<td>출연 : <%=movieLink.getmCast()%>
					</td>
				</tr>
				<tr>
					<td>장르 : <%=movieLink.getmGenre()%></td>
				</tr>
				<tr>
					<td>등급 : <%=movieLink.getmAge()%></td>
				</tr>
				<tr>
					<td>개봉일 : <%=movieLink.getMovieDate()%></td>
				</tr>
						</table>
						</td></tr><hr>
					<%
						
						}
							
					%>

				
			</table>


			<%
				}
			%>
		</form>
</center>
	
</body>
<footer></footer>
</html>