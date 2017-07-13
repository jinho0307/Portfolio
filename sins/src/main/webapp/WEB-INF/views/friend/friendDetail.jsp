<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML> 
<html>
<head>
<meta charset="UTF-8">
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>
  <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/friend/friend-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<style>
.no_underline {
	text-decoration: none;
	color:#9581BF;
}
.no_underline:hover {
	text-decoration: underline;
}
.link{

	color:blue;
	font-size:8pt;
}

.link:hover{
	text-decoration:under_line;
}


#requestDiv{
display:none;
}

#left{
width: 200px;
}

#container {
width:1120px;
}

#acceptBtn, #rejectBtn{
background:white;
width:50px;
}

#addBtn, #cancelBtn{
background:white;
width:80px;
}
</style>
<script type="text/javascript">



$(document).ready(function(){
		
	accept(null, 0);
	cancelReq(null, 0);
	recommend(null);
	
	
	
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


 $(document).on("click", "#hideRes", function(){
	
	 cancelReq(null, 0);
	 $('#responseDiv').animate({  borderSpacing: -360 }, {
		 step: function(now,fx) {
		    	
		      $(this).css('-webkit-transform','rotate('+now+'deg)'); 
		      $(this).css('-moz-transform','rotate('+now+'deg)');
		      $(this).css('transform','rotate('+now+'deg)');
		    },
		    duration:1000


		},'swing');
	 
	
	 
	 setTimeout(function(){
		 $("#responseDiv").css("display","none");
		 $("#requestDiv").css("display", "block");
	 },950);
	 
}); 



$(document).on("click", "#hideReq", function(){
		accept(null, 0);
	 $('#requestDiv').animate({  borderSpacing: -360 }, {
		 step: function(now,fx) {
		    	
		      $(this).css('-webkit-transform','rotate('+now+'deg)'); 
		      $(this).css('-moz-transform','rotate('+now+'deg)');
		      $(this).css('transform','rotate('+now+'deg)');
		    },
		    duration:1000


		},'swing');
	 
	 
	 setTimeout(function(){
		 $("#requestDiv").css("display","none");
		 $("#responseDiv").css("display","block");
	 },950);
	
	
	
	
});  

$(document).on("click", "#acceptBtn", function(){
	accept($(this).val(), 1);
	
	
	
});

$(document).on("click", "#rejectBtn", function(){
	accept($(this).val(), 2);
	
	
	
});

$(document).on("click", "#cancelBtn", function(){
	
	cancelReq($(this).val(), 1);
});

$(document).on("click", "#addBtn", function(){
	recommend($(this).val());
});


function accept(userId, option){
	
		
				
	 $.ajax({

		 
		url : 'friendAccept.n?userId='+userId+'&option='+option,

		dataType : 'json',

		contentType : 'application/json; charset=utf-8',

		success : function(result) {
			
			
			
			var tag="";
			
			
			
			if(result.resList.length > 0){
			
				
			
			tag+="<label class='font10pt'>"+result.resList.length  +"개의 친구요청이 있습니다.</label><br>"+
	
			"<label class='link' id='hideRes'>내가 전송한 요청보기</label><br><br><hr><br>";

		
			for(var i=0; i<result.resList.length; i++){
		
				
				
				tag+= "<a class='no_underline' href='mypage2.b?userid="+result.resList[i].userId+"'>"+ 
				"<img src='" +"${pageContext.request.contextPath}/resources/file/"+result.resList[i].userId+"/"+result.resList[i].userProfile+"' style='width: 80px; height: 80px;' />&nbsp"+ 
					result.resList[i].userName +"</a>"+
					
				
				
					"<div class='btnDiv'>"+
					"<button id= 'acceptBtn' value='"+result.resList[i].userId+"'>수락</button>&nbsp"+
						 
					"<button id= 'rejectBtn' value='"+result.resList[i].userId+"'>거절</button>"+
					"</div><br><br><hr><br>";
			
			}
			
		}else{
			
	
		
			tag+="<label class='link' id='hideRes'>내가 전송한 요청 보기</label><br><br><br><br>"+
			"<label style='margin: 150px;'>받은 요청이 없습니다. <br></label>"+
			"<label style='margin:160px; color:blue;'>친구를 찾아보세요.</label>";
		
			 
		}
		
		
			
			$("#responseDiv").html(tag);
		} 

		
	
	}); 
}



function cancelReq(userId, option){
	
	
	
	 $.ajax({

		 
		url : 'cancelReq.n?userId='+userId+'&option='+option,

		dataType : 'json',

		contentType : 'application/json; charset=utf-8',

		success : function(result) {
			
			var tag="";
			if(result.reqList.length>0){
			
				
				tag+="<br><label class='link' id='hideReq'>내게 전송한 요청 보기</label><br><br><hr><br>";
	
				
				for(var i =0; i<result.reqList.length; i++){
				
	
					tag+="<a class='no_underline' href='mypage2.b?userid="+result.reqList[i].userId+"'>"+
					"<img src='"+ "${pageContext.request.contextPath}/resources/file/"+result.reqList[i].userId+"/"+result.reqList[i].userProfile+"' style='width: 80px; height: 80px;' />"+
						result.reqList[i].userName +"</a>"+
	
					"<div class='btnDiv'>"+
					"<button id='cancelBtn' value='"+ result.reqList[i].userId +"'>요청 취소</button></div><br><br><hr><br>";
					
	
				}

			}else{
		
				tag+="<label class='link' id='hideReq'>내게 전송된 요청 보기</label><br><br><br><br>"+
				"<label style='margin: 150px;'>보낸 요청이 없습니다. <br></label>"+
				"<label style='margin:160px; color:blue;'>친구를 찾아보세요.</label>";
			}
			
			$("#requestDiv").html(tag);
		}
	
	}); 

}


function recommend(userId){
	
	var sendUrl="";
	
	if(userId!=null)
		sendUrl='recommend.n?resId='+userId;
	else
		sendUrl='recommend.n';
	
	 
	$.ajax({

		 
		
		url : sendUrl,

		dataType : 'json',

		contentType : 'application/json; charset=utf-8',

		success : function(result) {
			
			
			var tag="";
			if(result.recList.length>0){
			
				tag+="<label class='font10pt'>알수도 있는 친구</label><br><br><hr><br>";
	
				
				for(var i =0; i<result.recList.length; i++){
				
	
					tag+= "<a class='no_underline' href='mypage2.b?userid="+result.recList[i].userId+"'>"+ 
					"<img src='" +"${pageContext.request.contextPath}/resources/file/"+result.recList[i].userId+"/"+result.recList[i].userProfile+"' style='width: 80px; height: 80px;' />&nbsp"+ 
						result.recList[i].userName +"</a>&nbsp;&nbsp;&nbsp;&nbsp;"+
						"<label class='font8ptGray'>함께 아는 친구 "+result.recList[i].count+"명</label>"+
					
						
						"<div class='btnDiv'>"+
						"<button id= 'addBtn' value='"+result.recList[i].userId+"'>친구 추가</button>&nbsp"+
							 
						"</div><br><br><hr><br>";
					
	
				}

			}else{
		
				tag+="<label style='margin: 150px;'>추천 친구가 없습니다. <br></label>";
			}
			
			$("#recommendDiv").html(tag);
		}
	
	}); 

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
		<div id="left" class="box" >
		
			
			<%@include file="/WEB-INF/views/friend/friendFind.jsp" %>
			
		</div>
		<div id="content">


			<div id="contentDiv">



				<div id="responseDiv" class="box"></div>
				
				<div id="requestDiv" class="box"></div>

			</div>



			<div id="recommendDiv" class="box"></div>

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