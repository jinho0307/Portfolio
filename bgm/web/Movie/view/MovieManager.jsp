<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*,  member.model.vo.*"%>

<%
	Movie movie = (Movie) request.getAttribute("movie");
	MovieFileLink movieLink = (MovieFileLink) request.getAttribute("movieLink");
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Movie</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
isLogin=false;
<%
if(loginUser!=null){
%>
isLogin=true;
<%}%>
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
		$("a").mouseover(function() {
			$(this).css("background", "black").css("color", "white");
		});
		$("a").mouseout(function() {
			$(this).css("background", "none").css("color", "black");
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
}

td {border-style: outset;
}

th {
	margin: 1em;
}

.box {
	width: 220px;
	height: 310px;
	margin: 1em;
	background: white;
}

hr {
	color: red;
	background-color: red;
}

/* html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	bachground:#f2f2f2;
	background-size: 100%;
} */

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
<header></header>
<body>
<%if(loginUser!=null&&loginUser.getManager()==0){ %>
	<center>
		<h1>
			영화 [<%=movie.getmName()%>] 정보 수정 페이지
		</h1>
		<form action="/bgm/mupdate" method="post"
			onsubmit="return validate();" style="width: 1150px;">
			<table style="width: 900px;">
				<tr>
					<td>영화아이디 :</td>
					<td><input type="text" id="mId" name="mId" placeholder="영화아이디"
						autofocus="autofocus" required="required" size="50"
						value="<%=movie.getmId()%>" readonly>수정 불가 입니다.</td>
				</tr>
				<tr>
					<td>영화제목 :</td>
					<td><input type="text" id="mName" name="mName"
						placeholder="영화제목" autofocus="autofocus" required="required"
						size="50" value="<%=movie.getmName()%>"></td>
				</tr>
				<tr>
					<td>감독 :</td>
					<td><input type="text" id="mDirector" name="mDirector"
						required="required" placeholder="감독" size="50"
						value="<%=movie.getmDirector()%>"></td>
				</tr>
				<tr>
					<td>출연 :</td>
					<td><textarea name="mCast" id="mCast" rows="2" cols="60"
							placeholder="출연(cast)"><%=movie.getmCast()%></textarea></td>
				</tr>
				<tr>
					<td>장르 :</td>
					<td><input type="text" id="mGenre" name="mGenre"
						required="required" placeholder="ex)판타지, 로맨틱" size="50"
						value="<%=movie.getmGenre()%>"></td>
				</tr>
				<tr>
					<td>등급 :</td>
					<td><select name="mAge" id="mAge" class="selectField">
							<option value="<%=movie.getmAge()%>"><%=movie.getmAge()%></option>
							<option value="전체 관람가">전체 관람가</option>
							<option value="7세 이용가">7세 이용가</option>
							<option value="12세 이용가">12세 이용가</option>
							<option value="15세 이용가">15세 이용가</option>
							<option value="19세 이용가">19세 이용가</option>
					</select>현재 <%=movie.getmAge()%></td>
				</tr>
				<tr>
					<td>개봉일 :</td>
					<td><input type="Date" name="mDate" id="mDate"
						required="required" placeholder="yyyymmdd로 입력" maxlength="8"
						value="<%=movie.getmDate()%>"></td>
				</tr>
				<tr>
					<td>공식사이트 주소 :</td>
					<td><input type="text" name="mSite" id="mSite"
						value="<%=movie.getmSite()%>"></td>
				</tr>
				<tr>
					<td>줄거리 :</td>
					<td><textarea name="mPlot" id="mPlot" rows="15" cols="80"><%=movie.getmPlot()%></textarea></td>
				</tr>
				<tr>
					<td>영화 가격 :</td>
					<td><input type="number" name="mPay" id="mPay" size="6"
						placeholder="숫자만 입력" value="<%=movie.getmPay()%>">원<label
						class='label' id='idLabel'></label></td>
				</tr>
				<tr>
					<td>포스터 주소 :</td>
					<td><input type="text" name="mSite1" id="mSite1" size="100"
						value="<%=movieLink.getMoviePoster()%>"></td>
				</tr>
				<tr>
					<td>예고편 주소 :</td>
					<td><input type="text" name="mMp4" id="mMp4" size="100"
						value="<%=movieLink.getMovieMp4()%>"></td>
				</tr>
				<%
					String img[] = new String[8];

					img[0] = movieLink.getMovieImg1();
					img[1] = movieLink.getMovieImg2();
					img[2] = movieLink.getMovieImg3();
					img[3] = movieLink.getMovieImg4();
					img[4] = movieLink.getMovieImg5();
					img[5] = movieLink.getMovieImg6();
					img[6] = movieLink.getMovieImg7();
					img[7] = movieLink.getMovieImg8();

					for (int i = 1; i < 9; i++) {
				%>
				<tr>
					<td>이미지 주소 (<%=i%>):
					</td>
					<td><input type="text" name="mImg<%=i%>" id="mImg<%=i%>"
						size="50" value="<%=img[i - 1]%>" rows="8"><input id="filename<%=i%>"type="file" name="filename" style="display:none" onchange="document.getElementById('mImg<%=i%>').value=this.value" >
						<%-- <input type="button" style="cursor:hand;" value="파일찾기" onclick="document.getElementById('filename<%=i%>').click();"> --%></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td>상영여부 :</td>
					<%
						int a = movie.getmYN();
						int aa;
						String b = "";
						String bb = "";
						if (a == 1) {
							b += "상영중";
							bb += "상영종료";
							aa = 2;
						} else {
							b += "상영종료";
							bb += "상영중";
							aa = 1;
						}
					%>
					<td><select name="mYN" id="mYN" class="selectField">
							<option value="<%=movie.getmYN()%>"><%=b%></option>
							<option value="<%=aa%>"><%=bb%></option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="수정하기">

						<button type="reset" value="리셋">리셋</button>
						</form>
						<form action="/bgm/mmlist" method="post"
							onsubmit="return validate();" style="width:100px;">
							<input type="submit" value="취소하기">
						</form>
						<form action="/bgm/mdelete" method="post"
							onsubmit="return validate();" style="width:100px;">
							<input type="submit" value="삭제하기" name="delete" id="delete">
							<input type="hidden" id="mId2" name="mId2" placeholder="영화아이디"
								autofocus="autofocus" required="required" size="3"
								value="<%=movie.getmId()%>" readonly>
						</form></td>
				</tr>
			</table>
			
	
	<%}else{ %>
<h1>권한이 없는 페이지 입니다</h1>
<br>
<input type="button" value="메인으로 돌아가기" onclick="location='/bgm/index.jsp'">
<input type="button" value="로그인 하기" onclick="location='/bgm/member/view/login.jsp'">
<%} %>
</center>
</body>
<footer></footer>

</html>