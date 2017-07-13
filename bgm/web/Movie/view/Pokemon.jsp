
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="movie.model.vo.*, java.text.*, java.util.*,  member.model.vo.*"%>

<%
	Movie movie = (Movie) request.getAttribute("movie");
	MovieFileLink movieLink = (MovieFileLink) request.getAttribute("movieLink");
	ArrayList <MovieComment> movieMap = (ArrayList <MovieComment>)request.getAttribute("movieMap");
	Member loginUser = (Member)session.getAttribute("loginUser");
	int ii=0;
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>영화 상세 페이지</title>
<style>

/* 동영상 플레이어 */
.jp-audio *:focus, .jp-audio-stream *:focus, .jp-video *:focus {
	outline: none;
}

.jp-audio button::-moz-focus-inner, .jp-audio-stream button::-moz-focus-inner,
	.jp-video button::-moz-focus-inner {
	border: 0;
}

.layer_popup {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	z-index: 9999
}




</style>

 <style>


/* 영화 - 영화 상세페이지 댓글 쓰기 */


.score_textarea {position:relative; float:right; width:760px; border-left:1px solid #dedede; padding-right:118px; box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box;}
.score_textarea textarea {width:560px; height:100px; border:none; box-sizing:border-box; -webkit-box-sizing:border-box; -moz-box-sizing:border-box; font-size:18px; color:#666}
.score_textarea .btn_entry {position:absolute; right:0; top:0; display:block; width:118px; height:96px; background:#231f20; font-size:18px; font-weight:bold; color:#cdc197; text-align:center; line-height:101px; border:0; border-radius: 15px 15px 15px 15px; outline: none;}/*1113*/
.score_etc {position:absolute; right:0; top:-24px; font-size:13px; color:#666}



  </style>



<style type="text/css">
img.img1 {
	
	width: 784px;
	border-radius: 20px 20px 20px 20px;
}

img#a {
	height: 400px;
}

center{
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	/* background-image: url("/bgm/Movie/영화포스터/ufomxgheugk-todd-diemer.jpg"); */
	background-size: 100%;
	font-size:12px; font-family:"나눔 고딕", 'Nanum Gothic', 'ng'; font-weight:400; color:#555; line-height:2;
/* background-color:rgba(1,1,1,0.6); */
}

center {
	margin: 0px;
	padding: 0px;
}
</style>

<style type="text/css">
ul, li {
	list-style: none;
}

#wrap {
	margin: 0px auto;
	width: 784px;
	height: 500px;
	overflow: hidden;
	position: relative;
}

#slideConteiner {
	width: 6273px;
	position: absolute;
	-webkit-transition: all 1.2s ease-in-out;
	-moz-transition: all 1.2s ease-in-out;
	-o-transition: all 1.2s ease-in-out;
}

#slideConteiner img {
	float: left;
}

#slideBar {
	position: relative;
	margin: 450px auto;
	width: 120px;
}

#slideBar a {
	float: left;
	width: 15px;
	height: 15px;
	background: url(/bgm/Movie/영화포스터/dots.png) no-repeat;
}

#slideBar a.active {
	background-position: 0 -30px;
}
</style>

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

		$(".btn").click(function() {
			var isHidden = $("#div1").is(":hidden");
			if (isHidden) {
				$("#div1").show(2000);
			} else {
				$("#div1").hide(2000);
			}

		});
		
		$(".btn2").click(function() {
			$("#jquery_jplayer_1").append("<viedo id='video1' controls name='media' style='border-radius: 0px 0px 30px 30px;'><source src='<%=movieLink.getMovieMp4()%>' type='video/mp4'></viedo><video id='video2' autoplay ='' controls=''  name='media' width='970'height='548' style='border-radius: 30px 30px 30px 30px;'><source src='<%=movieLink.getMovieMp4()%>' type='video/mp4'></video>");
			$("#div2").show();
           
		});
		$(".btn3").click(function(e) {
			$("#video1").remove();
			$("#video2").remove();
			$("#div2").hide();
	});
 
		
	});
	
	$(document).ready(function(){
		document.oncontextmenu = new Function('return false');
	 	document.ondragstart = new Function('return false');
	 	document.onselectstart = new Function('return false');

	 	$(function() {function updateInputCount() {
	 		var cc =$('textarea');
	  	var textLength = $('textarea').val().length;
	  	var count = textLength;
	  	$('span.input-counter1').text(count);
	  		if (count >= 140) {
	  			 cc.value =cc.substring(0,140);
	  			 cc.focus();
	   			/* $('span.input-counter1').addClass('disabled'); */
	  		} else {
	   			$('span.input-counter1').removeClass('disabled');
	  		}
		}

		$('textarea')
	  	.focus(updateInputCount)
	  	.blur(updateInputCount)
	  	.keypress(updateInputCount);
	  	window.setInterval(updateInputCount, 100);
	  	updateInputCount();
	 	});
	});
	
	
</script>



</head>
<header> </header>
<body>
	<center><br> <br> <br> <br> <br> <br>
	<!-- <button class="btn">이미지보기</button>
			<button class="btn2">동영상보기</button> -->

			
			
			
			<div id="div1" style="width: 1150px; height: 545px; background: black; color: #fff; border-radius: 40px 40px 40px 40px; ">
				
				<div id="wrap">
				
					<div id="slideConteiner">
						<!-- style="width:100%; height:590px; background: black; " -->
						<br> <br>
						<div id="dd" style="top:205px; left:330px; position:absolute; z-index:10;">
						<a class="btn2" href="#"
						title="동영상 보기"><img src="/bgm/Movie/영화포스터/btnc_play.png"></a>
						</div>
						
				<img src="<%=movieLink.getMovieImg1()%>" class="img1"><a
						href="<%=movieLink.getMovieImg2()%>" class="movie"><img
						src="<%=movieLink.getMovieImg2()%>" class="img1"></a> <a
						href="<%=movieLink.getMovieImg3()%>" class="movie"><img
						src="<%=movieLink.getMovieImg3()%>" class="img1"></a> <a
						href="<%=movieLink.getMovieImg4()%>" class="movie"><img
						src="<%=movieLink.getMovieImg4()%>" class="img1"></a>
					<%
						if (movieLink.getMovieImg5() != null) {
					%>
					<a href="<%=movieLink.getMovieImg5()%>" class="movie"><img
						src="<%=movieLink.getMovieImg5()%>" class="img1"></a>
					<%
						}
						if (movieLink.getMovieImg6() != null) {
					%>
					<a href="<%=movieLink.getMovieImg6()%>" class="movie"><img
						src="<%=movieLink.getMovieImg6()%>" class="img1"></a>
					<%
						}
						if (movieLink.getMovieImg7() != null) {
					%>
					<a href="<%=movieLink.getMovieImg7()%>" class="movie"><img
						src="<%=movieLink.getMovieImg7()%>" class="img1"></a>
					<%
						}
						if (movieLink.getMovieImg8() != null) {
					%>
					<a href="<%=movieLink.getMovieImg8()%>" class="movie"><img
						src="<%=movieLink.getMovieImg8()%>" class="img1"></a>
					<%
						}
					%>
				</div>
				<ul id="slideBar">
					<li><a id="a<%=0 %>" href="#slideConteiner" class="active" data-left="0px"></a></li>
					<li><a id="a<%=1 %>" href="#slideConteiner" data-left="-784px"></a></li>
					<li><a id="a<%=2 %>" href="#slideConteiner" data-left="-1568px"></a></li>
					<li><a id="a<%=3 %>" href="#slideConteiner" data-left="-2352px"></a></li>
					<%
						if (movieLink.getMovieImg5() != null) {ii=5;
					%>
					<li><a id="a<%=4 %>" href="#slideConteiner" data-left="-3136px"></a></li>
					<%
						}
						if (movieLink.getMovieImg6() != null) {ii=6;
					%>
					<li><a id="a<%=5 %>" href="#slideConteiner" data-left="-3920px"></a></li>
					<%
						}
						if (movieLink.getMovieImg7() != null) {ii=7;
					%>
					<li><a id="a<%=6 %>" href="#slideConteiner" data-left="-4704px"></a></li>
					<%
						}
						if (movieLink.getMovieImg8() != null) {
					%>
					<li><a id="a<%=7 %>" href="#slideConteiner" data-left="-5488px"></a></li>
					<%
					ii=8;	}
					%>
				</ul>
				<script>
				var i=0; var jj=<%=ii%>;
				setInterval(function(){
					
					i++;if(i<jj){
					$('#slideBar a').removeClass('active')
					$('#slideBar #a'+i).addClass('active');
					var dataLeft = $('#slideBar  #a'+i).attr('data-left');
					$('#slideConteiner').animate({
						left : dataLeft
					}, "fast");}else{i=0;
						$('#slideBar a').removeClass('active')
						$('#slideBar #a'+i).addClass('active');
						var dataLeft = $('#slideBar  #a'+i).attr('data-left');
						$('#slideConteiner').animate({
							left : dataLeft
						}, "fast");
					}
				},6000); 
				
					$(document).ready(function() {
						$('#slideBar a').click(function() {
							$('#slideBar a').removeClass('active')
							$(this).addClass('active');
							var dataLeft = $(this).attr('data-left');
							$('#slideConteiner').animate({
								left : dataLeft
							}, "fast");
						});

					});
				</script>

			</div>
			<br> <br>
			</div>
<form id = "comment" action="/bgm/mcomment" method="post"
			onsubmit="return validate();" style="margin: 0px; padding: 0px; width: 1150px; background:white;">
			<input type="hidden" id="mId" name="mId" value="<%=movie.getmId()%>">
			<%if(loginUser!=null){ %>
			<input type="hidden" id="uId" name="uId" value="<%= loginUser.getUserId() %>">
			<%} %>
			
			<br><br><table style="width: 784px;"><tr><td>
			<h1><%=movie.getmName()%></h1><hr style="width: 784px;">
			</td></tr>
			</table>
			
			<div class="box-image">
				<table style="width: 100px; height: 315px;">
					<tr>
						<td><a href="<%=movieLink.getMoviePoster()%>"
							title="포스터 크게 보기 새창" target="_blank"> <span
								class="thumb-image"> <img
									src="<%=movieLink.getMoviePoster()%>" id="a" />
							</span>
						</a> </a></td>
						<td><h3><table class="tb" style="width: 495px; height: 440px;">
				<tr>
				<% double all= movie.getAll();
				double reserve = movie.getMovieReserve(); 
				
				 double r = 100*(reserve/all); 
				 DecimalFormat d = new DecimalFormat("0.0");
				
				%>
					<td>예매율 : <%=d.format(r)%>%</td>
				</tr>
				<tr>
					<td>감독 : <%=movie.getmDirector()%></td>
				</tr>
				<tr>
					<td>출연 : <%=movie.getmCast()%>
					</td>
				</tr>
				<tr>
					<td>장르 : <%=movie.getmGenre()%></td>
				</tr>
				<tr>
					<td>등급 : <%=movie.getmAge()%></td>
				</tr>
				<tr>
					<td>개봉일 : <%=movie.getmDate()%></td>
				</tr>
				<%if(movie.getmSite()==null){}else{ %>
				<tr>
					<td>공식사이트 : <a href="<%=movie.getmSite()%>"><%=movie.getmSite()%></a></td>
				</tr><%} %>
				<tr>
					<td>영화금액 : <%=movie.getmPay()%>원</td>
				</tr>
				<tr>
					<td><a href="/bgm/rsv">예매하기</a></td>
				</tr>
			</table></h3></td>
					</tr>
				</table>
				
			</div>
			
			<div class="sect-base-movie">
				
				

			</div>
			
			<table style="width:784px; height:440px;"><tr><td><div class="sect-story-movie" style="width:784px;">
			<h1>시놉시스</h1>

				
				<hr style="width: 784px;">
				<br>
				<h3>
					<pre style="width:784px;"><%=movie.getmPlot()%></pre>
			</div></td></tr></h3></table>
			

			
			<br>
			
			<div class="review_wrap" id="divReview" style="width:784px;">

				<div class="score_area">
					
					<fieldset style="border-radius: 15px 15px 15px 15px;">
						<legend class="Lang-LBL0000" >리뷰 작성하기</legend>
						
						<div class="score_textarea">
						<%if(loginUser!=null){ %>
							<textarea id="txtComment" name="txtComment" title="영화평 입력" placeholder="영화 관람평을 입력해 보세요!"cols="23" rows="9" style="outline: none;"  onclick="docheck()" onkeyup="javascript:doleft();"></textarea>
							<input type="submit" class="btn_entry Lang-LBL0000" href="javascript:void(0)" id="btnSave" value="입력" >
						<%}else{ %>
						<textarea id="txtComment2" name="txtComment2" title="영화평 입력" placeholder="로그인 후 입력 가능합니다!"cols="23" rows="9" style="outline: none;"readonly></textarea>
							<a class="btn_entry Lang-LBL0000" href="/bgm/member/view/login.jsp?mname=" + mname + "&cname=" + cname + "&dname=" + dname + "&tname=" + tname" id="btnSave2" >로그인</a>
						<%} %>
						</div>
						
					</fieldset><p class="byte"><span class="input-counter1">0</span>/140</p><hr style="width: 784px;">
					 
					
				</div>

<div id="c0" style="width:784px;">
 <% int i; int j =1;
for (i=0; i<movieMap.size(); i++) {
	
	MovieComment mcomment = movieMap.get(i); 
	if(i<5){
	%>

				<table style="width:784px;">
<tr>
	<td><table style="width:600px;">
	<tr>
		<td><textarea readonly  onkeyup="fc_chk_byte(this, 80)" cols="23" style="outline: none; width:560px; height:50px;  border:none; box-sizing:border-box;"><%=mcomment.getmComment() %></textarea></td>
	</tr>
	</table><%=mcomment.getcDate() %></td>
	<%if(loginUser==null){ %>
	<td><%=mcomment.getUserId() %></td>
	
	<%}else if(loginUser!=null&&loginUser.getUserId().equals(mcomment.getUserId())||loginUser.getManager()==0){ %>
	<td><table>
	<tr>
	<td><%=mcomment.getUserId() %></td>
	</tr></table><a href="/bgm/deletec?userid=<%=mcomment.getcNumber()%>&movieid=<%=movie.getmId()%>">삭제</a></td>
	<%}else{ %>
	<td><%=mcomment.getUserId() %></td>
	<%} %>
</tr>
</table>
<hr style="width: 784px;">
				<%}else if(i%5==0){%>
				</div>
				<div id="c<%=j%>" style="display:none;">	
				<table style="width:784px; ">
<tr>
	<td><table style="width:600px;">
	<tr>
		<td><textarea readonly  onkeyup="fc_chk_byte(this, 80)" cols="23" style="outline: none; width:560px; height:50px;  border:none; box-sizing:border-box;"><%=mcomment.getmComment() %></textarea></td>
	</tr>
	</table><%=mcomment.getcDate() %></td>
	<%if(loginUser!=null&&loginUser.getUserId().equals(mcomment.getUserId())){ %>
	<td><table>
	<tr>
	<td><%=mcomment.getUserId() %></td>
	</tr></table><a href="/bgm/deletec?=<%=mcomment.getcNumber()%>">삭제</a></td>
	<%}else{ %>
	<td><%=mcomment.getUserId() %></td>
	<%} %>
</tr>
</table>
<hr style="width: 784px;">

				<%  j++;}else if(i%5!=0){%>
					<table style="width:784px;">
					<tr>
						<td><table style="width:600px;">
						<tr>
							<td><textarea readonly  onkeyup="fc_chk_byte(this, 80)" cols="23" style="outline: none; width:560px; height:50px;  border:none; box-sizing:border-box;"><%=mcomment.getmComment() %></textarea></td>
						</tr>
						</table><%=mcomment.getcDate() %></td>
						<%if(loginUser!=null&&loginUser.getUserId().equals(mcomment.getUserId())){ %>
	<td><table>
	<tr>
	<td><%=mcomment.getUserId() %></td>
	</tr></table><a href="/bgm/deletec?=<%=mcomment.getcNumber()%>">삭제</a></td>
	<%}else{ %>
	<td><%=mcomment.getUserId() %></td>
	<%} %>
					</tr>
					</table>
					<hr style="width: 784px;">
	<% 			}else if(i==movieMap.size()-1){%>
		<table style="width:784px;">
		<tr>
			<td><table style="width:600px;">
			<tr>
				<td><textarea readonly  onkeyup="fc_chk_byte(this, 80)" cols="23" style="outline: none; width:560px; height:50px;  border:none; box-sizing:border-box;"><%=mcomment.getmComment() %></textarea></td>
			</tr>
			</table><%=mcomment.getcDate()%></td>
			<%if(loginUser!=null&&loginUser.getUserId().equals(mcomment.getUserId())){ %>
	<td><table>
	<tr>
	<td><%=mcomment.getUserId() %></td>
	</tr></table><a href="/bgm/deletec?=<%=mcomment.getcNumber()%>">삭제</a></td>
	<%}else{ %>
	<td><%=mcomment.getUserId() %></td>
	<%} %>>
		</tr>
		</table>
		<hr style="width: 784px;">
		</div>
	<%}
	
} %> 
	</div>		
	
	<input type="button" id="bbb" value="이전">
	
	<%for(int k=1;k<=j;k++){
	%>
		<a id="aaa<%=k%>"><%=k %></a>
		
			<div id="ddd<%=k%>" style="display:none;"><a id="aaa<%=k%>"><%=k %></a></div>
		<%}	%>
		
	
					<input type="button" id="aaa" value="다음">	
		</form>
		
		
<script>
var count =0; var j=<%=j%>;
$("#aaa").click(function(){
	if(count==j-1){}else{
	$("#c"+count).hide();
	count++;
	$("#c"+count).show();
	}
	


});
 $("#bbb").click(function(){
	if(count==0){
	}else{
	$("#c"+count).hide();
	count--;
	$("#c"+count).show();
	}
}); 
</script>		
		
		
	
		<div  id="div2" class="layer_popup" tabindex="0" style="display: none; background-color:rgba(1,1,1,0.6)" >
							<div class="jp-video jp-video-360p jp-video-270p"
								id="jp_container_1" tabindex="0"
								style="position: absolute; top: 50%; left: 50%; background-color:rgba(1,1,1,0); height: 800px; margin-left: -485px; margin-top: -274px; z-index: 9999; outline: none; ">
								<div class="jp-type-single" tabindex="0">
									<div id="jquery_jplayer_1" class="jp-jplayer"
										style="width: 100%; height: 100%;" tabindex="0">
										
									</div>
									<div class="jp-interface" tabindex="0">
										
										<div class="jp-progress" tabindex="0">
											<div class="jp-seek-bar" tabindex="0" style="width: 100%;">
												<div class="jp-play-bar" tabindex="0"
													style="width: 66.1212%; overflow: hidden;">
													<a href="#"></a>
												</div>
											</div>
										</div>
										
									</div>
								</div>
								<div style="position:absolute; right:20px; top:20px; width:22px; height:23px;"><a href="#"class="btn3"><img src="/bgm/Movie/영화포스터/btn_close04.png"></a></div>
							</div>
						</div>
					</div>
		
		
		
		
	</center>
</body>
<footer></footer>
</html>