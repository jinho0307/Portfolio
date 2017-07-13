<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function validate(){
	//폼에 입력된 값에 대한 유효성 검사함
	//글자 갯수나 정규표현식 적용 확인
	//문제 있으면 return false; 함 => 전송 안됨
	return true;
});
	

</script>
<script type="text/javascript">
$(function(){
				
	
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
}
td{
border-style:outset;
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
	/* background-image: url('/bgm/Movie/영화포스터/12_alstjrrl2003.jpg'); */
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
	<center>
		<h1>영화 정보 추가 페이지</h1>
		<form action="/bgm/minsert" method="post"
			onsubmit="return validate();" style="width: 1150px;">
			<table style="width: 900px;">
				<tr>
					<td>영화제목 :</td>
					<td><input type="text" id="mName" name="mName"
						placeholder="영화제목" autofocus="autofocus" required="required"
						size="50"></td>
				</tr>
				<tr>
					<td>감독 :</td>
					<td><input type="text" id="mDirector" name="mDirector"
						required="required" placeholder="감독" size="50"></td>
				</tr>
				<tr>
					<td>출연 :</td>
					<td><textarea name="mCast" id="mCast" rows="2" cols="60" placeholder="출연(cast)"></textarea></td>
				</tr>
				<tr>
					<td>장르 :</td>
					<td><input type="text" id="mGenre" name="mGenre"
						required="required" placeholder="ex)판타지, 로맨틱" size="50"></td>
				</tr>
				<tr>
					<td>등급 :</td>
					<td><select name="mAge" id="mAge"
						class="selectField">
							<option value="전체 관람가">전체 관람가</option>
							<option value="7세 이용가">7세 이용가</option>
							<option value="12세 이용가">12세 이용가</option>
							<option value="15세 이용가">15세 이용가</option>
							<option value="19세 이용가">19세 이용가</option>
					</select></td>
				</tr>
				<tr>
					<td>개봉일 :</td>
					<td><input type="Date" name="mDate" id="mDate"required="required"
						placeholder="yyyymmdd로 입력" maxlength="8"></td>
				</tr>
				<tr>
					<td>공식사이트 주소 :</td>
					<td><input type="text" name="mSite" id="mSite"></td>
				</tr>
				<tr>
					<td>줄거리 :</td>
					<td><textarea name="mPlot" id="mPlot"rows="15" cols="80"></textarea></td>
					</tr>
					<tr>
					<td>영화 가격 :</td>
					<td><input type="number" name="mPay" id="mPay" size="10" placeholder="숫자만 입력">원<label class='label' id='idLabel'></label></td>
				</tr>
						<tr>
					<td>영화 포스터 주소 :</td>
					<td><input type="text" name="mPoster" id="mPoster" size="100" value=""></td>
				</tr>
				<tr>
					<td>예고편 주소 :</td>
					<td><input type="text" name="mMp4" id="mMp4" size="100" value=""></td>
				</tr>
				<%for(int i=1;i<9;i++){ %>
				<tr>
					<td>이미지 주소 (<%=i %>):</td>
					<td><input type="text" name="mImg<%=i %>" id="mImg<%=i %>" size="50" value="" rows="8"></td>
				</tr>
				<%} %>
					<td></td>
					<td align="center"><input type="submit" value="추가">
						<button type="reset" value="리셋">리셋</button>
						<button type="button" onclick="취소">취소</button></td>
					
				</tr>
			</table>
		</form>
	</center>
</body>
</html>