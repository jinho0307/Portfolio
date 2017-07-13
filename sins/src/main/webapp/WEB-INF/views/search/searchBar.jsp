<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style>

 #searchResult{
 	display:none;
	position:relative; border:1px solid; min-height:100px;
	height:auto;
	width:70%;
	margin-left:14.5%;
	background:white;
	font-size:10pt;
	color:#9581BF;
	font-weight:bold;
	z-index:101;
	}
	
	#page{
	
	position:relative; 
	min-height:0px;
	height:auto;
	width:100%;
	float:left;
	text-align:center;
	
	z-index:101;
	}
	
	#btns{
	position:relative;
	width:100%;
	background:white;
	}
	
	.gray{
	color:gray;
	font-size:8pt;
	cursor:pointer;
	}
	
	.trs{
	cursor:pointer;
	
	}
	
	.resultTable{
	
	position:relative;
	width:100%;
	border-spacing:0px;
	}
	
	button{
	cursor:pointer;
	}
	
	
	
	@media screen and (max-width:900px) {
		#searchResult{
		width:80%;
		
		}
		#searchResult{
 		margin-left:9.8%;
		}
	
	}
	
	
	
	
	
	
	</style>
<script>





$( function() {

	
	
	word="";
  $('#s').keyup(function() {
	  word=$(this).val();
	  
	  if($('#s').val().length == 0){
		  $("#searchResult").css("display", "none");
		  return;
		  
	  }
	  
	
	  $("#searchResult").css("display", "block");
   $.ajax({
      url : "totalSearch.n",
      type : "post",
      data : {"word" : $(this).val()},
           
      success : function(result) {
    	  
    	  var tag="";
    	  if(result.mlist.length>0){
    	  	tag+="사람<br><table class='resultTable'>";
	    	  for(var i=0;i<result.mlist.length;i++){
	    	 
	    	 
				tag+="<tr onclick=location.href='mypage2.b?userid="+result.mlist[i].userId+"' class='trs'><td style='width:20%;'>"+
				"<img src='" +"${pageContext.request.contextPath}/resources/file/"+result.mlist[i].userId+"/"+result.mlist[i].userProfile+"' style='width: 50px; height: 50px;' />"+
				"</td><td style='width:40%; text-align:left;'>"+result.mlist[i].userName+"</td><td style='width:40%; padding-left:10px;'>";
				if(result.mlist[i].isFriend=='Y')
					tag+="<label class='gray'>이미 친구입니다</label>";
							
				tag+="<br><label class='gray'>"+result.mlist[i].address+" 거주</label>";	
					
				
				tag+="</td></tr>";
				
					
	    	  }
	    	  
	    	  tag+="</table> <button id='btns' onclick=location.href='searchMember.n?word="+word+"'>더보기</button><br><hr>";
    	  }
	    	  
	     	if(result.clist.length>0){
	    		
	     		tag+="채널<br><table class='resultTable'>";
	     		for(var i=0;i<result.clist.length;i++){
	   	    	 
	     			
					tag+="<tr onclick=location.href='selectChannelList.l?channel_no="+result.clist[i].channelNo+"' class='trs'><td style='width:20%;'>"+
					"<img src='"+"${pageContext.request.contextPath}/resources/file/"+result.clist[i].userId+"/"+result.clist[i].filePath+"' style='width: 50px; height: 50px;' />"+
					"</td><td style='width:40%; text-align:left;'>"+result.clist[i].channelName+"</td><td style='width:40%; padding-left:10px;'>";
					
					if(result.clist[i].isFollow=='Y')
						tag+="<label class='gray'>팔로우 중</label>";
						
						
					tag+="<br><label class='gray'>카테고리 "+result.clist[i].category+"</label>";	
					tag+="<br><label class='gray'>팔로우 수 "+result.clist[i].like+"</label>";
					
					tag+="</td></tr>";
					
						
		    	  }
		    	  
		    	  tag+="</table> <button id='btns' onclick=location.href='searchChannel.n?word="+word+"'>더보기</button><br><hr>";
	    		
	    		
	    		
	    	} 
	     	
			if(result.glist.length>0){
	    		
	     		tag+="그룹<br><table class='resultTable'>";
	     		for(var i=0;i<result.glist.length;i++){
	   	    	 
	   	    	 
					tag+="<tr onClick=location.href='selectGroup.y?groupNo="+result.glist[i].groupNo+"' class='trs'><td style='width:20%;'>"+
					"<img src='" +"${pageContext.request.contextPath}/resources/file/"+result.glist[i].userId+"/"+result.glist[i].filePath+"' style='width: 50px; height: 50px;' />"+
					"</td><td style='width:40%; text-align:left;'>"+result.glist[i].groupName+"</td><td style='width:40%; padding-left:10px;'>";
					
					if(result.glist[i].isJoin=='Y')
						tag+="<label class='gray'>팔로우 중</label>";
						
						
					tag+="<br><label class='gray'>카테고리 "+result.glist[i].category+"</label>";	
					tag+="<br><label class='gray'>가입자 수 "+result.glist[i].joinNum+"</label>";
					
					tag+="</td></tr>";
					
						
		    	  }
		    	  
		    	  tag+="</table> <button id='btns' onclick=location.href='searchGroup.n?word="+word+"'>더보기</button><br><hr>";
	    		
	    		
	    		
	    	} 
	    	
	    	  $("#searchResult").html(tag);
	      
      }
      
   });
});
  
  
 	
});


$(document).on("blur", "#s", function(){
	
	setTimeout(function(){
		 $("#searchResult").css("display", "none"); 

	}, 300);
});


$(document).on("mouseenter",".trs", function(){
	$(this).css("background","#9581BF");
	$(this).css("color","white");
	$(this).css("border","1px solid #9581BF");
	
	
});

$(document).on("mouseleave",".trs", function(){
	$(this).css("background","white");
	$(this).css("color","#9581BF");
	$(this).css("border","none");
	
	
});








</script>
</head>
<body>


<input type="text" id="s" placeholder="검색하기"/>

<div id="page">
<div id="searchResult" >

</div>
</div>



</body>
</html>