 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 상세 페이지</title>
<style type="text/css">
img.img1 {
	height: 500px;
}
img#a{
height: 315px;
}
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	background-image: url('../영화포스터/12_alstjrrl2003.jpg');
	background-size: 100%;
}

</style>

<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('/bgm/common/view/header.html');
		$('footer').load('/bgm/common/view/footer.html');
		
		$("#btn").click(function(){
			var isHidden = $("#div1").is(":hidden");
			if(isHidden){
				$("#div1").show(2000);
			}else{
				$("#div1").hide(2000);
			}
			
		});
	});
</script>

</head>
<header></header>
<body><br>
<br><br><br><br><br>
<center>
    <hr>
    <h1>영화 상세 페이지</h1>
    <br>
     <button id = "btn">이미지보기</button>
         <div id = "div1"style="width:100%; height:590px; background: black; display : none;">
         
         <br><br><a href="/bgm/Movie/영화포스터/판도라이미지/판도라이미지4.jpg" class="movie" title="이미지 크게 보기 새창" target="_blank"><img
					src="/bgm/Movie/영화포스터/판도라이미지/판도라이미지4.jpg" class="img1"></a>
			<!-- <td><a href="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (2).jpg" class="movie"><img
					src="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (2).jpg"></a></td>
			<td><a href="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (3).jpg" class="movie"><img
					src="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (3).jpg"></a></td>
			<td><a href="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (4).jpg" class="movie"><img
					src="/bgm/Movie/영화포스터/포켓몬이미지/movie_image (4).jpg"></a></td> -->
		
         </div>
           


<hr>
<h1>판도라</h1>
<br>
<div class="box-image">
<table style="width:100px; height:315px;">
  <tr>
	<td>
        <a href="/bgm/Movie/영화포스터/판도라.png" title="포스터 크게 보기 새창" target="_blank">
            <span class="thumb-image"> 
                <img src="/bgm/Movie/영화포스터/판도라.png" id="a"/>
            </span> </a>
        
    </td><td><viedo controls autoplay name="media">
<source src="/bgm/Movie/예고편/판도라.mp4" type="video/mp4">
<video controls="" autoplay="" name="media" width="560" height="315"><source src="/bgm/Movie/예고편/판도라.mp4" type="video/mp4"></video>
</td>
  </tr>
  </table>
  <a href="/bgm/Movie/영화포스터/포켓몬스터.png" target="_blank">포스터 크게 보기</a>
  <a href="/bgm/reserve/reserve.jsp">예매하기</a>
  </div>
  <table  class="tb"  style="width:600px; height:100px;">
	<tr>
		<td>예매율 : </td>
	</tr>
	<tr>
		<td>감독 : 박정우</td>
	</tr>
	<tr>
		<td>출연 : 김남길, 김영애</td>
	</tr>
	<tr>
		<td>장르 : 드라마, 스릴러</td>
	</tr>
	<tr>
		<td>등급 : 12세 이상</td>
	</tr>
	<tr>
		<td>개봉일 : 2016.12.07</td>
	</tr>
	<tr>
		<td>공식사이트 : <a href="http://pandoramovie.modoo.at/">http://pandoramovie.modoo.at/</a></td>
	</tr>
	</table>
<div class="sect-base-movie">
<hr>
    <h3><strong>판도라</strong>줄거리</h3>
    
    </div>
            <div class="sect-story-movie">
<pre>대한민국이 위험하다!
역대 최대 규모의 강진에 이어 원자력 폭발 사고까지
 예고 없이 찾아온 초유의 재난 앞에 한반도는 일대 혼란에 휩싸이고
 믿고 있던 컨트롤 타워마저 사정없이 흔들린다.
 방사능 유출의 공포는 점차 극에 달하고
 최악의 사태를 유발할 2차 폭발의 위험을 막기 위해
 발전소 직원인 ‘재혁’과 그의 동료들은
 목숨 건 사투를 시작하는데…!</Pre>
                
            </div><!-- .sect-story -->
            
            <hr>
            <br>
            <h1>댓글</h1>
     </center>
</body>
<footer></footer>
</html>