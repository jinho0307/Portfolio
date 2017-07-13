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

function fileCheck(file){
	if (file != null){
	// 사이즈체크
	var maxSize  = 2048000000;    //2GB
	var fileSize = 0;

	// 브라우저 확인
	var browser = navigator.appName;
		// 익스플로러일 경우
		if (browser == "Microsoft Internet Explorer")
		{
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile( file.value ).size;
		}
		// 익스플로러가 아닐경우
		else
		{
			fileSize = file.files[0].size;
		}
		if(fileSize > maxSize)
	    {
	        alert("첨부파일 사이즈는 2GB 이내로 등록 가능합니다.");
	        return false;
	    }else{
	    	return true;
	    }
	} else{
	return true;
    }
}

function areakeyup() {
	var area = $('textarea[name=content]');
	var areacnt = $('.keycnt');
	areacnt.text(area.val().length);
	if(area.val().length > 600){
		alert('글자는 600자 제한입니다.');
		area.val(area.val().substring(0,1800));
		area.focus();
	}
}
$( function() {
  $('#reciveid').keyup(function() {
	$.ajax({
		url : "autocomresiveid.j",
		type : "post",
		data : {"receivie_id" : $(this).val(),
				"send_id" : $('#send_id').val()},
		success : function(data) {
			$('#reciveid').autocomplete({
				source : data
			})
		}
	})
});
});
function subsub(file) {
	parent.alertto($('#reciveid').val(), "MASSAGE", $('#send_id').val());
	var flag = false;

	if(fileCheck(file) && chkallmem()){
		flag = true;
	}
	 return flag;
	 
}

function chkallmem() {
	var cnt = 0;
	var flag = false;
	var alluser = $('#alluser').val().split(",");
	var reciveid = $('#reciveid').val().split(",");
	for(var i = 0 ; i < alluser.length;i++){
		for(var j = 0 ; j<reciveid.length;j++){
			if(alluser[i].trim() == reciveid[j]){
				cnt = cnt + 1;
			}
		}
	}
	if(cnt == reciveid.length){
		flag = true;
	}else{
		flag = false;
	}
	return flag;
	
}