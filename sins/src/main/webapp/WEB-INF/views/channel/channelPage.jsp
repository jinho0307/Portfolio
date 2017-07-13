<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/mypage/mypage-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script type="text/javascript">
$(document).ready(function() {
			
		 	
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
			jQuery.fn.center = function() {
				this.css("position", "absolute");
				this.css("top", Math.max(0, (($(window).height() - $(this)
						.outerHeight()) / 2)
						+ $(window).scrollTop())
						+ "px");
				this.css("left", Math.max(0, (($(window).width() - $(this)
						.outerWidth()) / 2)
						+ $(window).scrollLeft())
						+ "px");
				return this;
			}

			$(".openMask").click(function(e) {
				e.preventDefault();
				wrapWindowByMask();
			});

			//닫기 버튼을 눌렀을 때
			$(".window .cancelBtn").click(function(e) {
				//링크 기본동작은 작동하지 않도록 한다.
				e.preventDefault();
				$("#mask, .window").hide();
			});

			//검은 막을 눌렀을 때
			$("#mask").click(function() {
				$(this).hide();
				$(".window").hide();

			});

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
 	
		 	
			 setTimeout(function(){
			 $('#friend').html(friendTag);
			 		
			 },500);
			 	
			// 댓글 신고
				$(document).on("click", ".commentFire", function(){
			var commentNo = $(this).prev().val();
			var classify = "CHANNEL_COMMENT";
			var fireId = $(this).prev().prev().val();
			var fireNo = $(this).prev().prev().prev().val();
			var lev = 1;
			
			var th = $(this);
			var th2 = $(this).parent();
			
		 	$.ajax({
				url : "fireComment.k",
				type : "post",
				data : {
					"fireNo" : fireNo,					
					"commentNo" : commentNo,
					"classify" : classify,
					"fireId" : fireId,
					"lev" : lev
				},
				success : function(data) {
					th.remove();
					th2.append("<input type='button' value='신고취소' class='commentFireCancel' />");
				}
			}) 
		});
		
		$(document).on("click", ".commentFireCancel", function(){
			var commentNo = $(this).prev().val();
			var classify = "CHANNEL_COMMENT";
			var fireId = $(this).prev().prev().val();
			var fireNo = $(this).prev().prev().prev().val();
			var lev = 1;
		
			
			var th = $(this);
			var th2 = $(this).parent();
			
		 	$.ajax({
				url : "fireCommentCancel.k",
				type : "post",
				data : {
					"fireNo" : fireNo,					
					"commentNo" : commentNo,
					"classify" : classify,
					"fireId" : fireId,
					"lev" : lev
				},
				success : function(data) {
					th.remove();
					th2.append("<input type='button' value='신고' class='commentFire' />");
				}
			}) 
		});
				/* 여기까지 */
			 	
	});
			

$(function() {
	
	$(".comment").on("click", function(){
    	
		 var state = $(this).parent().parent().parent().parent().parent().parent().next().css('display');  
   		/* var state = $(this).parent().parent().parent().parent().parent().parent().next().attr('class'); 
     	alert(state);  */
     	
    	 if(state == 'none') {
    		$(this).parent().parent().parent().parent().parent().parent().next().show(300);
		} else {
			$(this).parent().parent().parent().parent().parent().parent().next().hide(300);
		}
    	
    	
		});
    });
	
	
	
		$(document).on("click", ".articleLike", function() {
			var article_no = $(this).parent().next().children().val();
			var channel_no = $(this).parent().next().next().children().val();
			var like_amount = $(this).prev().val
			
			like_amount += 1;
			$(this).parent().html("<input type='button' class='articlUnLike' value='좋아요취소' />");
		
			$.ajax({
				url : "articleLikeClick.l",
				type : "post",
				data : {
					"chan_article_no" : article_no,
					"channel_no" : channel_no
				},
				success : function(result) {
					parent.html(like_amount+'명이 좋아합니다.<input type="button" class="articleLike" value="좋아요${check}"/>');	
				}
			})
		});
	
		
		$(document).on("click", ".articlUnLike", function() {
			var article_no = $(this).parent().next().children().val();
			var channel_no = $(this).parent().next().next().children().val();
			var like_amount = $(this).prev().val
			
			like_amount -= 1;
			$(this).parent().html("<input type='button' class='articleLike' value='좋아요' />");
			$.ajax({
				url : "articleUnLikeClick.l",
				type : "post",
				data : {
					"chan_article_no" : article_no,
					"channel_no" : channel_no
				},
				success : function(data) {
					parent.html(like_amount+'명이 좋아합니다.<input type="button" class="articlUnLike" value="좋아요취소${check}"/>');	
				}
			})
			
		});
		
		


	
	 //댓글등록
	$(document).on("click", ".commentSubmit", function(){
		
		
	    	var user_id= '${loginUser.userId}';
	    	var chan_article_no= $(this).prev().prev().val();
	    	var content= $(this).prev().val();
	    	var thisdiv = $(this).parent().parent().next().children();
	    	var th = $(this);
	    	$.ajax({
				url : 'ajax.l?user_id='+user_id+'&chan_article_no='+chan_article_no+'&content='+content
				,type : "post"
				,success : function(data) {
					if(data == 1){
						th.prev().text("");
						thisdiv.append('<li>'+user_id +':'+ conetnt+'<input type="button" value="삭제" class="commentdel"/><input type="button" value="신고" class="commentFire" /></li>');
					}
				}
			});
	    }); 
	 //댓글 신고 부분
	 $(document).on("click"),".commentFire", function(){
		var user_id= '${loginUser.userId}';
	 }
	    
			
	
	
	//댓글삭제
	 $(document).on("click", ".commentdel", function(){
    	var comment_no = $(this).next().next().val();
		var chan_article_no = $(this).next().next().next().val();
		var th = $(this).parent();
		
		$.ajax({
            url : "deleteChannelComment.l",
            data : {"comment_no" : comment_no,"cane_article_no" : chan_article_no},
            type : "post",
            success : function(data){
            	th.remove();
            }
         })
      });
	
	
	 $(document).on("click", ".dofire", function(){
			var chan_article_no = $(this).parent().next().children().val();
			var classify = "CHANNEL_ARTICLE";
			var fireId = $(this).parent().next().next().children().val();
			var th = $(this);
			
			$.ajax({
				url : "fireContent.k",
				type : "post",
				data : {
					"fireNo" : chan_article_no,
					"classify" : classify,
					"fireId" : fireId
				},
				success : function(data) {
					th.parent().html("<input type='button' class='fireCancel' value='신고취소'/>");
				}
			})
		});
		
		$(document).on("click", ".fireCancel", function(){
			var chan_article_no = $(this).parent().next().children().val();
			var classify = "CHANNEL_ARTICLE";
			var fireId = $(this).parent().next().next().children().val();
			
			var th = $(this);
			
			$.ajax({
				url : "cancelFireContent.k",
				type : "post",
				data : {
					"fireNo" : chan_article_no,
					"classify" : classify,
					"fireId" : fireId
				},
				success : function(data) {
					th.parent().html("<input type='button' class='dofire' value='신고'/>");
				}
			})
		});
	
	
	function fnclick(){
		var div = document.getElementById("flipper");
		div.style.transform="rotateY(180deg)";
		div.style.transition= "0.8s";
	}
	
	function fnReclick(){
		var div = document.getElementById("flipper");
		div.style.transform="rotateY(0deg)";
		div.style.transition= "0.8s";
	}
	function delete_chan(){
		var del_chan =  document.getElementById("channel_no").value;

		location.href="deleteChannel.l?channel_no="+del_chan;		
	}
	function mask() {
		   //화면의 높이와 너비를 구한다.
		   var maskHeight = $(document).height();  
		     var maskWidth = $(window).width();  

		     //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
		     /* $(".window").center(); */
		     /* $("#mask").css({"width":maskWidth,"height":maskHeight});   */
		     
		     //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.

		     $("#mask").fadeIn(0);      
		     $("#mask").fadeTo("slow",0.6);    

		}
	//글삭제용
	function deleteWrite(chan_article_no, channel_no) {
	    mask();

	    //삭제윈도우를 띄운다.
	      $(".deleteWindow").show();
	    
	      $("#deleteBtn").click(function() {
	    	/*   location.href = "mypageDelete.b?writeno=" + writeno + "&=" + '${memberUser.userId }'; */
	    	location.href = "deleteArticle.l?chan_article_no="+chan_article_no+"&channel_no="+channel_no;
	    	  
	      });
	 }
	 // main화면에서 수정버튼 클릭 시 작동.
	 function updateWritePage(channel_no, chan_article_no, chan_article_content, chan_article_filepath) {
	    mask();
	    $("#updateContent").val(chan_article_content);
	    $("input[name=channel_no]").val(channel_no);
		$("input[name=chan_article_no]").val(chan_article_no);
		$("input[name=chan_article_filepath]").val(chan_article_filepath);
	    $(".updateWindow").show();

	 }
</script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/channel/channelPage.css" />
</head>
<body>
<div id="mask"></div>
<!-- 글삭제 -->
<div class="deleteWindow window">
	<div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
	<div id="deleteBtnArea">
		<input type="button" id="deleteBtn" value="삭제" /> <input
			type="button" class="cancelBtn" value="취소" />
	</div>
</div>
<!-- 채널 수정 -->
<c:forEach var="article" items="${selectArticle}">
<div class="updateWindow window">
		<form action="articleUpdate.l" method="post"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<div id="#updateChannel">
				<textarea id="updateContent" name="chan_article_content" cols="40" rows="1"></textarea>
			</div>
			<div id="updateBtnArea">
				<input class="file" type="file" name="file" /> 
				<input type="submit" id="updateBtn" value="수정" /> 
				<input type="button" class="cancelBtn" value="취소" /> 
				<input type="hidden" name="chan_article_no" value="${article.chan_article_no }" /> 
				<input type="hidden" name="channel_no" value="${article.channel_no}"/>
				<input type="hidden" value="${loginUser.userId }" name="user_id"/>
				<input type="hidden" name="chan_article_filepath" value="${article.chan_article_filepath}"/>

			</div>
		</form>
	</div>
	</c:forEach>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"></div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			
			<br/> 
			<img src="${pageContext.request.contextPath}/resources/file/${loginUser.userId}/${loginUser.userProfile}"
					style="width: 120px;">

			<ul>
				<li><a href="mypage.b">MyPage</a></li>
				<li><a href="selectChannelList.l">채널</a></li>
				<li><a href="selectGroupList.y">그룹</a></li>
	         	<li><a href="newsfeed.b">뉴스피드</a></li>
	         	<li id="notice1">고객센터</li>
	        	<li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	         	<li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          	<li class="notice"><a href="selectQna.n">└QNA</a></li>
	         
			</ul>
		</div>

		<div id="content">
		<div class="flip-container">
    	<div class="flipper" id="flipper">
      	  <div class="front">
			<div id="signalImageArea">
				 채널 이름 : ${channelPage.channel_name }<br>
				 채널 정보 : ${channelPage.channel_info}<br>
				 <c:if test="${channelPage.channel_user_id eq loginUser.userId}">
				<button onclick="fnclick();">채널수정/삭제</button>
				</c:if>
				<div id="signalImageCalled"
					style="background-image:url('/sins/resources/file/${channelImageCalled.channel_user_id}/${channelImageCalled.channel_filepath}');background-size:230px 200px; "></div>
			</div>
		</div>
		 <div class="back">
		 <div id="signalImageArea">
				<form id="backForm" action="updateChannel.l"  method="post">
					<input type="hidden" id="channel_no" name ="channel_no" value="${channelPage.channel_no}" />
					<input type="text" id="channel_name" placeholder="채널이름 입력" name="channel_name" />
					<br/>
					<input type="text" id="channel_info" placeholder="채널정보 입력" name="channel_info"/>
					<br/>
					<input type="file" id="channel_filepath" placeholder="채널사진 변경" name="channel_filepath"/>
					<br/><br/>
					<input type="button" value="수정취소"  onclick="fnReclick();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" value="채널삭제" onclick="delete_chan();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="submit" value="수정완료"/> 
				</form>
			</div>
        </div>
		
		</div>
		</div>

			
				<c:if test="${channelPage.channel_user_id eq loginUser.userId}">
				<div id="writeArticle">
					<form action="insertChannelArticle.l" id="article" method="post" enctype="multipart/form-data">
					<div class="content2">
					<br/>
					<h3>&nbsp;&nbsp; 글 작성 하기</h3>
						&nbsp;&nbsp;&nbsp;<textarea name="chan_article_content" form="article" cols="50" rows="4" style="resize:none;"></textarea>
						<input type="submit" value="등록"> 
						<input type="hidden" name="channel_no" value="${channelPage.channel_no }"> 
						<input type="hidden" name="channel_user_id" value="${loginUser.userId }">
						<input type="hidden" name="user_id_bak" value="${loginUser.userId }">
						<input type="hidden" name="classify" value="${channelPage.classify }">
					</div>	
					</form>
					</div>
				</c:if>
			
			
			<c:forEach var="article" items="${selectArticle}">
				<div class="writeList">
						<table class="writerInfo">
							<tr class="writerInfoTr">
								<td class="writerPhoto" rowspan="2">사진</td>
								<td class="writerName">${Barticle.channel_name}</td>
							</tr>
							<tr>
								<td class="writeDate">${article.chan_article_write_date}</td>
							</tr>
						</table>
						<div class="contentContainer">
							${article.chan_article_content}</div>

						<div class="buttonContainer">
							<form action="articleLikeClick.l" id="articleLikeClick"
								method="post">
								<table>
									<tr>
										<td><input type="button" class="comment" value="댓글" /></td>
										<td><input type="button" class="update"
											onclick="updateWritePage(${article.channel_no }, ${article.chan_article_no}, '${article.chan_article_content}', '${article.chan_article_filepath}');"
											value="수정" /></td>
										<td><input type="button" class="deleteArticle"
											onclick="deleteWrite(${article.chan_article_no},${article.channel_no });" value="삭제" /></td>
											<c:set var="likeVar" value="0"/>
										<c:forEach var="likelist" items="${selectLikeList }">
										<c:if test = "${article.chan_article_no eq likelist.chan_article_no}">
										<c:set var="likeVar" value="1"/>
										</c:if>
										
										</c:forEach>
											<input type="hidden" class="like_amount" value="${article.like_amount}" />
										<c:if test="${likeVar==0}">
											<td><input type="hidden" class="like_amount" value="${article.like_amount}"/>
											${article.like_amount }명이 좋아합니다.
											<td><input type="button" class="articleLike" value="좋아요" /></td>
										</c:if>
										<input type="hidden" class="like_amount" value="${article.like_amount}" />
											<c:if test="${likeVar==1}">
											<td><input type="hidden" class="like_amount" value="${article.like_amount}"/>
												${article.like_amount }명이 좋아합니다.
												<td><input type="button" class="articlUnLike" value="좋아요취소" /></td>
										<input type="hidden" class="like_amount" value="${item.writelike}" />
											</c:if>
												<td class="chan_article_no"><input type="hidden"
												name="chan_article_no" value="${article.chan_article_no}" /></td>
												<td class="channel_no"><input type="hidden"
												name="channel_no" value="${article.channel_no}" /></td>
												<%-- <td>좋아요 갯수: ${article.like_amount}</td> --%>
												<!-- 원석부분 -->
												<c:if test="${masterId != loginUser.userId }">
													<c:set var="FireVar" value="0"/>
													
													<c:forEach var="firelist" items="${fireArticleList}">
														<c:if test = "${article.chan_article_no eq firelist.commentNo}">
															<c:set var="FireVar" value="1"/>
														</c:if>
													</c:forEach>
													<c:if test="${FireVar==0}">
														<td><input type="button" class="dofire" value="신고"/></td>
													</c:if>
													<c:if test="${FireVar==1}">
														<td><input type="button" class="fireCancel" value="신고취소"/></td>
													</c:if>
													<td><input type="hidden" name="fireNo" value="${article.chan_article_no }"/></td>
													<td><input type="hidden" name="fireId" value="${masterId}"/></td>
												</c:if>	
												<!-- 여기까지 -->
									</tr>
								</table>
							</form>
						</div>
									<form id="mypageform3" class="commentForm" method="post" onsubmit="return false">
					<div class="score_textarea" >
						<input type="hidden" value="${loginUser.userId}" name="userid">
						<input type="hidden" value="${article.chan_article_no }" name="contentno">
						<textarea id="txtComment" name="content" title="댓글 입력"
							placeholder="댓글을 입력하세요!" cols="50" rows="1"class="commentTextarea"></textarea>

						<input type="submit" class="commentSubmit" id="btnSave" value="입력">
					</div>
				</form>	
									
									<div class= "commentList">
									<ul class="commentList">
												<c:forEach var="comment" items="${channelCommentList}">
													<c:if test="${article.chan_article_no eq comment.chan_article_no}">
														<li>${comment.user_id } : ${comment.content }
														<input type="button" value="삭제" class="commentdel"/>
														
														<!-- 원석부분 -->
														<c:if test="${comment.user_id ne loginUser.userId }">
															<c:set var="tc" value="0"/>
															<c:forEach var="fireComment" items="${fireCommentList }">
																<c:if test="${fireComment.commentNo eq comment.comment_no}">
																	<c:set var="tc" value="1"/>
																</c:if>
															</c:forEach>
															<input type="hidden" value="${article.chan_article_no }" />
															<input type="hidden" value="${comment.user_id }"/>
															<input type="hidden" value="${comment.comment_no }"/>
															<c:if test="${tc eq 0 }">
																<input type="button" value="신고" class="commentFire" />
															</c:if>
															<c:if test="${tc eq 1 }">
																<input type="button" value="신고취소" class="commentFireCancel" />
															</c:if>
														</c:if>
														<!-- 여기까지 원석부분 -->
														<input type="hidden" name="comment_no" value="${comment.comment_no}"/>
														<input id="chan_article_no" type="hidden" name="chan_article_no" value="${article.chan_article_no}"/>
														</li>
													</c:if> 	
												</c:forEach>
												</ul>
											</div>
											
								</div>
								
								</c:forEach>
								</div>
								

		<div id="right" class="box">
			<%@include file="/WEB-INF/views/friend/friendView.jsp"%>
		</div>
	</div>
	

	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1">
		<ul>
	          <li><a href="mypage.b">MyPage</a></li>
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
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>