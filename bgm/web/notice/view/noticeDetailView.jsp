<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="notice.model.vo.Notice, member.model.vo.Member, 
				notice.model.vo.NoticeComment, java.util.*"%>
<%
	Member loginUser = (Member) session.getAttribute("loginUser");
	Notice notice = (Notice) request.getAttribute("notice");
	ArrayList<NoticeComment> list = (ArrayList<NoticeComment>)request.getAttribute("comment");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Detail View</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$('#header').load('/bgm/common/view/header.jsp');
		$('#footer').load('/bgm/common/view/footer.jsp');

		var start = 1;
		
		$("#btnSave").click(function(){
			var noticeno = "<%=notice.getNoticeNo()%>";
			var userid = "<%=loginUser.getUserId()%>";
			var content = $("#txtComment").val();
			
			$.ajax({
				url:"/bgm/ncomment"
				,type:"get"
				,data: {noticeno : noticeno, userid : userid, content : content, start : start}
				,dataType:"json"
				,success: function(data){
					
					var jsonStr = JSON.stringify(data);
					var jsonarr = JSON.parse(jsonStr);
					start = jsonarr.start;
					var userid = "";
					var content = "";
					var date = "";
					var value = "";
					
					for(var i=0 in jsonarr.list){
						userid = jsonarr.list[i].userid;
						content = jsonarr.list[i].content;
						date = jsonarr.list[i].date;
						
						value += "<li class='commentli'><div class='top'>" + userid + "<div class='topright'>"+ date + "</div></div>"
								+ "<div class='bottom'>" + content + "</div></li>";
						
						i++;
					} 
					$(".reply").html(value);
					$("#txtComment").val("");
				}
				,error:function(e){
					console.log("error");
					console.log(e);
				}
				
			}); 
		});
		
		$("#addBtn").click(function(){
			start*= 1;
			start += 5;
			var noticeno = "<%=notice.getNoticeNo()%>";
			
			$.ajax({
				url:"/bgm/ncomment"
				,type:"get"
				,data: {noticeno:noticeno, start : start}
				,dataType:"json"
				,success: function(data){
					
					var jsonStr = JSON.stringify(data);
					var jsonarr = JSON.parse(jsonStr);
					start = jsonarr.start;
					var userid = "";
					var content = "";
					var date = "";
					var value = "";
					
					for(var i=0 in jsonarr.list){
						userid = jsonarr.list[i].userid;
						content = jsonarr.list[i].content;
						date = jsonarr.list[i].date;
						
						value += "<li class='commentli'><div class='top'>" + userid + "<div class='topright'>"+ date + "</div></div>"
								+ "<div class='bottom'>" + content + "</div></li>";
						
						i++;
					} 
					$(".reply").append(value);
					$("#txtComment").val("");
				}
				,error:function(e){
					console.log("error");
					console.log(e);
				}
			}); 
		});
	});
	
	
	
</script>
<style>
#addBtn {
	position: relative;
	right: -500px;
	width: 120px;
	height: 30px;
	margin: auto;
}

#addBtnDiv {
	padding: auto;
}

.reply {
	margin-left: 110px;
}

.commentli {
	width: 800px;
	list-style: none;
	padding: 20px;
	border-top: 1px solid rgba(173, 116, 96, 0.3);
}

.top {
	position: relative;
	margin-bottom: 30px;
	font-size: 12px;
}

.topright {
	display: inline-block;
	position: absolute;
	right: 0;
}

.bottom {
	width: 700px;
}

#noticeContainer {
	width: 1150px;
	margin: 0 auto;
	padding: 0;
}

.content {
	width: 900px;
	background: rgb(245, 240, 235);
	padding: 0;
	margin: 0 auto;
}

.content #innerContent {
	margin: auto;
	margin-top: 30px;
	width: 780px;
	height: 200px;
}

.title #innerTitle {
	width: 900px;
	margin: 0 auto;
}

#innerTitle #detailTitle {
	font-size: 14pt;
	font-weight: bold;
}

#innerTitle #detailSub {
	font-size: 10pt;
}

#btnDiv {
	margin-top: 30px;
	text-align: center;
}

#listbtn, #alterbtn, #deletebtn {
	display: inline-block;
	position: relative;
	width: 80px;
	height: 30px;
	font-size: 16px;
	margin: 8px auto;
}

#commentContainer {
	border: 1px solid;
	width: 800px;
	margin: 0 auto;
	padding: 0;
}

#commentContainer #commentArea {
	position: relative;
	width: 80%;
	height: 100%;
	margin: 0;
	padding: 0;

}

#commentContainer #commentSubmit {
	display: inline-block;
	position: relative;
	right: 0;
	width: 18%;
	height: 98%;
}

/* 영화 - 영화 상세페이지 댓글 쓰기 */
.score_textarea {
	position:relative; 
	width:814px; 
	border-left:1px solid #dedede; 
	padding-right:118px; 
	box-sizing:border-box; 
	-webkit-box-sizing:border-box; 
	-moz-box-sizing:border-box;}

.score_textarea textarea {
	width:600px; 
	height:100px; 
	border:none; 
	box-sizing:border-box; 
	-webkit-box-sizing:border-box; 
	-moz-box-sizing:border-box; 
	font-size:18px; color:#666}
	
.score_textarea .btn_entry {
	position:absolute; 
	right:0; 
	top:0; 
	display:block; 
	width:118px; 
	height:96px; 
	background:#231f20; 
	font-size:18px; 
	font-weight:bold; 
	color:#cdc197; 
	text-align:center;
	line-height:101px; 
	border:0; 
	border-radius: 15px 15px 15px 15px; 
	outline: none;}

</style>
</head>
<header id="header"></header>
<body>
	<div id="noticeContainer">
		<div class="bTitle">
			<h2>고객센터 > <a href="/bgm/nlist">자유게시판</a></h2>
		</div>
		<p>
		<p>
		<form action="/bgm/nlist" method="post">
			<hr>
			<div class="title">
				<div class="title" id="innerTitle">
					<p class="bTitle" id="detailTitle"><%=notice.getNoticeTitle()%></p>
					<pre class="bTitle" id="detailSub">작성자 : <%=notice.getUserId()%>  |  영화관 : <%=notice.getCinemaId()%>  |  등록일 : <%=notice.getNoticeDate()%>  |  조회수 : <%=notice.getReadCount()%></pre>
				</div>
			</div>
			<hr>

			<div class="content">
				<div class="content" id="innerContent"><%=notice.getNoticeContent()%></div>
			</div>
			<div>
				<div id="btnDiv">
						<input type="submit" id="listbtn" value="목록" />
					<%
						if(loginUser != null && loginUser.getUserId().equals(notice.getUserId())) {
					%>
					<a href="/bgm/nalter?noticeno=<%=notice.getNoticeNo()%>">
						<input type="button" id="alterbtn" value="수정" />
					</a>			
					<a href="/bgm/ndelete?noticeno=<%=notice.getNoticeNo()%>">
						<input type="button" id="deletebtn" value="삭제" />
					</a>
					<% } %>
				</div>
			</div>
		</form>
		<div class="review_wrap" id="divReview" style="width:800px;margin-left:145px;">
            <div class="score_area">
               <fieldset style=" border-radius: 15px 15px 15px 15px;">
                  <legend class="Lang-LBL0000" >댓글 작성하기</legend>
                  <div class="score_textarea">
                     <textarea id="txtComment" name="comment" title="영화평 입력" placeholder="영화 관람평을 입력해 보세요!"cols="25" rows="9" style="outline: none;"></textarea>
                     <input type="button" class="btn_entry Lang-LBL0000" id="btnSave" value="입력" >
                  </div>
               </fieldset>
            </div>
		</div>
		<div>
			<ul class="reply">
			<%for(NoticeComment comment : list) { %>
				<li class='commentli'>
					<div class='top'>
					<%= comment.getUserId()%>
						<div class='topright'>
						<%= comment.getCommentDate()%>
						</div>
					</div>
					<div class='bottom'>
					<%= comment.getCommentContent()%>
					</div>
				</li>
			<%} %>
			</ul>
		</div>
		<input type="button" id="addBtn" value="5개 더보기 "/>
	</div>
</body>
<footer id="footer"></footer>
</html>


