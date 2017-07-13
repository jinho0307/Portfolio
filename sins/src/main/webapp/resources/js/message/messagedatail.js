/**
 * 
 */


$( document ).ready(function() { 
    
	
	
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


function recivedel() {
	var form = document.message_no;
	 form. action =  'msgrecivedel.j';
	 form.method = "post";
	 form.submit();
}
function senddel() {
	var form = document.message_no;
	 form. action =  'msgsenddel.j';
	 form.method = "post";
	 form.submit();
}
// 답장 컨트롤러
function reference() {
	var form = document.message_no;
	 form. action =  'msgreference.j';
	 form.method = "post";
	 form.submit();
}