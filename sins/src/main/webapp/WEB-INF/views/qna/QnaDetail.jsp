<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>


<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qnaDetail.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">

<script>


$(document).ready(function(){
	
	
	$("#t-l").click(function(){
		$("#spot1, #overlay_t").show(300);
	}); 
 	$("#overlay_t").click(function(e){ 
     	e.preventDefault(); 
     	$("#spot1, #spot2, #overlay_t").hide(300); 
	});
 	$("#t-r").click(function(){
 		$("#spot2, #overlay_t").show(300);
 	}); 
 	
 	var noticeMenuStatus = 0;
 	$(".notice").hide();
 	
 	$("#notice1, #notice2").click(function(){
 		if(noticeMenuStatus == 0){
 			noticeMenuStatus = 1;
 			$(".notice").slideDown("slow");
 		}
 		else {
 			noticeMenuStatus = 0;
 			$(".notice").slideUp("slow");
 		}
 		
 	});
 	
 	setTimeout(function(){
 		$('#friend').html(friendTag);
 		
 	},500);
 	
});



	$(document).on(
			"click",
			"#submitBtn",
			function() {

				var comment = $("#comment").val();

				if (comment.length != 0) {

					$.ajax({

						url : 'insertCom.n?qnaNo=${qna.qnaNo}&lev=0&content='
								+ comment,

						dataType : 'json',

						contentType : 'application/json; charset=utf-8',

						success : function(result) {

							var tag = "";

							$("answer").html("");
							
						

							for (var i = 0; i < result.comList.length; i++) {
								
								
								tag += "<tr><td style='width:15%;'>" + "관리자 "
										+ "</td><td style='width:60%;'>"
										+ result.comList[i].content + "</td>";
									if(${loginUser eq 'admin'}){
										tag+= "<td style='width:25%;'>"
										+ "<button id='deleteBtn' value='"+result.comList[i].commentNo+"'>삭제 하기</button>"
										+ "</td>";
									}
										
									tag+="</tr>";
								

							}

							

							$("#comTable > tbody").html(tag);

							$("#comment").val("");

						}

					});

				} else {
					alert("댓글을 입력해주세요.");
				}

			});
	
	
	function writeForm(){
		location.href="alink.do?path=qna/QnaWrite";
		
	}
	
	
	$(document).on("click", "#deleteBtn", function(){
		var comNo=$(this).val();
		var qnaNo='${qna.qnaNo}';
		$.ajax({

			url : 'deleteCom.n?comNo='+comNo+'&qnaNo='+qnaNo,
					

			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {
				alert("삭제되었습니다");
				
				var tag = "";

				$("answer").html("");

				for (var i = 0; i < result.comList.length; i++) {
					
					
					tag += "<tr><td style='width:15%;'>" + "관리자 "
							+ "</td><td style='width:60%;'>"
							+ result.comList[i].content + "</td>";
							
						if(${loginUser eq 'admin'}){	
						tag+= "<td style='width:25%;'>"
							+ "<button id='deleteBtn' value='"+result.comList[i].commentNo+"'>삭제 하기</button>"
							+ "</td>";
						}
							
					tag+="</tr>";

				}

				

				$("#comTable > tbody").html(tag);

				$("#comment").val("");

			}
		
		});
	});
	
	
	
	function deleteQna(){
		if (confirm("정말 삭제하시겠습니까??") == true){  

			location.href='deleteQna.n?qnaNo=${qna.qnaNo}';
		}
			
	}
	
	
</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
	<div id="top"></div>

		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
        
	        <ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="selectChannelList.l">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><a href="newsfeed.b">뉴스피드</a></li>
	          <li id="notice1"><label class="notice1" style='cursor:pointer;'>고객센터</label></li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><h4>└QNA</h4></li>
	         
	        </ul>
      	</div>
		<div id="content" class="box">
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a></strong><br>
			<br>

			<div id="detailDiv">
				<h2>
					<strong>${qna.title }</strong>
					<button  class="buttons" onclick="writeForm()">질문하기</button>


				</h2>
				<br>
				<hr />
				<label class="labels">
				
				작성자 : <c:set var="sym" value="${fn:indexOf(qna.userId, '@') }"/>
						 <c:out value="${fn:substring(qna.userId, 0, sym)} "/>
				</label>
				<label  class="labels">작성일 :
					${qna.writeDate }</label> <label  class="labels">조회수
					: ${qna.readCount }</label> <br>
				<hr />
				<br>
				<table>
					<tr>
						<td style='padding:30px; '><a href="mypage2.b?userid=${qna.userId }"><img src="${pageContext.request.contextPath}/resources/file/${qna.userId}/${qna.userProfile }" style='width:70px;height:70px;'></a></td>
						<td style='padding:10px;'>${qna.content }</td>
					</tr>
					
					
					
					
					
				</table>
				<br>
				
				<c:if test="${qna.userId eq loginUser.userId }">
				<button id='adjustBtn' onclick="location.href='adjustQna.n?qnaNo=${qna.qnaNo}'">수정</button>
				
				<button id='delBtn' onclick="deleteQna();">삭제</button>
				</c:if>
				<br>
				<hr/>

				<strong>답변</strong> <br>

				<div id="comLocation">

					<c:if test="${empty commentList }">
						<label id ="answer">등록된 답변이 없습니다</label>

					</c:if>


					<table id="comTable" >

					<tbody>

						<c:forEach var="comment" items="${commentList}">

							
							<tr>
								<td style='width:15%'><c:out value="관리자 "/></td>
								<td style='width:60%'>${comment.content }</td>
												<c:if test="${loginUser.userId eq 'admin' }">

								<td style='width:25%'>
									<button id='deleteBtn' value='${comment.commentNo }'>삭제 하기</button>	
										
								</td>
								
								</c:if>
							</tr>


						</c:forEach>
					</tbody>
					</table>

				</div>
				
				
				<hr />


				<c:if test="${loginUser.userId eq 'admin' }">
				<div id="comForm">
					<label class="labels" style='font-size: 15px; margin: 30px;'><strong>답글</strong></label>
					<textarea id="comment" rows="4" cols="50"
						style="overflow: hidden; float: left; margin-top: 20px;"></textarea>


					<button id="submitBtn" style='left: 80px; margin-top: 20px;'
						class="buttons">등록하기</button>


				</div>
				</c:if>
				<hr />




			</div>


		</div>
		<div id="right" class="box">
			
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div> 
	<div id="spot1">
		<ul>
			<li><a href="mypage.b">MyPage</a></li>
			<li><a href="friendList.n">친구 목록 보기</a></li>
			<li><a href="mypagePoto.b?userid=${ memberUser.userId }">사진 보기</a></li>
			<li><a href="selectChannelList.l">채널</a></li>
			<li><a href="selectGroupList.y">그룹</a></li>
			<li><a href="newsfeed.b">뉴스피드</a></li>
			<li id="notice2">고객센터</li>
			<li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
			<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
			<li class="notice"><a href="selectQna.n">└QNA</a></li>
		</ul>
	</div>
	<div id="spot2">
		<ul>
			<li><a href="javascript:goMyInfo()">내 정보보기</a></li>
			<li><a href="javascript:message();">메세지 보기</a></li>
			<li><a href="alertlist.j">알림 보기</a></li>
			<li><a href="javascript:logout()">로그 아웃</a></li>
		</ul>
		<hr style="width: 100px; margin: auto;">
		<br />
		<h4 align="center">친구 목록</h4>
		<br>
		<hr style="width: 100px; margin: auto;">
		<div id='friend'></div>

	</div>

	<div id="spot3">
		<c:import url="../common/top.jsp" charEncoding="UTF-8" />
	</div>
	
</body>
</html>