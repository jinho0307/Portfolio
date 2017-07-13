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


$(function() {
	$('#msgallchk').click(function() {
		if($(this).is(':checked') == true){
			$('.msgchkbox').prop('checked', true);
		}else{
			$('.msgchkbox').prop('checked', false);
		}
	});
	if($('#selectid').val() == 'cont'){
		$('#select').val("cont").prop("selected", true);
	}else if($('#selectid').val() == 'name'){
		$('#select').val("name").prop("selected", true);
	}else{
		$('#select').val("id").prop("selected", true);
	}
	$(document).on("mouseleave", ".atagname", function(){
	       var obj = document.getElementById('mouseover');
	         
	        obj.style.display = "none";
	   });
	
	
});
function view(id) {
	 x = event.clientX;
     y = event.clientY; 
     var di = $('#mouseover');	 
     di.text(id);
    di.css({
         "top": y 
         ,"left": x +10
         , "position": "absolute"
    }).show();
    $(document).on("mouseleave", ".atagname", function(){
	       var obj = document.getElementById('mouseover');
	         
	        obj.style.display = "none";
	   });
}
function spamdel() {
	$('input[name=check_no]').val(chk_values());
	var form = document.chkform;
	 form. action =  'msgspaminsert.j';
	 form.method = "post";
	 form.submit();
};


function chk_values() {
	var chk= new Array();
	
	$('.msgchkbox:checked').each(function() {
		chk.push($(this).val());
	});

	if(chk.length == 0){
		alert('하나이상 선택이 필요합니다.');
		brack;
	}
	  return chk;
};

function pagefn(no) {
	$('#page').val(no);
	var form = document.seachform;
	 form. action =  'msgreadlist.j';
	 form.method = "post";
	 form.submit();
}

function userpage(userid) {
	alert(userid);
}

function msgdetail(msgno) {
	$('#msgno').val(msgno);
	var form = document.detailform;
	 form. action =  'msgdetail.j';
	 form.method = "post";
	 form.submit();
}