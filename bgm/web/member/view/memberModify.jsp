<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page
	import = "java.sql.*, member.model.vo.Member"
 %>
 <%
 	Member loginUser = (Member)session.getAttribute("loginUser");
 	Member member = (Member)request.getAttribute("member");
 	String tel[] = member.getPhone().split("-");
 	int where = ((Integer)request.getAttribute("where")).intValue();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8">
<title>memberModify</title>
<link rel="stylesheet" type="text/css" href="/bgm/member/css/newmember_1.css">
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

table#modify{
		font-size: 14pt;
	}
	#subtn,#backbtn{
		width:300px;
	}
</style>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"  src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	$(function () {
		
		$('tr:odd').css({
			'color':'red',
			'font-size':'10px',
			'height':'10px',
		});
		//풋터 로드
		$('#guk').val($('#telguk').val()).prop('selected', true);
		
		$('footer').load('/bgm/common/view/footer.jsp');
		
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
			var birthchk = /^[1-2]{1}[0-9]{3}[0-1]{1}[0-2]{1}[0-3]{1}[0-9]{1}$/;
			
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
		if(truecnt == 6){
			result = true;
		}else{
			truecnt = 0;
		}
		return result;
	}
</script></head>
<body>
<header>

</header>
<br>
<div align="center">

	<form action="/bgm/mmodify" onsubmit="return userPwdEq()">
	<input type="hidden" name="userId" value="<%=member.getUserId() %>">
	<input type="hidden" name="userGender" value="<%= member.getGender()%>">
	<input type="hidden" id="telguk" value="<%= tel[0]%>">
	<input type="hidden" name="enroll" value="<%= member.getEnroll_date()%>">
  
		<table id="modify">
			<tr><td rowspan="2">아이디 : </td><td><%= member.getUserId() %></td></tr>
			<tr><td><label class='label' id='idLabel'></label></td>
			<tr><td rowspan="2">암호 : </td><td><input type="password" id="userPwd" name="userPwd" required="required" placeholder="비밀번호 입력" autofocus="autofocus"> </td></tr>
			<tr><td ><label class='label' id='pwd1Label'></label></td>
			<tr><td rowspan="2">비밀번호확인 :</td><td><input type="password" id="userPwd1" name="userPwd1" required="required" placeholder="영문+숫자+특문 8~20자"></td></tr>
			<tr><td><label class='label' id='pwd2Label'></label></td>
			<tr><td rowspan="2">이름 : </td><td> 
			<%if(loginUser.getManager() == 0){ %>
			<input type="text" id="userName" name="userName" value="<%= member.getUserName()%>">	
			<%}else{ %>
			<input type="hidden" name="userName" value="<%= member.getUserName()%>">
				<%= member.getUserName()%>
			<%} %>
			</td></tr>
			<tr><td><label class='label' id='nameLabel'></label></td>
			<tr><td rowspan="2">E-Mail : </td><td> <input type="text" name="userEmail1"size="8" value="<%= member.getEmail().substring(0,member.getEmail().lastIndexOf('@'))%>">@
			<input type="text" name="userEmail2" size="10"  id="userEmail2" readonly value="<%= member.getEmail().substring(member.getEmail().lastIndexOf('@') + 1)%>">   
			<select name="selectEmail" id="selectEmail" class="selectField" >
                                    <option value="direct" id="direct" >직접입력</option>
                                    <option value="naver.com" >네이버 메일</option>
                                    <option value="hanmail.net" >한 메일</option>
                                    <option value="hotmail.com" >핫 메일</option>
                                    <option value="gmail.com" >지 메일</option>
                              </select></td>
                            <td>
                            <% if(member.getReception() == "on"){%>
                            <input type="checkbox" name="reception" /><br>수신동의
                            <% }else{ %>
                            <input type="checkbox" name="reception" checked="checked"><br>수신동의
                            <%} %>
                            </td></tr>
             <tr><td><label class='label' id='emailLabel'></label></td>
			<tr><td rowspan="2">생년월일 : </td><td><input type="text" name="userBirth" id="userBirth" required="required" value="<%= member.getBirth()%>" readonly="readonly"> </td></tr>
			<tr><td><label class='label' id='birthLabel'></label></td>
			<tr><td rowspan="2">성별 : </td><td><% 
				String gender = (member.getGender() =='M')? "남자" : "여자";
				out.print(gender); %></td></tr><tr></tr>
			<tr><td rowspan="2">연락처 :</td><td>  <select name="guk" id="guk" class="selectField">
			
                                    <option value="">선 택</option>
                                    <option value="010" >010</option>
                                    <option value="011" >011</option>
                                    <option value="016" >016</option>
                                    <option value="018" >018</option>
                                    <option value="019" >019</option>
                              </select>
			
			-<input type="tel" name="userPhone1" size="8" maxlength="4" value="<%=tel[1] %>">- <input type="tel" name="userPhone2" size="8" maxlength="4" value="<%= tel[2]%>"></td>
			<tr><td><label class='label' id='phone1Label'></label></td><td><label class='label' id='phone2Label'></label></td></tr>
			 <tr><td rowspan="2"><label for="zipcode">우편번호</label></td>
             <td><input type="text" class="addr" name="zipcode1" id="post1" placeholder="우편번호" size="10" maxlength="10" required readonly="readonly" value="<%= member.getZipcode1()%>"/>
             <input type="text" class="addr" name="zipcode2" id="post2" placeholder="우편번호검색" size="10" maxlength="10" required readonly="readonly" value="<%= member.getZipcode2()%>"/>
             
             <td><input type="button" value="우편번호 검색" onclick="serachZipcode();"/></td>
          </tr><tr></tr>
          <tr><td rowspan="2"><label for="detailAddress">주소</label></td><td >  
              <input type="text" class="addr" name="detailAddress1" id="addr" placeholder="" size="15" required readonly="readonly" value="<%= member.getAddress1()%>"/>
              <input type="text" class="addr" name="detailAddress2" id="addr2" placeholder="" size="15" required value="<%= member.getAddress2()%>"/></td><td></td>
			<tr><td><td><td></td></tr>
			<%if(loginUser.getManager() == 0){ %>
			<tr><td>메니저 코드 : </td><td><select name="manager">
			
                                    <option value="0">관리자</option>
                                    <option value="1" >일반회원</option>
            </td></tr>
			<%}else{ %>
			<tr><td><input type="hidden" name="manager" value="<%= member.getManager()%>"></td></tr>
			<%} %>
			<tr></tr>
			<tr><td></td><td align="center"><input class="nmbtn" type="submit" id="subtn" value="수정하기">
		<button type="button" class="nmbtn" id="backbtn" onclick="javascript:window.close()">닫기</button></td><td></td></tr>
		</table>
	</form>
</div>

<footer>

</footer>
</body>
</html>