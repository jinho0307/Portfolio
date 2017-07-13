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
	href="/sins/resources/css/common/newsfeed-common.css" />
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">

<script type="text/javascript">

	$(document).ready(function() {
		
		$('#content').css('height', $(window).height() -60);
		$(window).resize(function() {
			$('#content').css('height', $(window).height() -60);
			
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

	// 내꺼
	$(function(){
		
		// 메뉴버튼 클릭 전, 버튼 숨겨놓음.
		$(".hbtn").hide();
		
		// 화면 중앙에 배치.		
		jQuery.fn.center = function () {
		    this.css("position","absolute");
		    this.css("top", Math.max(0, (($(window).height() - $(this).outerHeight()) / 3) + 
		                                                $(window).scrollTop()) + "px");
		    this.css("left", Math.max(0, (($(window).width() - $(this).outerWidth()) / 2) + 
		                                                $(window).scrollLeft()) + "px");
		    return this;
		}
			
        //닫기 버튼을 눌렀을 때
        $(".window .cancelBtn").click(function (e) {  
            //링크 기본동작은 작동하지 않도록 한다.
            e.preventDefault();  
            $("#mask, .window").hide();  
        });       
 
        //검은 막을 눌렀을 때
        $("#mask").click(function () {  
            $(this).hide();  
            $(".window").hide();  
        });     
        
        // 가입하기 버튼 클릭 시
        $("#requestBtn").click(function(){
			var groupNo = $("#groupNo").val();
			var userId = $("#userId").val();
        	
			location.href = "requestGroupMember.y?groupNo=" + groupNo + "&userId=" + userId;
        });
        
        // 좋아요 -> 취소 ------------------------------------------------------------------------
        $(document).on("click",".like", function(){
      		
    		var writeNo = $(this).parent().next().val();
    		var groupNo = ${group.groupNo};
    		var userId = '${loginUser.userId}';
			var parent = $(this).parent();
    		
    		$.ajax({
    			url : 'groupLike.y?userId=' + userId + '&writeNo=' + writeNo + '&groupNo=' + groupNo
    			,dataType : 'json'
    			,contentType : 'application/json; charset=utf-8'
    			,success : function(result) {
					var count = parent.siblings(".countLike").children(".countplus");
					
					count.html(count.html() * 1 + 1);
					count.parent().children(".countplus2").html(" 명이 좋아합니다.");

					parent.html('<input type="button" class="unlike" value="좋아요 취소"/>');
    			}
    		}); 
        });
        
        //취소 -> 좋아요
		$(document).on("click",".unlike", function(){

			var writeNo = $(this).parent().next().val();
			var groupNo = ${group.groupNo};
    		var userId = '${loginUser.userId}';
			var parent = $(this).parent();
    		
    		$.ajax({
    			url : 'groupUnlike.y?userId=' + userId + '&writeNo=' + writeNo + '&groupNo=' + groupNo
    			,dataType : 'json'
    			,contentType : 'application/json; charset=utf-8'
    			,success : function(result) {
    				var count = parent.siblings(".countLike").children(".countplus");
					count.html(count.html() * 1 - 1);
					
					var countval = count.html();
					
					if (countval == 0) {
						count.parent().children(".countContent").html("");
					}
    				
    				parent.html('<input type="button" class="like" value="좋아요"/>');		
    			}
    		});
		});
        
		 // 신고 ---------------------------------------------------------------
		$(document).on("click", ".report", function(){
       		var th = $(this);
       		var fireNo = th.parent().next().children().val();
       		var fireId = th.parent().next().next().children().val();
       		
       		       		
       		$.ajax({
       			url : "fireContent.k",
       			type : "post",
       			data : {
       				"fireNo" : fireNo,
       				"fireId" : fireId,
       				"classify" : "GROUP_MAIN"
       			},
       			success : function(data){
       				th.parent().html("<input type='button' class='unReport hbtn' value='신고 취소'/>");
       			}
       		})
       	});
        
    	$(document).on("click", ".unReport", function(){
       		var th = $(this);
       		var fireNo = th.parent().next().children().val();
       		var fireId = th.parent().next().next().children().val();
       		
       		
       		$.ajax({
       			url : "cancelFireContent.k",
       			type : "post",
       			data : {
       				"fireNo" : fireNo,
       				"fireId" : fireId,
       				"classify" : "GROUP_MAIN"
       			},
       			success : function(data){
       				th.parent().html("<input type='button' class='report hbtn' value='신고'/>");
       			}
       		})
       	});
        
    	
    	// 원석 부분 댓글 신고
        $(document).on("click", ".report2", function(){
           var th = $(this);
           var commentNo = th.parent().next().val();
           var fireNo = th.parent().next().next().val();
           var fireId = th.parent().next().next().next().val();
           var lev = 1;
           var classify = "GROUP_COMMENT";
           
           $.ajax({
              url : "fireComment.k",
              type : "post",
              data : {
                 "commentNo" : commentNo,
                 "fireNo" : fireNo,
                 "fireId" : fireId,
                 "lev" : lev,
                 "classify" : classify
              },
              success : function(date){
                 th.parent().append("<input type='button' class='unreport2' value='신고 취소'/>");
                 th.remove();
              }
           })
        });
        
        $(document).on("click", ".unreport2", function(){
           var th = $(this);
           var commentNo = th.parent().next().val();
           var fireNo = th.parent().next().next().val();
           var fireId = th.parent().next().next().next().val();
           var lev = 1;
           var classify = "GROUP_COMMENT";
           
           $.ajax({
              url : "fireCommentCancel.k",
              type : "post",
              data : {
                 "commentNo" : commentNo,
                 "fireNo" : fireNo,
                 "fireId" : fireId,
                 "lev" : lev,
                 "classify" : classify
              },
              success : function(date){
                 th.parent().append("<input type='button' class='report2' value='신고'/>");
                 th.remove();
              }
           })
        });

		// 신고 끝 --------------------------
        
        
        // 댓글 클릭 시, 댓글 리스트 보여주기 -------------------------------------------------------
        $(".comment").on("click", function(){
        	
        	 var state = $(this).parent().parent().parent().parent().parent().next().css('display');
        	 /* var state = $(this).parent().parent().parent().parent().parent().next().attr('class');
        	 alert(state); */
        	 if(state == 'none') {
				$(this).parent().parent().parent().parent().parent().next().show(300);
			} else {
				$(this).parent().parent().parent().parent().parent().next().hide(300);
			}
        	
        	var writeNo = $(this).parent().next().next().val();
    		var commentlist = $(this).parent().parent().parent().parent().parent().next().children('.commentListContainer');
			
    		$.ajax({
				url : 'selectGroupCommentList.y?writeNo=' + writeNo
				,dataType : 'json'
				,contentType : 'application/json; charset=utf-8'
				,success : function(map) {
					
					var list = map.list;
					var firelist = map.firelist;
					
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					tag(list, firelist, writeNo);
					
				}
    		});
        });
        
        // 댓글에 글쓰기 했을 때
        $(".commentSubmit").on("click", function(){
        	var commentForm = $(this).parent().serialize();
			var writeNo = $(this).siblings("input[name=writeNo]").val();
			
        	$.ajax({
				url : 'insertGroupComment.y'
				,dataType : 'json'
				,data : commentForm
				,contentType : 'application/json; charset=utf-8'
				,success : function(map) {
					
					var list = map.list;
					var firelist = map.firelist;
					
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					tag(list, firelist, writeNo);					
				}
			});
        });
        
        
        // 댓글 삭제
        $(document).on("click", ".delete2", function(){
        	var commentNo = $(this).parent().siblings(".hdcommentNo").val();
			var writeNo = $(this).parent().siblings(".hdwriteNo").val();
			
        	$.ajax({
        		url : "deleteGroupComment.y?commentNo=" + commentNo + "&writeNo=" + writeNo	 
   				,dataType : 'json'
   				,contentType : 'application/json; charset=utf-8'
       			,success : function(map){
       				
       				var list = map.list;
					var firelist = map.firelist;
       				
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					tag(list, firelist, writeNo);
       			}
       		});
        });
        
        
        // 댓글 수정
        
         // ajax, 댓글 뿌려주는 메소드
        function tag(list, firelist, writeNo) {
        	
        	var userId = '${loginUser.userId}';
        	
			var tag = "";
			
			for(var i = 0; i < list.length; i++) {
				
				tag += "<div class='commentOne'><label class='commentlabel'>" + '<img class="userprofile2" src="/sins/resources/file/' + list[i].userId + '/' + list[i].photopath + '"/></label><table><tr><td>' + list[i].userName 
						+ "</td><td>" + list[i].content + "</td></tr></table><div>" 
						+ "<input type='button' class='comment2' value='답글'/>";
				
				if(list[i].userId == userId) {
				
					tag += "<input type='button' class='update2' value='수정'/><input type='button' class='delete2' value='삭제'/>";
				
				} else {
					
					var checkfire = 0;
					
					for(var j = 0; j < firelist.length; j++) {
						
						if(list[i].commentNo == firelist[j].commentNo) {
							checkfire = 1;
						}
						
					}
					
					if(checkfire == 0)
						tag += "<input type='button' class='report2' value='신고'/>";
					else 
						tag += "<input type='button' class='unreport2' value='신고 취소'/>";
				}
				
				tag += "</div><input type='hidden' class='hdcommentNo' value='" + list[i].commentNo 
	            + "'/><input type='hidden' class='hdwriteNo' value='" + writeNo + "'/>" 
	            + "<input type='hidden' name='userId' value='"+ list[i].userId +"'/> </div>";
				
			}
			
			$(".commentListContainer").append(tag);	
        }
        // 댓글 끝 ------------------------------------------------------------------
        
        // 댓댓글 시작----------------------------------------------------------------
		$(document).on("click", ".comment2", function(){
			
			var tag = "";
        	
        	tag += "<div class='commentContainer2'><div class='commentWriteContainer2'><textarea class='commentTextarea2' name='content'></textarea>"
        	+"<input type='button' class='commentSubmit2' value='답글쓰기'/></div>" 
        	+ "<div class='commentListContainer2'></div></div>'";			
			
			$(this).parent().parent().append(tag);
		});
        
        
        // 답글쓰기 눌렀을 시
        $(document).on("click", ".commentSubmit2", function(){
        	var ref = $(this).parent().parent().siblings(".hdcommentNo").val();
			var writeNo = $(this).parent().parent().siblings(".hdwriteNo").val();
        	var userId = '${loginUser.userId}';
			var content = $(this).siblings('.commentTextarea2').val();
			
						
			$.ajax({
				url : 'insertGroupComment2.y'
				,data : {
					'ref' : ref,
					'writeNo' : writeNo,
					'userId' : userId,
					'content' : content
				}
				,dataType : 'json'
				,success : function(list) {
					
					$(".commentListContainer2").children().remove();
					
					$(".commentTextarea2").val("");

					tag2(list);
				}
			}) 
        });
        
        
        function tag2(list) {
        	var tag = "";
        	var userId = '${loginUser.userId}';
        	

        	for(var i = 0; i < list.length; i++) {
        		tag += "<div class=commentTwo><label class='commentlabel2'>" + '<img class="userprofile3" src="/sins/resources/file/' + list[i].userId + '/' + list[i].userProfile + '"/></label><table><tr><td>' + list[i].userName 
        		+ "</td><td>" + list[i].content + "</td></tr></table></div>";
        		
        		if(list[i].userId == userId) {
    				
					tag += "<input type='button' class='update3' value='수정'/><input type='button' class='delete3' value='삭제'/>";
				
				} else {
				
					tag += "<input type='button' class='report3' value='신고'/>";
				
				}        		
        		
      	 	}

        	$(".commentListContainer2").append(tag);
        }
       
        
        // 댓댓글 끝 -----------------------------------------------------------------
        
        
        // 포켓볼 클릭 시 
        $(".menu-button").on("click", function(){
			$(this).parent().siblings().children(".hbtn").toggle();
    	});
        
        
       
	});// document ready 끝
	
	
	
	// main화면에서 삭제버튼 클릭 시 작동.
	function deleteWrite(writeNo) {
		mask();
 		
		//삭제윈도우를 띄운다.
        $(".deleteWindow").show();
		
        $("#deleteBtn").click(function() {
        	location.href = "deleteGroupWrite.y?writeNo=" + writeNo + "&groupNo=" + ${group.groupNo};
        });
	}
	
	// main화면에서 수정버튼 클릭 시 작동.
	function updateWritePage(writeNo, content, filepath) {
		mask();
		$("#updateContent").val(content);
		$("input[name=writeNo]").val(writeNo);
		$("input[name=filepath]").val(filepath);
		$(".updateWindow").show();
	}

	// 검은 막 생성.
	function mask() {
		//화면의 높이와 너비를 구한다.
		var maskHeight = $(document).height();  
        var maskWidth = $(window).width();  
 
        //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채운다.
        /* $(".window").center();
        $("#mask").css({"width":maskWidth,"height":maskHeight});   */
        
        //애니메이션 효과 - 일단 0초동안 까맣게 됐다가 60% 불투명도로 간다.
 
        $("#mask").fadeIn(0);      
        $("#mask").fadeTo("slow",0.6);    
	}
	
	
</script>

<style type="text/css">
	/* 공용 */
	a:link, a:visited { text-decoration: none; color: #000000; }
	a:hover { text-decoration: none; color: #0080ff; }
	ul, li {list-style:none; margin:0; padding:10px;}
	/* ---------------------------------------------- */
	/* 팝업 */
#mask {
	position: fixed;
	width:100%;
	height:100%;
	z-index: 9000;
	background-color: #000;
	display: none;
}

/* 팝업으로 뜨는 윈도우 css  */
#updateMessage {
	text-align: center;
	margin: 35px auto;
}

#updateContent {
	height: 25px;
}

#updateBtnArea {
	text-align: center;
}

#deleteMessageArea{
	text-align: center;
	margin: 45px auto;
	font-size : 20px;
}

#deleteBtnArea{
	text-align: center;
}
.window {
	display: none;
	position: absolute;
	margin :  200px 35%;
	width: 400px;
	height: 180px;
	background-color: white;
	z-index: 10000;
	border-radius: 15px 15px 15px 15px;
}
	/* ///////// */
	/* #mask {  
	    position:absolute;  
	    z-index:9000;  
	    background-color:#000;  
	    display:none;  
	    left:0;
	    top:0;
	}  */
	
	/* 팝업으로 뜨는 윈도우 css  */ 
	/* .window{
	    display: none;
	    position:absolute;  
	    width:30%;
	    height:20%;
	    background-color:#FFF;
	    z-index:10000;   
	 } */
	
	/* main(대표사진, 그룹정보 등) */
	
	#container { 
		width : 1050px;
	}
	#content {
	width : 690px;
		margin-left : 10px;
		margin-right : 10px;
	
	}
	#mainContainer {
		width : 100%;
		height : 150px;
		background-color : white;
		margin-bottom : 20px;
	}
	
	.userprofile {
		width: 50px;
		height: 50px;
	}

	.userprofile2 {
		width: 40px;
		height: 40px;
	}
	
	.userprofile3 {
		width: 30px;
		height: 30px;	
	}

	/* 그룹 멤버 리스트  */
	#memberContainer {
		float: right;
		width: 26%;
		margin-top: 10px;
		background-color : white;
	}
	
	.groupMember {
		border-bottom: 1px solid grey;
	}
	
	.groupMember .memberdiv {
		display: inline-block;
	}
	
	.groupMember .profilePhoto {
		width: 30%;
	}
	
	.groupMember .memberInfo {
		width: 60%;
		text-align: center;
	}
		
	/* 게시글 쓰기 */
	#groupWriteContainer {
		width: 70%;
		height: 100px;
		margin-top: 10px;
		margin-right: 10px;
		background-color: white;
	}
	
	#writeAreaContainer {
		margin-left: 10px;
		width: 100%;
		height: 80%;
	}
	
	#writeAreaContainer textarea {
		width: 80%;
		height: 90%;
		padding: 1%;
		resize: none;
		float: left;
	}
	
	#writeBtnContainer {
		width: 100%;
		height: 19%;
	}
	
	#writeBtnContainer #writeBtn {
		display: inline-block;
		margin: 1%;
		float: right;
	}
	
	
	/* 게시글 목록  */
	.writeList {
		width: 70%;
		margin-top: 10px;
		margin-right: 10px;
		-moz-box-shadow: 1px 1px 1px #888888;
		box-shadow: 1px 1px 1px #888888;
		background-color: white;
	}
	
	.writeList .writerInfo {
		width: 100%;
	}
	
	.writeList .writerPhoto {
		width: 15%;
	}
	
	.writeList .writerName {
		font-size: 15px;
	}
	
	.writeList .writeDate {
		font-size: 12px;
	}
	
	.contentContainer {
		padding: 5%;
	}
	
	.buttonContainer {
		position: relative;
		background: #E7E4F9;
	}
	
	.buttonContainer table {
		display: inline-block;
	}
	
	/* 글쓰기에서 수정, 삭제 or 신고 메뉴버튼 */
	.menu-button {
		position: relative;
		float: right;
		width: 25px;
		height: 25px;
		cursor: pointer;
	}
	
	.button-table {
		position: absolute;
		right: 0;
	}
	
	/* 삭제클릭 시 영역, 버튼 */
	/* #deleteMessageArea {
		width: 100%;
		height: 70%;
		text-align: center;
		
	}
	
	#deleteBtnArea {
		width: 100%;
		height: 30%;
	} */
	
	/* 댓글 */
	.commentOne {
		clear : left;
		border-bottom : 1px solid;
	}
	
	.commentWriteContainer textarea {
		width: 80%;
		height: 30%;
		padding: 1%;
		resize: none;
		float: left;
	}
	
	.commentlabel {
		border: 1px solid orange; 
		float: left; 
		width: 40px; 
		height: 40px;
		margin-right: 10px; 
		vertical-align: middle;
	}
	
	.commentTwo {
		margin-left: 20px;
		height: 40px;
	}
	
	.commentlabel2 {
		border: 1px solid orange; 
		float: left; 
		width: 35px; 
		height: 35px;
		margin-right: 10px; 
		vertical-align: middle;
	}
	/* 그룹회원이 아닌 경우  */
	#requestContainer {
		width: 70%;
		height: 30%;
		margin-top: 10px;
		margin-right: 10px;
	}
	
	/* footer 에 마지막 글이 가려지는 문제 해결 */
	/* #container {
		margin-bottom: 30px;
	} */
	
		
	
	input[type=button] {
		background-color : white;
		border-radius: 5px;
	}
	
	#mContainer {
			display : none;
		}
		
	.flip-container {
	   perspective: 680px;
	   border:2px solid rgba(0,0,0,0) !important;
	}
	
	.front{
	  z-index:2;
	  transform: rotateY(0deg);
	}
		
	.back {
	    transform: rotateY(180deg);
	}
	
	.flip-container, .front, .back {
	    width: 680px;
	    height: 150px;
	
	}
	
	.flipper {
	   /* 하위요소에 3D 좌표값 지정 */
	    transform-style: preserve-3d;
	    position: relative;
	}
	
	.front, .back{
	  position: absolute;
	  backface-visibility:hidden;
	  
		width: 100%;
		height: 150px;
		background-color: white;
	}
	
	#signalImageArea {
		margin: 3px auto;
		padding : 10px;
		width: 95%;
		height: 80%;
		position: relative;
		
	}
	
	#backForm {
		width : 70%;
		height : 100px;
		margin : 10px auto;
		text-align: center;
	}
	
	#groupName {
		width : 70%;
		margin-bottom : 2px;
	}
	
	#groupInfo {
		width : 70%;
		margin-bottom : 2px;
	}
	
@media screen and (max-width:500px) {
	.window {
		margin: 200px 10%;
		width: 300px;
	}
	
	#memberContainer {
		display : none;
	}
	
	#groupWriteContainer {
		width: 100%;
	}
	
	.writeList {
		width: 100%;
	}
	
	#mContainer {
		margin : auto;
		display : block;
		width : 150px; 
	}
	
	.flip-container {
	   perspective: 100%;
	}
	
	.flip-container, .front, .back {
	    width: 100%;
	}
	
	#container {
		width : auto;
		margin : auto;
		padding: 10px;
	}
	
	#content {
		width : 100%;
		margin : auto;
		float : none;
	}
	
}	
	
	
</style>

</head>
<body>

<div id="mask"></div>
<div class="deleteWindow window">
	<div id="deleteMessageArea"><div>정말 삭제 하시겠습니까?</div></div>
	<div id="deleteBtnArea">
		<input type="button" id="deleteBtn" value="삭제"/>
		<input type="button" class="cancelBtn" value="취소"/>
	</div>
   </div>
   <div class="updateWindow window">
   	<form action="updateGroupWrite.y" method="post">
    	<div id="updateMessage">
    		<textarea id="updateContent" name="content"></textarea>
    	</div>
    	<div id="updateBtnArea">
    		<input type="submit" id="updateBtn" value="수정"/>
    		<input type="button" class="cancelBtn" value="취소"/>
    		<input type="hidden" name="groupNo" value="${group.groupNo}"/>
    		<input type="hidden" name="writeNo"/>
			<input type="hidden" name="filepath"/>
    	</div>
   	</form>
   </div>
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
					style="width: 100px; margin-left: 15px;" >
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
	<div id="content" style="position:relative;">
		<div class="flip-container">
				<div class="flipper" id="flipper">
					<div class="front">
						<div id="signalImageArea">
							그룹 이름 : ${group.groupName}<br> 그룹 정보 : ${group.groupInfo}<br>
							<c:if test="${group.userId eq loginUser.userId}">
								<button onclick="fnclick();">그룹 수정/삭제</button>
							</c:if>
							<div style="position: absolute;right: 0; top:20px; width: 200px; height: 120px; background-image: url('/sins/resources/file/${group.userId}/${group.filepath }')">
							
							</div> 						 
							
					
					
						</div>
					</div>
					<div class="back">
						<div id="signalImageArea">
							<form id="backForm" action="updateGroup.y" method="post">
								<input type="hidden" id="groupNo" name="groupNo" value="${group.groupNo}" /> 
								<input type="text" id="groupName" placeholder="그룹 이름 입력" name="groupName" />
								<br /> 
								<input type="text" id="groupInfo" placeholder="그룹 정보 입력" name="groupInfo" /> 
								<br /> 
								<input type="file" id="filepath" name="filepath" />
								<br />
								<br /> 
								<input type="button" value="수정취소" onclick="fnReclick();">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="button" value="채널삭제" onclick="location.href='deleteGroup.y?groupNo=${group.groupNo}'" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="submit" value="수정완료" />
							</form>
						</div>
					</div>

				</div>
			</div>
		<div id="memberContainer" class="box">
			<h3><a href="groupMemberDetail.y?groupNo=${group.groupNo}">그룹 멤버</a></h3>
				<c:forEach var="item" items="${memberList}">
					<c:if test="${item.groupAccept == 'Y'}">
						<div class="groupMember">
							<div class="profilePhoto memberdiv">
								<img class="userprofile" src="/sins/resources/file/${item.userId}/${item.userProfile}"/>
							</div>
							<div class="memberInfo memberdiv">
								${item.userName}
							</div>
						</div>
					</c:if>
				</c:forEach>
						
		</div>
		<c:choose>
			<c:when test="${memberCheck == true}">
				<div id="groupWriteContainer" class="box">
					<form id="insertWrite" action="insertGroupWrite.y" method="post" enctype="multipart/form-data">
						<input type="hidden" id="userId" name="userId" value="${loginUser.userId}"/>
						<input type="hidden" id="groupNo" name="groupNo" value="${group.groupNo}"/>
						<div id="writeAreaContainer">
						<br/>
							<label>새글쓰기</label>
							<br/>
							<label>
								<textarea name="content" placeholder="내용입력"></textarea>
							</label>
						</div>
						<div id="writeBtnContainer">
							<input id="writeBtn" type="submit" value="올리기"/>
						</div>
					</form>
				</div>
				<c:forEach var="item" items="${writeList}">
					<div class="writeList" class="box">
						<div>
							<table class="writerInfo">
								<tr class="writerInfoTr">
									<td class="writerPhoto" rowspan="2"><img class="userprofile" src="/sins/resources/file/${item.userId}/${item.userProfile}"/></td>
									<td class="writerName">${item.userName}</td>
								</tr>
								<tr>
									<td class="writeDate">${item.writeDate}</td>
								</tr>
							</table>
							<div class="contentContainer">
								${item.content}
							</div>
							<div class="buttonContainer">
								<table>
									<tr>
										<td><input type="button" class="comment" value="댓글"/></td>
										<c:set var="check" value="0"/>
										<c:set var="count" value="${item.writeLike}"/>
										<c:forEach var="like" items="${likeList}">
											<c:if test="${like.writeNo == item.writeNo && check == 0}">
												<c:set var="check" value="1"/>
											</c:if>
										</c:forEach>
											
										<c:if test="${check == 1}">
											<td><input type="button" class="unlike" value="좋아요 취소"/></td>
										</c:if>	
										<c:if test="${check == 0}">
											<td><input type="button" class="like" value="좋아요"/></td>
										</c:if>
											<input type="hidden" class="writeNo" value="${item.writeNo}"/>
										
											<td class="countLike">&nbsp;&nbsp;<label class="countplus countContent"><c:if test="${count > 0}">${count}</c:if></label>
																				<label class="countplus2 countContent"><c:if test="${count > 0}"> 명이 좋아합니다.</c:if></label></td>
									</tr>
								</table>
								
								<table class="button-table">
									<tr>
										<c:if test="${item.userId == loginUser.userId}">
											<td><input type="button" class="update hbtn" 
												onclick="updateWritePage(${item.writeNo}, '${item.content}', '${filepath}');"value="수정"/></td>
											<td><input type="button" class="deleteWrite hbtn" 
												onclick="deleteWrite(${item.writeNo});"value="삭제"/></td>
										</c:if>
										<c:if test="${item.userId != loginUser.userId}">
											<c:set var="fireCheck" value="0"/>
											<c:forEach var="fire" items="${fireContentList}">
												<c:if test="${item.writeNo eq fire.fireNo}">
													<c:set var="fireCheck" value="1"/>
												</c:if>												
											</c:forEach>
											<c:if test="${fireCheck eq 0 }">
												<td><input type="button" class="report hbtn" value="신고"/></td>
											</c:if>
											<c:if test="${fireCheck eq 1 }">
												<td><input type="button" class="unReport hbtn" value="신고취소"/></td>
											</c:if>
											<td><input type="hidden" name="fireNo" value="${item.writeNo}" /></td>
											<td><input type="hidden" name="fireId" value="${item.userId}" /></td>
										</c:if>
										<td><img class="menu-button" src="/sins/resources/images/menu-button.png"/></td>
									</tr>
								</table>
								
							</div>
							<div class="commentContainer" style="display: none;">
								<div class="commentWriteContainer">
									<form action="" class="commentForm" method="post" enctype="multipart/form-data">
										<input type="hidden" name="userId" value="${loginUser.userId}"/>
										<input type="hidden" name="writeNo" value="${item.writeNo}"/>
										<textarea class="commentTextarea" name="content"></textarea>
										<input type="button" class="commentSubmit" value="댓글쓰기"/>
									</form>
								</div>
								<div class="commentListContainer"></div>
							
							</div>
						</div>
					</div>
				</c:forEach>
			</c:when>
			
			<c:when test="${memberCheck == 'false'}">
				<div id="requestContainer">
					<input type="hidden" id="userId" name="userId" value="${loginUser.userId}"/>
					<input type="hidden" id="groupNo" name="groupNo" value="${group.groupNo}"/>
					<input type="button" id="requestBtn" value="가입하기"/>				
				</div>
			</c:when>
			
			<c:otherwise>
				<div id="requestContainer">
					<label>가입 요청됨</label>
				</div>
			</c:otherwise>
		</c:choose>
	</div>
	<div id="right" class="box">
    		<c:import url="/WEB-INF/views/chat/chat.jsp"></c:import> 
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
	<hr style="width:160px; margin:auto;">
	<br/>
	<%@include file="/WEB-INF/views/friend/friendView.jsp"%>
	</div>
	
	<div id="spot3"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
</body>
</html>