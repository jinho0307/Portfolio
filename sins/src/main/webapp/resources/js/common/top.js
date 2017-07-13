/**
 * 
 */
$(function() {
	$('#msglist').mouseleave(function() {
		$('#msglist').hide();
		$('#msglist').text("");
	})
	$('#alertlist').mouseleave(function() {
		$('#alertlist').hide();
		$('#alertlist').text("");
	})
	
	$(document).on("mouseenter",".msglistajax",function(){
		
		$(this).css("background","#E7E4F9");
	})
	
	$(document).on("mouseleave",".msglistajax", function() {
		$(this).css("background","white");
	})
	parent.onalert();
	$('#aldi').slideUp(0);
})


function message() {
		location.href="msgreadlist.j";
	}
	
	function goHome() {
		location.href="newsfeed.b";
	}
	
	function goMyInfo() {
		location.href="alink.do?path=member/myInfoCheck";
	}
	
	function logout(){
		location.href="logout.k";
	}
	function removealertlist() {
		$('#alertlist').hide();
	}
	

$(document).on("mouseenter", "#allet" , function(){
		$('#msglist').hide();
			$('#alertlist').css("display", "block");
			loadRequest(null, 0);
		
});
	
$(document).on("mouseleave","#allet", function(){
		
		$('#alertlist').css("display", "none");
	
});

$(document).on("mouseenter", "#message" , function(){
	$('#alertlist').hide();
		$('#msglist').css("display", "block");
		loadRequest(null, 0);
	
});

$(document).on("mouseleave","#message", function(){
	
	$('#msglist').css("display", "none");

});


	function msgover() {
		
//		$('#msglist').text("");
//		var msgdiv = $('#msglist');
		$.ajax({
			url : "headmsglist.j",
			success : function(list) {
				
				var x = "";
				if(list.length > 0){
					x+="<label style='text-align:left; font-weight:bold; font-size:10pt;'>받은 쪽지</label><hr><table style='width:100%;border-spacing:0px;'>"	;	
					
				
				for(var i = 0  ; i < list.length; i++){
					
					x+="<tr><td style='cursor:pointer; padding-left:5%;text-align:left;width:15%;font-size:9pt;border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;' >"+ 
					"<img src='" +"/sins/resources/file/"+list[i].send_id+"/"+list[i].profile+"' style='width: 40px; height: 40px;' /></td>"+ 
					"<td style='padding-left:5%; cursor:pointer; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; color:#9581BF; text-align:left;width:70%;font-size:9pt;' onclick='msgdetail("+")'>"+list[i].content+"</td></tr>";
				
//					
//					"<div class='msglistajax'"+"onclick='msgdetail("+
//					list[i].message_no+")'>" +
//					"<img class='msgajaximg' src='/sins/resources/file/"+list[i].send_id+"/"+list[i].profile+"'>"+
//					list[i].content+"</div>";
//					msgdiv.append(x);
//					msgdiv.show();
				}
	  			}else{
					$('#msglist').text("");
					x+="<label style='margin-left:25%;font-weight:bold; font-size:8pt;'>쪽지가 없습니다</label>";
					
				}
				$('#msglist').html(x);
//				msgdiv.show();
			}
		})
		
	}
	
function alert1() {
	location.href="alertlist.j";
}

function alertover() {
//	$('#msglist').hide();
// 	var aldiv = $('#alertlist');
// 	aldiv.text("");
	$.ajax({
		url : "alertlistajaxtop.j",
		success : function(list) {
			
			var x ="";
			
  			if(list.length > 0){
			x+="<label style='text-align:left; font-weight:bold; font-size:10pt;'>알림 사항</label><hr><table style='width:100%;border-spacing:0px;'>"	;
			
			for(var i = 0  ; i < list.length; i++){
			 
				
			x+="<tr><td style='cursor:pointer; padding-left:5%;text-align:left;width:15%;font-size:9pt;border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;' >"+ 
				"<img src='" +"/sins/resources/file/"+list[i].send_id+"/"+list[i].filepath+"' style='width: 40px; height: 40px;' /></td>"+ 
				"<td style='padding-left:5%; cursor:pointer; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; color:#9581BF; text-align:left;width:70%;font-size:9pt;' onclick='alert1("+")'>"+list[i].classify+"</td></tr>";

//				"<div class='msglistajax'"+"onclick='alert1("+
//				")'>" +
//				"<img class='msgajaximg' src='/sins/resources/file/"+list[i].send_id+"/"+list[i].filepath+"'>"+
//				list[i].classify+"</div>";
			

// 			aldiv.append(x);
// 			aldiv.show();
			}
  			}else{
				$('#alertlist').text("");
				x+="<label style='margin-left:25%;font-weight:bold; font-size:8pt;'>알림 사항이 없습니다 </label>";
				
			}
  			$('#alertlist').html(x);
//			aldiv.show();
		}
	});
	
}
function msgdetail(msgno) {
	location.href="msgheaddetail.j?msgno="+msgno;		
}




//이쪽부터 친구쪽
function loadRequest(userId, option){
	
	
	 $.ajax({
		 
	 
			url : 'friendAccept.n',

			data : {"userId" : userId, "option" : option},
			
			dataType : 'json',

			contentType : 'application/json; charset=utf-8',

			success : function(result) {
				var tag="";
				
				if(result.resList.length > 0){

					tag+="<label style='text-align:left;font-weight:bold; font-size:10pt;'>친구 요청</label><hr><table style='width:100%;border-spacing:0px;' >";
				for(var i=0; i<result.resList.length; i++){
			
					
					
					tag+= "<tr><td style='cursor:pointer; padding-left:5%;text-align:left;width:15%;font-size:9pt;border-width:0px; border-bottom-width:2px; height:1px; border-style:groove;' onclick=location.href='mypage2.b?userid="+result.resList[i].userId+"'>"+ 
					"<img src='" +"/sins/resources/file/"+result.resList[i].userId+"/"+result.resList[i].userProfile+"' style='width: 40px; height: 40px;' /></td>"+ 
						"<td style='padding-left:5%; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; color:#9581BF; text-align:left;width:35%;font-size:9pt;'><label style='cursor:pointer;' onclick=location.href='mypage2.b?userid="+result.resList[i].userId+"'>"+result.resList[i].userName +"</td>"+
						"<td style='padding-left:5%; border-width:0px; border-bottom-width:2px; height:1px; border-style:groove; text-align:left;width:35%;font-size:9pt;'><button id = 'accept' value='"+result.resList[i].userId+"' style='font-size:9pt; background:#9581BF; color:white;'>수락</button>"+
						"<button id='reject' value='"+result.resList[i].userId+"' style='font-size:9pt; background:white; color:#9581BF;'>거절</button></td></tr>";
				
				}
				
			}else{
				$('#friendlist').text("");
				tag+="<label style='margin-left:25%;font-weight:bold; font-size:8pt;'>받은 요청이 없습니다 </label>";
				
			}
			
				
				$('#friendlist').html(tag);
			} 
}); 
	
}


$(document).on("mouseleave","#friendTab", function(){
	
		$('#friendlist').css("display", "none");
	
});


$(document).on("mouseenter", "#friendTab" , function(){
	$('#msglist').hide();
		$('#friendlist').css("display", "block");
		loadRequest(null, 0);
	
});


$(document).on("click", "#accept", function(){
	
	var userId= $(this).val();
	$('#friendlist').text("");
	loadRequest(userId, 1);
	
});


$(document).on("click", "#reject", function(){
	
	var userId = $(this).val();
	$('#friendlist').text("");

	loadRequest(userId, 2);
});
	
$(document).on("click", "#friendTab", function(){
	location.href="friendMain.n";
});

$(document).on("click", "#friendlist", function(e){
	e.stopPropagation();
	
});

