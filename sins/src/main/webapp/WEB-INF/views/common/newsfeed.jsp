<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/mypage/mypage-common.css" />
<script src="http://vjs.zencdn.net/c/video.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
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
		
		
		$('#content').css('height', $(window).height() -60);
		$(window).resize(function() {
			$('#content').css('height', $(window).height() -60);
			
		});
		
		$("#mypageform2").click(function() {
			var url = "mypage.b";
			$(location).attr('href', url);
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
			console.log(commentNo);
			console.log(classify);
			console.log(fireId);
			console.log(fireNo);
			console.log(lev);
			console.log(comment);
			
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
			console.log(commentNo);
			console.log(classify);
			console.log(fireId);
			console.log(fireNo);
			console.log(lev);
			console.log(comment);
			
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
        	var classI = $(this).parent().next().next().children().val();
        	var writeNo = $(this).parent().next().children().val();
    		var userId = '${loginUser.userId}';
    		var classify = 0;
    		if(classI == 'MY_PAGE'){
    			classify = 0;
    		}if(classI == 'GROUP_MAIN'){
    			classify = 1;
    		}if(classI == 'CHANNEL_ARTICLE'){
    			classify = 2;
    		}
    		
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
						if(classI == 'MY_PAGE'){
						if(check == 0){
							commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userid+'/'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table></div>');
							if(list.commentList[i].userid == userId){
							commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
							}
						}
						else {
							commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userid+'/'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table></div>');
							if(list.commentList[i].userid == userId){
							commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
							}else{
								<% // TODO Auto-generated method stub %>
								commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
							}
						}
						}if(classI == 'CHANNEL_ARTICLE'){
							if(check == 0){
								commentlist.append('<div class="commentOne"><hr><table><tr><td><h5><table><tr><td>'+list.commentList[i].user_id+'<td></tr><tr><td>'+list.commentList[i].comment_date+'</td></tr></table></h5></td></tr></table></div>');
								if(list.commentList[i].user_id == userId){
								commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].chan_article_no + '"/></div>');
								}else{
									<% // TODO Auto-generated method stub %>
									commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].chan_article_no+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].user_id+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
								}
							}
							else {
								commentlist.append('<div class="commentOne"><hr><table><tr><td><h5><table><tr><td>'+list.commentList[i].user_id+'<td></tr><tr><td>'+list.commentList[i].comment_date+'</td></tr></table></h5></td></tr></table></div>');
								if(list.commentList[i].user_id == userId){
								commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].chan_article_no + '"/></div>');
								}else{
									<% // TODO Auto-generated method stub %>
									commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].chan_article_no+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].user_id+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
								}
							}
							}if(classI == 'GROUP_MAIN'){
								if(check == 0){
									commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userId+'/'+list.commentList[i].photopath+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].userName+'<td></tr><tr><td>'+list.commentList[i].commentDate+'</td></tr></table></h5></td></tr></table></div>');
									if(list.commentList[i].userId == userId){
									commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentNo + '"/></div>');
									}else{
										<% // TODO Auto-generated method stub %>
										commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentNo+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userId+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
									}
								}
								else {
									commentlist.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userId+'/'+list.commentList[i].photopath+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].userName+'<td></tr><tr><td>'+list.commentList[i].commentDate+'</td></tr></table></h5></td></tr></table></div>');
									if(list.commentList[i].userId == userId){
									commentlist.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentNo + '"/></div>');
									}else{
										<% // TODO Auto-generated method stub %>
										commentlist.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentNo+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userId+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
									}
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
			var classI = $(this).prev().val();
			
			
			console.log(classI);
			if(commentTextarea != ""){
        	$.ajax({
				url : 'insertMypageComment.b'
				,dataType : 'json'
				,data : commentForm
				,contentType : 'application/json; charset=utf-8'
				,success : function(list) {
					var comment = list.commentList;
					var fire = list.fireCommentList;
					
					$("div").remove(".commentOne");
					
					$(".commentTextarea").val("");
					
					for(var i = 0; i < list.commentList.length; i ++) {
						var check = 0;	
					
						for(var j=0;j < list.fireCommentList.length; j++){
							var check = 0;	
							
							for(var j=0;j < list.fireCommentList.length; j++){	
								if(list.commentList[i].commentno == list.fireCommentList[j].commentNo){
									check = 1;
								}					
							}
							if(classI == 'MY_PAGE'){
							if(check == 0){
								thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userid+'/'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table></div>');
								if(list.commentList[i].userid == userId){
									thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
								}else{
									<% // TODO Auto-generated method stub %>
									thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
								}
							}
							else {
								thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userid+'/'+list.commentList[i].userprofile+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].username+'<td></tr><tr><td>'+list.commentList[i].commentdate+'</td></tr></table></h5></td></tr></table></div>');
								if(list.commentList[i].userid == userId){
									thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentno + '"/></div>');
								}else{
									<% // TODO Auto-generated method stub %>
									thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentno+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userid+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
								}
							}
							}if(classI == 'CHANNEL_ARTICLE'){
								if(check == 0){
									thisdiv.append('<div class="commentOne"><hr><table><tr><td><h5><table><tr><td>'+list.commentList[i].user_id+'<td></tr><tr><td>'+list.commentList[i].comment_date+'</td></tr></table></h5></td></tr></table></div>');
									if(list.commentList[i].user_id == userId){
										thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].chan_article_no + '"/></div>');
									}else{
										<% // TODO Auto-generated method stub %>
										thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].chan_article_no+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].user_id+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
									}
								}
								else {
									thisdiv.append('<div class="commentOne"><hr><table><tr><td><h5><table><tr><td>'+list.commentList[i].user_id+'<td></tr><tr><td>'+list.commentList[i].comment_date+'</td></tr></table></h5></td></tr></table></div>');
									if(list.commentList[i].user_id == userId){
										thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].chan_article_no + '"/></div>');
									}else{
										<% // TODO Auto-generated method stub %>
										thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].chan_article_no+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].user_id+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
									}
								}
								}if(classI == 'GROUP_MAIN'){
									if(check == 0){
										thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userId+'/'+list.commentList[i].photopath+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].userName+'<td></tr><tr><td>'+list.commentList[i].commentDate+'</td></tr></table></h5></td></tr></table></div>');
										if(list.commentList[i].userId == userId){
											thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentNo + '"/></div>');
										}else{
											<% // TODO Auto-generated method stub %>
											thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentNo+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userId+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne"><label>'+list.commentList[i].content+'</label><br><input type="button" class="doCommentFire" value="신고"/></div>');
										}
									}
									else {
										thisdiv.append('<div class="commentOne"><hr><table><tr><td><img src="/sins/resources/file/'+list.commentList[i].userId+'/'+list.commentList[i].photopath+'" style="width: 30px; height: 30px;"></td><td><h5><table><tr><td>'+list.commentList[i].userName+'<td></tr><tr><td>'+list.commentList[i].commentDate+'</td></tr></table></h5></td></tr></table></div>');
										if(list.commentList[i].userId == userId){
											thisdiv.append('<div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="update2" value="수정"/><input type="button" class="delete2" value="삭제"/><input type="hidden" class="hdwriteNo" value="' + writeNo + '"/><input type="hidden" class="hdcommentNo" value="' + list.commentList[i].commentNo + '"/></div>');
										}else{
											<% // TODO Auto-generated method stub %>
											thisdiv.append('<input type="hidden" name="commentNo" value="'+list.commentList[i].commentNo+'"/><input type="hidden" name="fireId" value="'+list.commentList[i].userId+'"/><input type="hidden" name="fireNo" value="'+writeNo+'"/><div class="commentOne">'+list.commentList[i].content+'<br><input type="button" class="unCommentFire" value="신고취소"/></div>');
										}
									}
									}
							
						}}
					
					
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
			console.log(commentNo+" "+writeNo);
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
 

 
 // main화면에서 수정버튼 클릭 시 작동.
 function updateWritePage(writeno, content, filepath) {
    mask();
    $("#updateContent").val(content);
	$("input[name=writeno]").val(writeno);
	$("input[name=filepath]").val(filepath);
    $(".updateWindow").show();
 }
 
 
 
 
</script>
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
	<!-- 댓글삭제 -->
	<div class="deleteWindow2 window">
		<div id="deleteMessageArea">정말 삭제 하시겠습니까?</div>
		<div id="deleteBtnArea">
			<input type="button" id="deleteBtn2" value="삭제" /> <input
				type="button" class="cancelBtn" value="취소" />
		</div>
	</div>
	<!-- 글 수정 -->
	<div class="updateWindow window">
		<form action="mypageUpdate2.b" method="post"
			enctype="multipart/form-data" accept-charset="UTF-8">
			<div id="updateMessage">
				<textarea id="updateContent" name="txtComment" cols="40" rows="1"></textarea>
			</div>
			<div id="updateBtnArea">
				<input class="file" type="file" name="file" /> <input type="submit"
					id="updateBtn" value="수정" /> <input type="button" class="cancelBtn"
					value="취소" /> <input type="hidden" name="writeno" /> <input
					type="hidden" value="${memberUser.userId }" name="pageid">
				<input type="hidden" name="filepath" />

			</div>
		</form>
	</div>
	<!-- 댓글 수정 -->

	<div class="window"></div>



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
	          <li id="notice1">고객센터</li>
	          <li class="notice"><a href="selectNotice.k"> └공지사항</a></li>
	          <li class="notice"><a href="alink.do?path=faq/faq">└FAQ</a></li>
	          <li class="notice"><a href="selectQna.n">└QNA</a></li>
	        </ul>
      	</div>
		<div id="content">
			<div id="add"><img src="/sins/resources/images/add.jpg" style="width:100%; height:100%;"></div>
			<form id="mypageform2" enctype="multipart/form-data" method="post"
				action="mypageInsert.b" accept-charset="UTF-8">
				<div class="content2">
				<br/>
					<h3>&nbsp;&nbsp; 글 작성 하기</h3>
					<input type="hidden" value="${memberUser.userId }" name="pageid">
					&nbsp;&nbsp;&nbsp;<textarea id="txtContent" name="txtContent" cols="55" rows="4" style="resize:none;"></textarea>
					<!-- <input id="file" type="file" name="file"> <select name="select">
						<option value="0" selected>전체 공개
						<option value="1">친구 공개
						<option value="2">나만 보기
					</select> <input type="submit" class="btn_entry Lang-LBL0000" id="btnSave" value="입력"> -->

				</div>

			</form>


			<br>
			<!-- 게시글 부분 -->
			<c:forEach var="item" items="${news}">
				
				<div class="writeList">
						<table class="writerInfo" style="width:120px;">
							<tr class="writerInfoTr">

								<td class="writerPhoto" rowspan="2"><c:if
										test="${item.userprofile != null}">
										<a href="mypage2.b?userid=${item.userid}">
										<img src="/sins/resources/file/${item.userid }/${item.userprofile}"
											style="width: 50px; height: 50px;">
											</a>
									</c:if> <c:if test="${item.userprofile eq null}">
									<a href="mypage2.b?userid=${item.userid}">
										<img src="/sins/resources/images/missingNO.jpg"
											style="width: 50px; height: 50px;"></a>
									</c:if></td>
								<td class="writerName">
								<a href="mypage2.b?userid=${item.userid}">
								${item.username}   ${item.classify}
								</a>
								</td>
							</tr>
							<tr>
								<td class="writeDate">${item.writedate}</td>
							</tr>
						</table>
						<div class="contentContainer">
							${item.content} <br>
							<c:if test="${not empty item.filepath}">
								<c:forTokens var="pic" items="jpg,jpeg,bmp,png,gif" delims=",">
									<c:if test="${fn:split(item.filepath,'.')[1] eq pic}">
										<center>
											<img
												src="${pageContext.request.contextPath}/resources/file/${item.userid}/${item.filepath}"
												style="width: 200px;" />
										</center>
									</c:if>
								</c:forTokens>

								<c:if test="${fn:split(item.filepath,'.')[1] eq 'mp4'}">
									<center>
										<video width="480" height="360" controls>
											<source
												src="${pageContext.request.contextPath}/resources/file/${item.userid}/${item.filepath}"
												type="video/mp4">
										</video>
									</center>
								</c:if>
							</c:if>
						</div>
						<div class="buttonContainer">
							<table>
								<tr>
									<td><c:if test="${not empty item.filepath}">
											<a
												href="download.p?userId=${item.userid}&fileName=${item.filepath}">${fn:split(item.filepath,'=')[1]}</a>
										</c:if> <c:if test="${empty item.filepath}">
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
									<input type="hidden" class="mylike" value="${item.writelike}" />
									<c:if test="${check == 1}">
										<td><input type="hidden" class="mylike"
											value="${item.writelike}" /> ${item.writelike}명이 좋아합니다. <input
											type="button" class="unlike" value="좋아요 취소" /> <input
											type="hidden" class="writeNo" value="${item.writeno}" /></td>
									</c:if>
									<input type="hidden" class="mylike" value="${item.writelike}" />
									<c:if test="${check == 0}">
										<td><input type="hidden" class="mylike"
											value="${item.writelike}" /> ${item.writelike}명이 좋아합니다. <input
											type="button" class="like" value="좋아요" /> <input
											type="hidden" class="writeNo" value="${item.writeno}" /></td>
									</c:if>
									<input type="hidden" class="writeNo" value="${item.writeno}" />
									<c:if test="${item.userid == loginUser.userId}">
										<td><input type="button" class="update"
											onclick="updateWritePage(${item.writeno}, '${item.content}', '${item.filepath}');"
											value="수정" /></td>
										<td><input type="button" class="deleteWrite"
											onclick="deleteWrite(${item.writeno});" value="삭제" /></td>
									</c:if>
									<c:if test="${item.userid != loginUser.userId}">
										<td><input type="button" class="report"
											onclick="reportWrite('${item.userid}', ${item.writeno});"
											value="신고" /></td>
									</c:if>
									<td><input type="button" class="comment" value="댓글" /></td>
									<td><input type="hidden" class="writeNo"
										value="${item.writeno}" /></td>
										<td><input type="hidden" value="${item.classify }" name="classify"></td>
									</tr>
							</table>
						</div>
				<form id="mypageform3"action="" class="commentForm" method="post" enctype="multipart/form-data">
					<div class="score_textarea" >
						<input type="hidden" value="${loginUser.userId}" name="userid">
						<input type="hidden" value="${item.writeno }" name="contentno">
						
						<textarea id="txtComment" name="content" title="댓글 입력"
							placeholder="댓글을 입력하세요!" cols="50" rows="1"class="commentTextarea"></textarea>
                        <input type="hidden" value="${item.classify }" name="classfy">
						<input type="button" class="commentSubmit" id="btnSave" value="입력">
						
					</div>
				</form>
				<div class="commentlist">
				
				</div>
				</div>
			</c:forEach>

			<br> <br>
		
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