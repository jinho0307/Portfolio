<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>new member</title>
<script type="text/javascript"  src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
$(function () {
	$('tr:odd').css({
		'color':'red',
		'font-size':'10px',
		'height':'10px',
	});
	//풋터 로드
	$('footer').load("/bgm/common/view/footer.jsp");
	//email 메일내용 처리
	
	$('#userEmail2').val($('#selectEmail option:selected').val());
	$('#selectEmail').change(function(){
        if($('#selectEmail').val() == 'direct'){
        	$('#userEmail2').attr('readonly', false);
        	$('#userEmail2').val('직접입력');
        }else{
        	$('#userEmail2').attr('readonly', true);
        	$('#userEmail2').val($(this).val());
        }
	});
	//id 정규식
	$('#userId').change(function () {
		var id = $(this).val();
		var idchk =/^[a-zA-Z]{1}[a-zA-Z0-9]{1,14}$/; 
		if(!idchk.test(id)){
			//정규식에 만족하지 않음
			$('#idLabel').text('첫글자는 영문으로 시작하시고 영문+숫자 최대 15글자');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#idLabel').text('');
			$(this).removeAttr('style');
		}			
	});
	//password 정규식
	
	
	$('#userPwd').change(function () {
		var pwd1 = $('#userPwd').val();
		var pwdchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		if(!pwdchk.test(pwd1)){
			$('#pwd1Label').text('비밀번호는 영문시작 특문 숫자 조합 8~20자입니다.');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#pwd1Label').text('');
			$(this).removeAttr('style');
		}
	});
	
	$('#userPwd1').change(function () {
		var pwd1 = $('#userPwd').val();
		var pwd2 = $('#userPwd1').val();
		var pwdchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		if(!pwdchk.test(pwd2)){
			$('#pwd1Labe2').text('비밀번호는 영문시작 특문 숫자 조합 8~20자입니다.');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#pwd1Labe2').text('');
			$(this).removeAttr('style');
		}
		if(pwd1 != pwd2){
			alert("비밀번호가 같지 않습니다.");
			$(this).css('border','3px solid red');
			$('#userPwd').css('border','3px solid red');
			$(this).focus();
		}else{
			$('#userPwd').removeAttr('style');
			$(this).removeAttr('style');
		}
	}); 

	//이름 정규식
	$('#userName').change(function () {
		var name = $(this).val();
		var namechk = /^[가-힣0-9]{2,6}|[a-zA-Z-_0-9]{4,15}$/; 
			
		if(!namechk.test(name)){
			$('#nameLabel').text('한글은 2~5자 영문은4~20자 이하입력해주세요');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#nameLabel').text('');
			$(this).removeAttr('style');
		}			
	}); 
	//email정규식
	$('input[name=userEmail2]').change(function () {
		var email = $(this).val();
		var emailchk = /^([a-z0-9-_\.]+)\.([a-z\.]{2,6})$/;
		if(!emailchk.test(email)){
			$('#emailLabel').text('email형식에 맞춰 입력해 주세요');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#emailLabel').text('');
			$(this).removeAttr('style');
		}
	}); 
	//phone 정규식
	$('input[name=userPhone1]').change(function () {
		var phone1 = $(this).val();
		var p1chk = /^[0-9]{3,4}$/;
		if(!p1chk.test(phone1)){
			$('#phone1Label').text('숫자3~4자리 입력해주세요');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#phone1Label').text('');
			$(this).removeAttr('style');
		}
	});
	$('input[name=userPhone2]').change(function () {
		var phone2 = $(this).val();
		var p2chk = /^[0-9]{4}$/;
		if(!p2chk.test(phone2)){
			$('#phone1Label').text('숫자4자리 입력해주세요');
			$(this).focus();
		}else{
			$('#phone1Label').text('');
		}
	});
	//생일 입력
	$('input[name=userBirth]').change(function () {
		var birth = $(this).val();
		var birthchk = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		
		if(!birthchk.test(birth)){
			$('#birthLabel').text('yyyymmdd형식으로 입력해주세요');
			$(this).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#birthLabel').text('');
			$(this).removeAttr('style');
		}
		
	});
});
var chwrer = 0;
function owerl() {
	//ID 중복체크
	var userid = $('#userId').val();
	if(userid != ""){
		//서버로 부터 중복체크
		var id = $('#userId').val();
		$.ajax({
			url : '/bgm/idowerlap',
			type : 'get',
			data : {userid : id},
			dataType : "json",
			success : function (data) {
				if(Number(data.result) != 1){
					$('#idLabel').text('사용 가능한 아이디 입니다.');	
					$('#idLabel').css('color','black');
					chwrer++;
				}else{
					$('#userId').css('border','3px solid red');
					$('#idLabel').text('사용 불가능한 아이디 입니다.');
				}
				
			}
		})
	}else{
		alert("아이디를 입력해주세요");
	} 
	
}

 function serachZipcode(){
       new daum.Postcode({
          oncomplete: function(data){
             document.getElementById("post1").value= data.postcode1;
             document.getElementById("post2").value= data.postcode2;
             document.getElementById("addr").value= data.address;
             document.getElementById("addr2").focus();
          }
       }).open();
   }
 // 서브밑 함수
function beforsubmit() {
	var result = false;
	var truecnt = 0;
	//id 정규식
		var id = $('#userId');
		var idchk =/^[a-zA-Z]{1}[a-zA-Z0-9]{1,14}$/; 
		if(!idchk.test(id.val())){
			//정규식에 만족하지 않음
			$('#idLabel').text('첫글자는 영문으로 시작하시고 영문+숫자 최대 15글자')
			$(id).css('border','3px solid red');
			$(id).focus();
		}else{
			$('#idLabel').removeAttr('style');
			truecnt++;
		};			
	
	//password 정규식
		var pwd1 = $('#userPwd');
		var pwdchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		if(!pwdchk.test(pwd1.val())){
			$('#pwd1Label').text('비밀번호는 영문시작 특문 숫자 조합 8~20자입니다.');
			$(pwd1).css('border','3px solid red');
			$(pwd1).focus();
		}else{
			$('#pwd1Label').removeAttr('style');
			truecnt++;
		}
		var pwd2 = $('#userPwd1');
		var pwdchk = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,20}$/;
		if(!pwdchk.test(pwd2.val())){
			$('#pwd2Label').text('비밀번호는 영문시작 특문 숫자 조합 8~20자입니다.');
			$(pwd2).css('border','3px solid red');
			$(pwd2).focus();
		}else{
			$('#pwd2Label').removeAttr('style');
			truecnt++;
		}
		if(pwd1.val() != pwd2.val()){
			alert("비밀번호가 같지 않습니다.")
			$(pwd2).focus();
		}else{
			truecnt++;
		}
	//이름 정규식
		var name = $('#userName');
		var namechk = /^[가-힣0-9]{2,6}|[a-zA-Z-_0-9]{4,15}$/; 
		if(!namechk.test(name.val())){
			$('#nameLabel').text('한글은 2~5자 영문은 20자 이하입력해주세요');
			$(name).css('border','3px solid red');
			$(name).focus();
		}else{
			$('#nameLabel').removeAttr('style');
			truecnt++;
		};			
	//email정규식
		var email = $('input[name=userEmail2]');
		var emailchk = /^([a-z0-9-_\.]+)\.([a-z\.]{2,6})$/;
		if(!emailchk.test(email.val())){
			$('#emailLabel').text("email형식에 맞춰 입력해 주세요");
			$(email).css('border','3px solid red');
			$(email).focus();				
		}else{
			$('#emailLabel').removeAttr('style');
			truecnt++;
		}
	//phone 정규식
		var phone1 = $('input[name=userPhone1]').val();
		var p1chk = /^[0-9]{3,4}$/;
		if(!p1chk.test(phone1)){
			$('#phone1Label').text("숫자만 입력가능합니다 3~4자리");
			$(phone1).css('border','3px solid red');
			$(phone1).focus();
		}else{
			$('#phone1Label').removeAttr('style');
			truecnt++;
		}
		var phone2 = $('input[name=userPhone2]').val();
		var p2chk = /^[0-9]{4}$/;
		if(!p2chk.test(phone2)){
			$('#phone2Label').text("숫자만 입력가능합니다 3~4자리");
			$(phone2).css('border','3px solid red');
			$(this).focus();
		}else{
			$('#phone2Label').removeAttr('style');
			truecnt++;
		}
	//생일 입력
		var birth = $('input[name=userBirth]').val();
		var birthchk = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$/;
		if(!birthchk.test(birth)){
			$('#birthLabel').text('생년월일 8자리 숫자로 입력하세요');
			$(birth).css('border','3px solid red');
			$(birth).focus();
		}else{
			$('#birthLabel').removeAttr('style');
			truecnt++;
		}

	if(chwrer !=0){
		truecnt++;
	}else{
		$('#owerlap').focus();
		alert('중복체크를 하세요');
	}

	if(truecnt == 10){
		result = true;
	}else{
		truecnt = 0;
	}
	return result;
}
</script>
<style type="text/css">

	table#membert {
		width : 620px;
		height: 600px;
		font-size: 14pt;	
		
	}
	div table td{
		padding : 0;
		height: 10px;
		vertical-align: middle;
	}
	input{
		height: 35px;
		font-size: 14pt;
	}
	div#header{
		height: 100px;
	}
	#userId,#userPwd,#userPwd1,#userName,#userBirth{
		width : 600px; 
	}
	.addr{
		width: 290px;
	}
	select{
		height: 41px;
		font-size:14pt;
	}
	#guk{
		width : 100px;
	}
	select#selectEmail,input[name=userEmail1],input#userEmail2{
		
		width : 190px;
	}
	input[name=userPhone1],input[name=userPhone2]{
		width : 230px;
	}
	.nmbtn{
		width : 100px;
		height: 45px;
		font-size: 14pt;
	}
	
	input#nmsub{
		height: 45px;
		width : 650px;
	}
	body{
		background: rgb(250,250,250);
	}
	input[type=radio]{
		width:250px;
		display: inline-block;
		margin-left: -28px;
		padding-left: 28px;
		line-height: 24px;
		
	}
	input[type=checkbox]{	
		position:relative;
		left : 20px;
		height: 40px;
		width : 40px;
	}

</style>
</head>
<body>
<div id="header">

</div>

<div align="center">

	<form action="/bgm/nmember" onsubmit="return beforsubmit()">
		<table id="membert">
			<tr><td><input type="text" id="userId" name="userId" placeholder="아이디" autofocus="autofocus" required="required"><span id="idcheck"></span></td><td><input type="button"  id="owerlap" class="nmbtn" value="중복체크" onclick="owerl();" /></td></tr>
			<tr><td><label class='label' id='idLabel'></label></td>
			<tr><td><input type="password" id="userPwd" name="userPwd" required="required" placeholder="암호입력"> </td></tr>
			<tr><td ><label class='label' id='pwd1Label'></label></td>
			<tr><td><input type="password" id="userPwd1" name="userPwd1" required="required" placeholder="암호확인"></td></tr>
			<tr><td><label class='label' id='pwd2Label'></label></td>
			<tr><td><input type="text" id="userName" name="userName" required="required" maxlength="20" placeholder="이름"> </td></tr>
			<tr><td><label class='label' id='nameLabel'></label></td>
			<tr><td> <input type="text" name="userEmail1"size="8" placeholder="Email">@<input type="text" name="userEmail2" size="10"  id="userEmail2" readonly>   
			<select name="selectEmail" id="selectEmail" class="selectField" >
                                    <option value="direct" id="direct">직접입력</option>
                                    <option value="naver.com" selected="selected">네이버 메일</option>
                                    <option value="hanmail.net" >한 메일</option>
                                    <option value="hotmail.com" >핫 메일</option>
                                    <option value="gmail.com" >지 메일</option>
                              </select></td>
                            <td><input type="checkbox" name="reception"  checked="checked"><br>수신동의</td></tr>
                
			<tr><td><label class='label' id='emailLabel'></label></td>                           
			<tr><td><input type="text" id="userBirth" name="userBirth" required="required" placeholder="yyyymmdd로 입력생년월일" maxlength="8"> </td></tr>
			<tr><td><label class='label' id='birthLabel'></label></td>
			<tr><td><input type="radio" id="userGender" name="userGender" value="M" checked="checked"><label for="userGender">남자</label> &nbsp; <input type="radio" id="userGender" name="userGender" value="F"><label for="gender">여자</label></td></tr>
			<tr></tr>
			<tr><td>  <select name="guk" id="guk" class="selectField">
                                    <option value="">선 택</option>
                                    <option value="010" >010</option>
                                    <option value="011" >011</option>
                                    <option value="016" >016</option>
                                    <option value="018" >018</option>
                                    <option value="019" >019</option>
                              </select>
			
			-<input type="texl" name="userPhone1" size="8" maxlength="4" placeholder="연락처">- <input type="texl" name="userPhone2" size="8" maxlength="4"></td>
			<tr><td><label class='label' id='phone1Label'></label></td><td><label class='label' id='phone2Label'></label></td></tr>
			 <tr>
             <td><input type="text" name="zipcode1" id="post1" class="addr" placeholder="우편번호검색" size="10" maxlength="10" required readonly="readonly"/>
             <input type="text" name="zipcode2" id="post2" class="addr" placeholder="우편번호검색" size="10" maxlength="10" required readonly="readonly"/>
             
             <td><input type="button" class="nmbtn" value="우편번호" onclick="serachZipcode();"/></td>
          </tr>
		<tr></tr>          
          <tr><td >  
              <input type="text" class="addr" name="detailAddress1" id="addr" placeholder="주소는 우편검색으로 입력해주세요" size="15" required readonly="readonly"/>
              <input type="text" class="addr" name="detailAddress2" id="addr2" placeholder="상세정보 입력란" size="15" required /></td><td></td>
			<tr><td><td><td></td></tr>
			
			
			<tr><td align="center" colspan="2" align="center"><input type="submit" id="nmsub" value="가입">
		
		</td><td></td></tr>
		</table>
	</form>
</div>
<footer>
</footer>
</body>
</html>