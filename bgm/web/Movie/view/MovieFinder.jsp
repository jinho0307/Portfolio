<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*,java.util.*"%>
<%
	Map<String, MovieFileLink> movieMap = (Map<String, MovieFileLink>) request.getAttribute("movieMap");
	Set<Map.Entry<String, MovieFileLink>> entryset = movieMap.entrySet();
	Iterator<Map.Entry<String, MovieFileLink>> iter = entryset.iterator();
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
			$(this).css("background", "none").css("color", "white");
		});
	});
</script>
<style type="text/css">



img {
	width: 275px;
	weight: 550px;
}

table.movie {
	width: 210px;
	weight: 420px;
	/* background : blue; */
	/* BORDER:100; */
	ALIGN: center;
	border-style:outset;
	background:#212121;
	color:white;
}
td.td1{
border-style:outset;
color:white;
}

th {
	display: inline-block;
	margin: 1em;
}

.box {
	display: inline-block;
	width: 220px;
	height: 310px;
	margin: 1em;
	background: white;
}

hr {
	color: red;
	background-color: red;
}

html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	background-image: url('/bgm/Movie/영화포스터/12_alstjrrl2003.jpg');
	background-size: 100%;
}

.right {
	text-align: right;
}

A.movie:link {
	text-decoration: none;
	color: black
}

A.movie:visited {
	text-decoration: none;
	color: black
}

A.movie:hover {
	text-decoration: none;
	color: black
}

div.background {
	background: black;
}

</style>
</head>

<body>
	<header></header>
	<br>
	<br><hr><br>
	<center>
		<!-- <button id="btn">동영상보기</button> -->
		<%
			
			int j = 0;
			String movieMp4[] = new String[8];
			while (iter.hasNext()) {
				Map.Entry<String, MovieFileLink> entry = iter.next();
				MovieFileLink movieLink = entry.getValue();
				movieMp4[j] = movieLink.getMovieMp4();
				j++;
			}
			int random = (int) (Math.random() * j);
		%>

		<div id="div1" style="width: 100%; height: 491px; background: black;">
			<center>
				<br>
				<viedo controls autoplay name="media">
				<source src="<%=movieMp4[random]%>" type="video/mp4">
				<video controls="" autoplay="" name="media" width="784" height="441">
					<source src="<%=movieMp4[random]%>" type="video/mp4">
				</video>
			</center>
		</div>

		<h1>MovieChart</h1>
		<table style="width:300px;">
<tr>
	<td align="center" style=" width:150px; border-style:outset;"><a><h2>현재상영작</h2></a></td>
	<td align="center" style=" width:150px; border-style:outset;"><a href="/bgm/mexpect"><h2>상영예정작</h2></a></td>
</tr>
</table>
		


		<hr>

		<table class="movie">

			<tr>

				<%
					Set<Map.Entry<String, MovieFileLink>> entryset2 = movieMap.entrySet();
					Iterator<Map.Entry<String, MovieFileLink>> iter2 = entryset2.iterator();
				%>
				<%
					int i = 0;

					while (iter2.hasNext()) {
						Map.Entry<String, MovieFileLink> entry = iter2.next();
						MovieFileLink movieLink = entry.getValue();

						if (i % 4 != 0 || i == 0) {
				%>
				<td class="td1"><a href="/bgm/msearch?movieid=<%=movieLink.getMovieId()%>"
					class="movie" style="color:white;"><img src="<%=movieLink.getMoviePoster()%>"><br><div style="overflow:hidden;  white-space  : nowrap; width : 275px; text-overflow: ellipsis;  display: block;"><%=movieLink.getMovieName()%></div></a>개봉일 :<%=movieLink.getMovieDate()%><br><input type="button" onclick="location=/bgm/reserve/reserve.jsp" value="예매하기"></div></td>
				<%
					i++;
						} else {
				%>
			</tr>
		</table>
		<hr>
		<table class="movie">
			<tr>
				<td class="td1"><a href="/bgm/msearch?movieid=<%=movieLink.getMovieId()%>"
					class="movie" style="color:white;"><img src="<%=movieLink.getMoviePoster()%>"><br><div style="overflow:hidden;  white-space  : nowrap; width : 275px; text-overflow: ellipsis;  display: block;"><%=movieLink.getMovieName()%></div></a>개봉일 :<%=movieLink.getMovieDate()%><br><input type="button" onclick="location=/bgm/reserve/reserve.jsp" value="예매하기"></td>
				<%
					i++;
						}
					}
				%>

			</tr>
		</table>

	</center>
	<footer></footer>
</body>

</html>