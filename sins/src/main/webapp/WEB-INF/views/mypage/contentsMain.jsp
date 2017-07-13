<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/mypage/mypage-common.css" />
	<script type="text/javascript" src='<c:url value='/resources/smarteditor/js/service/HuskyEZCreator.js'/>' charset="utf-8"></script>
<script src="http://vjs.zencdn.net/c/video.js"></script>
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<script type="text/javascript">
	$(document).ready(
			function() {
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
				$(".window .close").click(function(e) {
					//링크 기본동작은 작동하지 않도록 한다.
					e.preventDefault();
					$("#mask, .window").hide();
				});

				//검은 막을 눌렀을 때
				$("#mask").click(function() {
					$(this).hide();
					$(".window").hide();

				});

				/* $("#12").click(function() {
					var isHidden = $(".11").is(":hidden");
					if (isHidden) {
						$(".11").show(100);
						$(".score_textarea").show(100);
					} else {
						$(".11").hide(100);
						$(".score_textarea").hide(100);
					}

				}); */
				
				$("#t-l").click(function(){ 
						$("#spot1, #overlay_t").show();
				}); 
				$("#overlay_t").click(function(e){ 
				    e.preventDefault(); 
				    $("#spot1, #spot2, #overlay_t").hide(); 
				});
				$("#t-r").click(function(){ 
				 	$("#spot2, #overlay_t").show();
				}); 
				 	
				var noticeMenuStatus = 0;
				$(".notice").hide();
				 	
				$("#notice1, #notice2").click(function(){
				 if(noticeMenuStatus == 0){
				 	noticeMenuStatus = 1;
				 	$(".notice").slideDown("slow");
				 }else {
				 	noticeMenuStatus = 0;
				 	$(".notice").slideUp("slow");
				 }
				 		
				 });
				 	
				 	
				 setTimeout(function(){
				 $('#friend').html(friendTag);
				 		
				 },500);
				 	
				 	
				});

$(function(){
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
	
    //좋아요 -> 취소
      $(document).on("click",".like", function(){
    	  
    	    var mylike = $(this).prev().val();
      		var writeNo = $(this).next().val();
      		if(writeNo == null){
      			writeNo = $(this).parent().next().val();
      			mylike = $(this).parent().prev().val();
      		}
      			mylike-=(-1);
      		var userid = '${loginUser.userId}';
      		var parent = $(this).parent();
      		
      		
      		$.ajax({
      			url : 'mypageLike.b?writeNo=' + writeNo + '&userid=' + userid
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="unlike2" value="좋아요 취소${check}"/>');				
      					
      			
      			}
      		}); 
      });
    
    //좋아요 -> 취소
      $(document).on("click",".like2", function(){
    	  
    	    var mylike = $(this).prev().val();
      		var writeNo = $(this).next().val();
      		if(writeNo == null){
      			writeNo = $(this).parent().next().val();
      			mylike = $(this).parent().prev().val();
      		}
      			
      		var userid = '${loginUser.userId}';
      		var parent = $(this).parent();
      		
      		
      		$.ajax({
      			url : 'mypageLike.b?writeNo=' + writeNo + '&userid=' + userid
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="unlike2" value="좋아요 취소${check}"/>');				
      					
      			
      			}
      		}); 
      });

      //취소 -> 좋아요
      	$(document).on("click",".unlike", function(){

      		 var mylike = $(this).prev().val();
       		var writeNo = $(this).next().val();
       		if(writeNo == null){
       			writeNo = $(this).parent().next().val();
       			mylike = $(this).parent().prev().val();
       		}
       		mylike -= 1;
       		var userid = '${loginUser.userId}';
       		var parent = $(this).parent();
      		
      		$.ajax({
      			url : 'MypageUnLike.b?userid=' + userid + '&writeNo=' + writeNo
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="like2" value="좋아요${check}"/>');	
      				
      			}
      		});
      	});
      
      
      	 //취소 -> 좋아요
      	$(document).on("click",".unlike2", function(){

      		 var mylike = $(this).prev().val();
       		var writeNo = $(this).next().val();
       		if(writeNo == null){
       			writeNo = $(this).parent().next().val();
       			mylike = $(this).parent().prev().val();
       		}
     
       		var userid = '${loginUser.userId}';
       		var parent = $(this).parent();
      		
      		$.ajax({
      			url : 'MypageUnLike.b?userid=' + userid + '&writeNo=' + writeNo
      			,dataType : 'json'
      			,contentType : 'application/json; charset=utf-8'
      			,success : function(result) {
      			
      				parent.html(mylike+'명이 좋아합니다.<input type="button" class="like" value="좋아요${check}"/>');	
      				
      			}
      		});
      	});
      	 
      	 
     // 원석부분
     	 $(document).on("click", ".doFire", function(){
     		var th = $(this);
     		
     		var fireId = th.parent().next().children().val();
     		var fireNo = th.parent().next().next().children().val();
     		var classify = "MY_PAGE";
     		
     		$.ajax({
     			url : "fireContent.k?fireId="+fireId + "&fireNo="+fireNo+"&classify="+classify,
     			type : "post",
     			success : function(date){
     				if(date == 1){
     					th.parent().html("<input type='button' class='fireCancel' value='신고취소'/>");
     				}
     			}
     		})
     		
     	 });
     	$(document).on("click", ".fireCancel", function(){
     		var th = $(this);
     		
     		var fireId = th.parent().next().children().val();
     		var fireNo = th.parent().next().next().children().val();
     		var classify = "MY_PAGE";
     		
     		$.ajax({
     			url : "cancelFireContent.k?fireId="+fireId + "&fireNo="+fireNo+"&classify="+classify,
     			type : "post",
     			success : function(date){
     				if(date == 1){
     					th.parent().html("<input type='button' class='doFire' value='신고'/>");
     				}
     			}
     		})
     		
     	 });
     	
     	<% // TODO Auto-generated method stub %>
     	$(document).on("click", ".doCommentFire", function(){
     		var th = $(this);
     		var commentNo = $(this).parent().prev().prev().prev().val();
			var classify = "MYPAGE_COMMENT";
			var fireId =  $(this).parent().prev().prev().val();
			var fireNo = $(this).parent().prev().val();
			var lev = 1;
			var comment = $(this).prev().val();
			
			
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
				success : function(data){
					th.parent().append('<input type="button" class="unCommentFire" value="신고취소"/>');
					th.remove();
				}
			})
     	});
     	
     	$(document).on("click", ".unCommentFire", function(){
     		var th = $(this);
     		var commentNo = $(this).parent().prev().prev().prev().val();
			var classify = "MYPAGE_COMMENT";
			var fireId =  $(this).parent().prev().prev().val();
			var fireNo = $(this).parent().prev().val();
			var lev = 1;
			var comment = $(this).prev().val();
			
			
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
				success : function(data){
					th.parent().append('<input type="button" class="doCommentFire" value="신고"/>');
					th.remove();
				}
			})
     	});
     	
     	 // 여기까지 원석부분
      	
      	 
        // 댓글 클릭 시, 댓글 리스트 보여주기
        $(".comment").on("click", function(){
        	
        	var state = $(this).parent().parent().parent().parent().parent().next().css('display');
        	/* var state = $(this).parent().parent().parent().parent().parent().next().attr('id'); */
        	/* alert(state); */
        	 if(state == 'none') {
				$(this).parent().parent().parent().parent().parent().next().show(300);
				$(this).parent().parent().parent().parent().parent().next().next().show(300);
			} else {
				$(this).parent().parent().parent().parent().parent().next().hide(300);
				$(this).parent().parent().parent().parent().parent().next().next().hide(300);
			}
        	
        	/* $(this).parent().parent().parent().parent().parent().next().toggle(); */
        	
        	var commentlist = $(this).parent().parent().parent().parent().parent().next().next().last();
        	var writeNo = $(this).parent().next().children().val();
    		var userId = '${loginUser.userId}';
    		var classify = 0;
    		$.ajax({
				url : 'selectMypageCommentList.b?writeNo=' + writeNo + '&classify=' + classify
				, type : "post"
				,success : function(list) {
					var comment = list.commentList;
					var fire = list.fireCommentList;
					
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					for(var i = 0; i < list.commentList.length; i ++) {
						var check = 0;	
					
						for(var j=0;j < list.fireCommentList.length; j++){	
							if(list.commentList[i].commentno == list.fireCommentList[j].commentNo){
								check = 1;
							}					
						}
						if(check == 0){
							commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table><br></div>');
							if(list.commentList[i].userid == userId){
							commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
							}
						}
						else {
							commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table><br></div>');
							if(list.commentList[i].userid == userId){
							commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
							}
						}
						
					}
					
					
				}
    		});
        });
        
        // 댓글에 글쓰기 했을 때
        $(".commentSubmit").on("click", function(){
        	var commentForm = $(this).parent().parent().serialize();
			var thisdiv = $(this).parent().parent().next();
			var userId = '${loginUser.userId}';
			var writeNo = $(this).siblings(".contentno").val();
			var commentTextarea = $(this).siblings(".commentTextarea").val();

			if(commentTextarea != ""){
        	$.ajax({
				url : 'insertMypageComment.b'
				,dataType : 'json'
				,data : commentForm
				,contentType : 'application/json; charset=utf-8'
				,success : function(list2) {
					
					var comment = list2.commentList;
					var fire = list2.fireCommentList;
					
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					for(var i = 0; i < list2.commentList.length; i ++) {
						var check = 0;	
					
						for(var j=0;j < list2.fireCommentList.length; j++){	
							if(list2.commentList[i].commentno == list2.fireCommentList[j].commentNo){
								check = 1;
							}					
						}
						
						if(check == 0){
							thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="'+list2.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list2.commentList[i].username+'<td></tr><tr><td>'+list2.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table><br></div>');
							if(list2.commentList[i].userid == userId){
								thisdiv.append('<div class="commentOne">'+list2.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list2.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								thisdiv.append('<input type="hidden" name="commentNo" value="'+list2.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list2.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list2.commentList[i].content+'<br><input type="button" class="doCommentFire" value="신고"/></div>');
							}
						}
						else {
							thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="'+list2.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list2.commentList[i].username+'<td></tr><tr><td>'+list2.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table><br></div>');
							if(list2.commentList[i].userid == userId){
								thisdiv.append('<div class="commentOne">'+list2.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list2.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								thisdiv.append('<input type="hidden" name="commentNo" value="'+list2.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list2.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list2.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
							}
						}
							
					}
					
				}
	        })
			}else
			alert('댓글을 1글자 이상 입력해주세요');	
        });
     // 댓글 삭제
        $(document).on("click", ".delete2", function(){
        	var thisClass = $(this).parent();
        	var thisClass2 = $(this).parent().prev();
        	var commentNo = $(this).siblings(".hdcommentNo").val();
			var writeNo = $(this).siblings(".hdwriteNo").val();
			var userId = '${loginUser.userId}';

        	$.ajax({
        		url : "deleteMypageComment.b?commentno=" + commentNo	 
   				,dataType : 'json'
   				,contentType : 'application/json; charset=utf-8'
       			,success : function(list){
					//$("div").remove(".commentOne");
					thisClass.remove();
					thisClass2.remove();
					$(".commentTextarea").val("");
					
					tag(list, writeNo);
       			}
       		});
        });
        
        
        
        
        $(".menu-button").on("click", function(){
			$(this).parent().siblings().children(".hbtn").toggle();
        });
      	 
	$("#submitBtn").click(function(){

		if($("#title").val().length>0){
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD",[]);

			$("#write_form").submit();
			
		}
			
		else{
			alert("제목을 입력해주세요.");
			
		}
		
	});
	
	
	$('#rev').hide(); 
	
	
});

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
function deleteWrite(writeno) {
    mask();
     
    //삭제윈도우를 띄운다.
      $(".deleteWindow").show();
    
      $("#deleteBtn").click(function() {
    	  location.href = "mypageDelete.b?writeno=" + writeno + "&pageid=" + '${memberUser.userId }';
    	  
      });
 }
 
 //댓글 삭제용
function deleteWrite(writeno) {
    mask();
     
    //삭제윈도우를 띄운다.
      $(".deleteWindow2").show();
    
      $("#deleteBtn2").click(function() {
    	  location.href = "mypageCommentDelete.b?writeno=" + writeno + "&pageid=" + '${memberUser.userId }';
    	  
    	  
      });
 }
 
 // main화면에서 수정버튼 클릭 시 작동.
 function updateWritePage(writeno, content, filepath) {
    mask();
    $("#updateContent").val(content);
	$("input[name=writeno]").val(writeno);
	$("input[name=filepath]").val(filepath);
    $(".updateWindow").show();
 }
 
 
</script>
<style type="text/css">
/* 팝업 */
#mask {
	position: absolute;
	z-index: 9000;
	background-color: #000;
	display: none;
	left: 0;
	top: 0;
}

/* 팝업으로 뜨는 윈도우 css  */
.window {
	display: none;
	position: absolute;
	width: 30%;
	height: 20%;
	background-color: #FFF;
	z-index: 10000;
}

/* 게시글 목록  */
.writeList {
	width: 100%;
	margin-top: 10px;
	margin-right: 10px;
	border: 1px solid;
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
	background: #ededed;
}

.content2 {
	width: 560px;
	padding: 20px;
	background-color: #E7E4F9;
}

@media screen and (max-width:500px) {
	.content2, .t1, .t2, .t3 {
		overflow: hidden;
		float: none;
		width: auto;
		margin: auto;
	}
}

.pro {
	width: 30px;
	height: 30px;
}

.t1 {
	width: 100px;
}

.t2 {
	width: 500px;
}

.t3 {
	width: 500px;
	border-collapse: collapse;
	borer: 1px solid black;
	text-align: center;
}

/* 댓글 */
.score_textarea {
	position: relative;
	float: right;
	width: 500px;
	border-left: 1px solid #dedede;
	padding-right: 118px;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
}

.score_textarea textarea {
	width: 350px;
	height: 50px;
	border: none;
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	font-size: 18px;
	color: #666
}

.score_textarea .btn_entry {
	position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 50px;
	background: #231f20;
	font-size: 18px;
	font-weight: bold;
	color: #cdc197;
	text-align: center;
	line-height: 50px;
	border: 0;
	border-radius: 15px 15px 15px 15px;
	outline: none;
} /*1113*/
.score_etc {
	position: absolute;
	right: 0;
	top: -12px;
	font-size: 13px;
	color: #666
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시글 상세</title>
</head>
<body>
<div id="mask"></div>
<div class="window"></div>
<!-- 글삭제 -->
   <div class="deleteWindow window">
      <div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
      <div id="deleteBtnArea">
         <input type="button" id="deleteBtn" value="삭제"/>
         <input type="button" class="cancelBtn" value="취소"/>
      </div>
    </div>
    <!-- 댓글삭제 -->
    <div class="deleteWindow2 window">
      <div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
      <div id="deleteBtnArea">
         <input type="button" id="deleteBtn2" value="삭제"/>
         <input type="button" class="cancelBtn" value="취소"/>
      </div>
    </div>
    <!-- 글 수정 -->
    <div class="updateWindow window">
       <form action="mypageUpdate.b" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
          <div id="updateMessage">
             <textarea id="updateContent" name="txtComment"></textarea>
          </div>
          <div id="updateBtnArea">
          <input type="file" name="file"/>
             <input type="submit" id="updateBtn" value="수정"/>
             <input type="button" class="cancelBtn" value="취소"/>
             <input type="hidden" name="writeno"/>
             <input type="hidden" value="${memberUser.userId }" name="pageid">
            <input type="hidden" name="filepath"/>
            
          </div>
       </form>
    </div>
    <!-- 댓글 수정 -->
    
    
    <div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top">
			<c:import url="../common/top.jsp" charEncoding="UTF-8" />
		</div>
		<div id="t-r"></div>
	</div>
	
	<div id="container">
      	<div id="left" class="box">
        	<h2>LEFT</h2>
	        <ul>
	          <li><a href="mypage.b">MyPage</a></li>
	          <li><a href="alink.do?path=channelListView/channelList">채널</a></li>
	          <li><a href="selectGroupList.y">그룹</a></li>
	          <li><h4>뉴스피드</h4></li>
	          <li id="notice">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>

	        </ul>
      	</div>
		<!-- 게시글 부분 -->
			
				<div id="content">
				<div class="writeList">
						<table class="writerInfo">
							<tr class="writerInfoTr">

								<td class="writerPhoto" rowspan="2"><c:if
										test="${mypage.userprofile != null}">
										<a href="mypage2.b?userid=${mypage.userid}">
										<img src="${mypage.userprofile}"
											style="width: 50px; height: 50px;">
											</a>
									</c:if> <c:if test="${mypage.userprofile eq null}">
									<a href="mypage2.b?userid=${mypage.userid}">
										<img src="/sins/resources/images/missingNO.jpg"
											style="width: 50px; height: 50px;"></a>
									</c:if></td>
								<td class="writerName">
								<a href="mypage2.b?userid=${mypage.userid}">
								${mypage.username}
								</a>
								</td>
							</tr>
							<tr>
								<td class="writeDate">${mypage.writedate}</td>
							</tr>
						</table>
						<div class="contentContainer">
							${mypage.content} <br>
							<c:if test="${not empty mypage.filepath}">
								<c:forTokens var="pic" items="jpg,jpeg,bmp,png,gif" delims=",">
									<c:if test="${fn:split(mypage.filepath,'.')[1] eq pic}">
										<center>
											<img
												src="${pageContext.request.contextPath}/resources/file/${mypage.userid}/${mypage.filepath}"
												style="width: 200px;" />
										</center>
									</c:if>
								</c:forTokens>

								<c:if test="${fn:split(mypage.filepath,'.')[1] eq 'mp4'}">
									<center>
										<video width="480" height="360" controls>
											<source
												src="${pageContext.request.contextPath}/resources/file/${mypage.userid}/${mypage.filepath}"
												type="video/mp4">
										</video>
									</center>
								</c:if>
							</c:if>
						</div>
						<div class="buttonContainer">
							<table>
								<tr>
									<td><c:if test="${not empty mypage.filepath}">
											<a
												href="download.p?userId=${mypage.userid}&fileName=${mypage.filepath}">${fn:split(mypage.filepath,'=')[1]}</a>
										</c:if> <c:if test="${empty mypage.filepath}">
        		                                                첨부파일 없음
        		                        </c:if></td>
								</tr>
								<tr>

									<c:set var="check" value="0" />
									<c:forEach var="like" items="${likeList}">
										<c:if test="${like.writeNo == item.writeno && check == 0}">
											<c:set var="check" value="1" />
										</c:if>
									</c:forEach>
									<input type="hidden" class="mylike" value="${mypage.writelike}" />
									<c:if test="${check == 1}">
										<td><input type="hidden" class="mylike"
											value="${mypage.writelike}" /> ${mypage.writelike}명이 좋아합니다. <input
											type="button" class="unlike" value="좋아요 취소" /> <input
											type="hidden" class="writeNo" value="${mypage.writeno}" /></td>
									</c:if>
									<input type="hidden" class="mylike" value="${mypage.writelike}" />
									<c:if test="${check == 0}">
										<td><input type="hidden" class="mylike"
											value="${mypage.writelike}" /> ${mypage.writelike}명이 좋아합니다. <input
											type="button" class="like" value="좋아요" /> <input
											type="hidden" class="writeNo" value="${mypage.writeno}" /></td>
									</c:if>
									<input type="hidden" class="writeNo" value="${mypage.writeno}" />
									<c:if test="${mypage.userid == loginUser.userId}">
										<td><input type="button" class="update"
											onclick="updateWritePage(${mypage.writeno}, '${mypage.content}', '${mypage.filepath}');"
											value="수정" /></td>
										<td><input type="button" class="deleteWrite"
											onclick="deleteWrite(${mypage.writeno});" value="삭제" /></td>
									</c:if>
									<!-- 원석부분 -->
									<c:if test="${mypage.userid ne loginUser.userId}" >
										<c:set var="ff" value="0"/>
										<c:forEach var="fire" items="${fireList }">
											<c:if test="${mypage.writeno eq  fire.fireNo}">
												<c:set var="ff" value="1"/>
											</c:if>
										</c:forEach>
										<c:if test="${ff eq  0}">
											<td><input type="button" class="doFire" value="신고" /></td>
											
										</c:if>
										<c:if test="${ff eq  1}">
											<td><input type="button" class="fireCancel" value="신고취소" /></td>
										</c:if>
										<td><input type="hidden" name="fireId" value="${memberUser.userId }" /></td>
										<td><input type="hidden" name="firNo" value="${mypage.writeno }" /></td>
									</c:if>
									<!-- 여기까지 원석부분 -->
									<td><input type="button" class="comment" value="댓글" /></td>
									<td><input type="hidden" class="writeNo"
										value="${mypage.writeno}" /></td>
									</tr>
							</table>
						</div>
				<form id="mypageform3"action="" class="commentForm" method="post" enctype="multipart/form-data">
					<div class="score_textarea" >
						<input type="hidden" value="${loginUser.userId}" name="userid">
						<input type="hidden" value="${mypage.writeno }" name="contentno" class="contentno">
						<textarea id="txtComment" name="content" title="댓글 입력"
							placeholder="댓글을 입력하세요!" cols="50" rows="1"class="commentTextarea"></textarea>

						<input type="button" class="commentSubmit" id="btnSave" value="입력">
					</div>
				</form>
				<div class="commentlist">
				
				</div>
				</div>
			
	        
		</div>
		
    	<div id="right" class="box">
      		<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
    	</div>
   	</div>
 	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
  	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>