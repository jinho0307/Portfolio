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
	href="/sins/resources/css/search/search-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
<style>
.no_underline {
	text-decoration: none;
}
.link{

	color:blue;
	font-size:8pt;
}

.link:hover{
	text-decoration:under_line;
}


#left{
width: 200px;
}

#container {
width:1000px;
}


#contentDiv{
	width: 550px;
	min-height: 500px;
	padding: 10px;
	height:auto;
	margin-left:10px;
	float: left;
	background-color: white;
	overflow: auto;
	
	
}

#tab{
position:relative;
width:100%;

}

.tabtd{
padding-left:20px;
padding-right:20px;
border-spacing:0px;
color:#9581BF;
cursor:pointer;
}

.grayc{
font-size:8pt;
color:gray;
font-weight:bold;
}


.addbtn{
background:white;

}

#groupTable{
width:100%;
border-spacing:0px;

}

.groupTd{
padding-top:10px;
padding-bottom:10px;
color:#9581BF;
border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;

}

.curs{
cursor:pointer;
}
.curs:hover{

text-decoration:underline;

}
.tabtd{
cursor:pointer;
}

@media screen and (max-width:500px) {
	#top {
		margin: auto;
		both: clear;
		width: 65%;
	}
	#t-l {
		display: block;
	}
	#t-r {
		display: block;
	}
	#container {
		width: auto;
	}
	#left {
		display: none;
		float: none;
		width: auto;
	}
	#content {
		overflow: auto;
		float: none;
		width: 100%;
		margin: auto 10px 10px;
	}
	#right {
		display: none;
		float: none;
		width: auto;
	}
	.groupTd {
		width : 100px;
	}
	
	#contentDiv {
		width : 380px;
		margin : auto;
	}
	
}
</style>
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
});

page=1;



$(function(){
	$("#content").scroll( function() {
		  var elem = $("#content");
		 
		  if ( elem[0].scrollHeight - elem.scrollTop() == elem.outerHeight())
		    {
			 
		        setTimeout(function(){
		        	appender();	
		        },300);
		        
		    }
		});
	
});



	

	function appender(){
		
		var word='${word}';
		var p= ++page;
		
		$.ajax({
			url : 'appendGroup.n?word='+word+'&page='+p,

			
			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {
				
				
				for(var i=0; i<result.glist.length; i++){
				 
					console.log(result.glist[i].isJoin);
					var tag="<tr><td class='groupTd' onclick="+
					"location.href='selectGroup.y?groupNo="+result.glist[i].groupNo+"'> <img class='curs' src='"+
					"${pageContext.request.contextPath}/resources/file/"+result.glist[i].userId+"/"+result.glist[i].filePath+"' style=' height: 90px;' /></td>"+
					"<td class='groupTd' style='text-align:left;'>"+
					"<label onclick=location.href='selectGroup.y?groupNo="+result.glist[i].groupNo+"' class='curs'>"+
					result.glist[i].groupName+"</label><br><label class='grayc'>";
					
					
					if( result.glist[i].isJoin == 'Y')
						tag+="가입된 그룹";
					
					tag+= "<br> 카테고리- "+result.glist[i].category+
						" · 가입자 수 "+result.glist[i].joinNum+"명";
					
					if(result.glist[i].info!=null)
						tag+="<br>"+result.glist[i].info;
					
					tag+="</label></td>";
					
					
					
					$("#groupTable > tbody:last").append(tag);
				
				}
				
			
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


			<div id="contentDiv" class="box">
				<div id="tab">
				<table>
				<tr><td class="tabtd" onclick="location.href='searchMember.n?word=${word}'" >사람</td>
				<td class="tabtd" onclick="location.href='searchChannel.n?word=${word}'" >채널</td>
				<td class="tabtd" onclick="location.href='searchGroup.n?word=${word}'" style='background:#9581BF; color:white;'>그룹</td></tr>
				</table>
				</div>
				
				<hr>
			
			
			<c:if test="${not empty glist }">
			<table id="groupTable">	
			
			<tbody>
			
			 <c:forEach var="group" items="${glist }">
			
				
				<tr>
				<td class='groupTd'  onclick="location.href='selectGroup.y?groupNo=${group.groupNo}'"><img class='curs' src="${pageContext.request.contextPath}/resources/file/${group.userId}/${group.filePath }" style=' height: 90px;' /></td>
				<td class='groupTd' style=' text-align:left;'><label class='curs' onclick="location.href='selectGroup.y?groupNo=${group.groupNo}'">${group.groupName }</label><br><label class="grayc">
				<c:if test="${group.isJoin eq 'Y'}">
				가입된 그룹
				</c:if>
				<br>카테고리- ${group.category } · 가입자 수 ${group.joinNum }명
				<c:if test="${not empty group.info }">
				<br>${group.info }
				</c:if>
				</label></td>
				
				
				</tr>
				
				
				
					
					
				
				
				
					
					
			
			</c:forEach> 
			
			</tbody>
			</table>	
	</c:if>
	
	<c:if test="${empty glist }">
		<br><br><label class="font10pt" >검색결과가 없습니다.</label>
	</c:if>
				

				


				
				

			</div>




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




