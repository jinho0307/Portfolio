<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/mypage/mypage-common.css" />
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script> 
    
    <link rel="stylesheet" type="text/css" href="/sins/resources/css/member/myInfo.css" />
    <link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
    
<script type="text/javascript">
var userId = $("#userId").val();
var userPwd = $("#userPwd").val();
var pwdChange = "";
var pwdCheck = "";
var phone = $("#phone").val();
var parsonalId = $("#parsonalId").val();
var address = $("#address").val();
var city ="";

var checkPwdChange = 0;
var checkPwdCheck = 0;
var checkPhone = 0;
var checkBirth = 0;
var checkAddress = 0;

	$( document ).ready(function() { 
		$("#cencle").hide();
		$("#cencle").prop("disabled", "disabled");
		$(".pwdchange").hide();
		$("#pwdchangecanclebtn").hide();
		$("#birthCenclebtn").hide();
		$("#birthchange").hide();
		$("#phonechange").hide();
		$("#phoneCenclebtn").hide();
		$("#phoneSubmit").hide();
		$("#memberdelete").hide();
		$("#addressCenclebtn").hide();
		$("#addresschange").hide();
		
		
		// 회원탈퇴 버튼 클릭시
		$("#memberDeletebtn").click(function(){
			$("#addressCenclebtn").hide();
			$("#addressChangebtn").show();
			$("#addresschange").slideUp("slow");
			$("#birthchange").slideUp("slow");
			$("#birthCenclebtn").hide();
			$(".birthChangebtn").show();
			$("#phonechange").slideUp("slow");
			$("#phoneCenclebtn").hide();
			$("#phoneChangebtn").show();
			$(".pwdchange").slideUp("slow");
			$("#pwdchangecanclebtn").hide();
			$("#pwdchangebtn").show();
			$("#memberdelete").slideDown("slow");
		});
		
		// 회원탈퇴에서 취소버튼 클릭시
		$("#memberDeleteCenclebtn").click(function(){
			$("#memberdelete").slideUp("slow");
		});
		
		// 비밀번호 수정버튼 클릭시
		$("#pwdchangebtn").click(function(){
			$("#addressCenclebtn").hide();
			$("#addressChangebtn").show();
			$("#addresschange").slideUp("slow");
			$("#memberdelete").slideUp("slow");
			$("#birthchange").slideUp("slow");
			$("#birthCenclebtn").hide();
			$(".birthChangebtn").show();
			$("#phonechange").slideUp("slow");
			$("#phoneCenclebtn").hide();
			$("#phoneChangebtn").show();
			$("#pwdCheck, #pwdChange").css("border", "1px solid gray");
			$(".pwdchange").slideDown("slow");
			$("#pwdChange").focus();
			$("#pwdchangebtn").hide();
			$("#pwdchangecanclebtn").show();
		});
		
		// 비밀번호 수정취소 버튼 클릭시
		$("#pwdchangecanclebtn").click(function(){
			$(".pwdchange").slideUp("slow");
			$("#pwdChange, #pwdCheck").val("");
			$("#pwdchangecanclebtn").hide();
			$("#pwdchangebtn").show();
		});
		
		// 생일 수정버튼 클릭시
		$(".birthChangebtn").click(function(){
			$("#addressCenclebtn").hide();
			$("#addressChangebtn").show();
			$("#addresschange").slideUp("slow");
			$("#memberdelete").slideUp("slow");
			$(".pwdchange").slideUp("slow");
			$("#pwdchangecanclebtn").hide();
			$("#pwdchangebtn").show();
			$("#phonechange").slideUp("slow");
			$("#phoneCenclebtn").hide();
			$("#phoneChangebtn").show();
			$("#datePicker").css("border", "1px solid gray");
			$("#birthchange").slideDown("slow");
			$(".birthChangebtn").hide();
			$("#birthCenclebtn").show();
		});
		
		// 생일 수정 취소버튼 클릭시
		$("#birthCenclebtn").click(function(){
			$("#birthchange").slideUp("slow");
			$("#birthCenclebtn").hide();
			$(".birthChangebtn").show();
			$("#datePicker").val("");
		});
		
		// 변경할 비밀번호 텍스트에서 tab키 입력시
		$(".std > input").keydown(function(e){
			if(e.keyCode == 9){
				$("#pwdmodifybtn").next().focus();
			}
		});
		
		$("#pwdChange").blur(function(){
			
			pwdChange = $("#pwdChange").val();
			var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
			if(pwdChange != ""){
				if(check.test(pwdChange)){
					checkPwdChange = 1;
					$("#pwdChange").css("border", "2px solid green");
				}
				else if(pwdChange == userPwd){
					checkPwdChange = 0;
					alert("전과 동일한 비밀번호를 입력하셨습니다!");
					$("#pwdChange").css("border", "2px solid red");
				}
				else {
					checkPwdChange = 0;
					alert("비밀번호 형식이 잘못되었습니다.");
					$("#pwdChange").css("border", "2px solid red");
				}
			}
		
		});
		
		// 비밀번호 확인이 포커스를 잃을시
		$("#pwdCheck").blur(function(){
			pwdCheck = $("#pwdCheck").val();
			
			if(pwdCheck != pwdChange){
				checkPwdCheck = 0;
				alert("비밀번호가 일치하지 않습니다!");
				$("#pwdCheck").css("border", "2px solid red");
			}
			else {
				checkPwdCheck = 1;
				$("#pwdCheck").css("border", "2px solid green");
			}
			
			$("#pwdmodifybtn").focus();
		});
		
		// datepicker
		$("#datePicker").datepicker({
			dateFormat : 'yy-mm-dd',
			showAnim : "slide",
			closeText : "닫기",
			minDate: '-100y',
			maxDate: '0',
			changeMonth: true,
			changeYear: true,
			showButtonPanel: true,
			currentText: '오늘 날짜'
		});
		
		// 핸드폰번호 수정하기 버튼 클릭시
		$("#phoneChangebtn").click(function(){
			$("#addressCenclebtn").hide();
			$("#addressChangebtn").show();
			$("#addresschange").slideUp("slow");
			$("#memberdelete").slideUp("slow");
			$(".pwdchange").slideUp("slow");
			$("#pwdchangecanclebtn").hide();
			$("#pwdchangebtn").show();
			$("#birthchange").slideUp("slow");
			$("#birthCenclebtn").hide();
			$(".birthChangebtn").show();
			$("#phoneChange").css("border", "1px solid gray");
			$("#phonechange").slideDown("slow");
			$("#phoneChangebtn").hide();
			$("#phoneCenclebtn").show();
		});
		
		// 핸드폰번호 수정취소 버튼 클릭시
		$("#phoneCenclebtn").click(function(){
			$("#phonechange").slideUp("slow");
			$("#phoneCenclebtn").hide();
			$("#phoneChangebtn").show();
			$("#phoneChange").val("");
		});
		
		// 핸드폰번호 수정 완료버튼 클릭시
		$("#phoneChangeFinish").click(function(){
			//ajax처리
			var phone = $("#phoneChange").val();
			var check = /^01[0179]-\d{3,4}-\d{4}$/;
			
			if(check.test(phone)){
				$.ajax({
					url : "phoneCheck.k?phone="+phone,
					type : "post",
					success : function(date) {
						if(date == 0){
							$("#phoneChange").css("border", "2px solid green");
							$("#phoneChangeFinish").hide();
							$("#phoneSubmit").show();
							checkPhone = 1;
						}
						else {
							$("#phoneChange").css("border", "2px solid red");
							checkPhone = 0;
						}
					}
				});
			}
			else{
				$("#phoneChange").css("border", "2px solid red");
			}
		});
		
		// 주소 수정하기 버튼 클릭시
		$("#addressChangebtn").click(function(){
			$("#memberdelete").slideUp("slow");
			$("#birthchange").slideUp("slow");
			$("#birthCenclebtn").hide();
			$(".birthChangebtn").show();
			$("#phonechange").slideUp("slow");
			$("#phoneCenclebtn").hide();
			$("#phoneChangebtn").show();
			$(".pwdchange").slideUp("slow");
			$("#pwdchangecanclebtn").hide();
			$("#pwdchangebtn").show();
			$("#addressChangebtn").hide();
			$("#addressCenclebtn").show();
			$("#addresschange").slideDown();
			
			
			$.ajax({
				url : "getCity.k",
				type : "post",
				success : function(date) {
					for(var x=0;x<date.length;x++){
						$("#city").append($('<option>', {value : date[x], text : date[x]}));
					}
				}
				
			});
		});
		
		// 도 선택 셀렉트 박스 값이 변할경우
		$(document).on("change","#city", function(){
			city = $("#city").val();
			
			if(city != "0" || city != "세종특별자치시"){
				$.ajax({
					url : "getPartition.k?city="+city,
					type : "post",
					success : function(date) {
						$(".par").remove();
						for(var x=0;x<date.length;x++){
							$("#partition").append($('<option>', {class : 'par', value : date[x], text : date[x]}));
						}
					}
				});
			}
		});
		
		$(document).on("change","#partition", function(){
			var par = $("#partition").val();
			if(par === '0'){
				checkAddress = 0;
			}
			else {
				checkAddress = 1;
			}

		});
		
		// 주소 수정 취소 클릭시
		$("#addressCenclebtn").click(function(){
			$("#addresschange").slideUp("slow");
			$("#addressCenclebtn").hide();
			$("#addressChangebtn").show();
			
		});
		
		// 주소 삭제 버튼 클릭시
		$("#addressDeleteBtn").click(function(){
			location.href = "addressDelete.k";
		});
		
		// 생일 삭제 버튼 클릭시
		$("#birthDeletebtn").click(function(){
			location.href = "birthDelete.k";
		});
		
		
		$('#t-l').click(function(){ 
			$('#spot1, #overlay_t').show(); 
		}); 
		
		$('#overlay_t').click(function(e){ 
			e.preventDefault(); 
			$('#spot1, #overlay_t').hide(); 
		});
		
		$('#t-r').click(function(){ 
			$('#spot2, #overlay_t').show(); 
		});
		
		$('#overlay_t').click(function(e){ 
			e.preventDefault(); 
			$('#spot2, #overlay_t').hide(); 
		});
		
	});
	
	//비밀번호 수정완료버튼 클릭시 onsubmit이벤트 처리 함수
	function pwdCheck(){
		if(checkPwdChange == 1 && checkPwdCheck == 1){
			return true;
		}
		else if(checkPwdChange == 0){
			alert("변경할 비밀번호를 다시 확인해주세요!");
		}
		else{
			alert("비밀번호 확인을 확인해주세요!");
		}
		return false;
	}
	
	function birthCheck(){
		var birth = $("#datePicker").val();
		var check = /^[0-9]{4}-[0-9]{2}-[0-9]{2}/;
		
		if(check.test(birth)){
			if(birth != ""){
				return true;
			}
			else{
				return false;
			}	
		}
		else {
			alert("날짜 입력 정보가 잘못되었습니다.");
			return false;
		}
	}
	
	function phoneCheck(){
		if(checkPhone == 1){
			return true;
		}
		else{
			return false;
		}
	}
	
	function checkAddress(){
		if(checkAddress == 1){
			return true;
		}
		else{
			return false;
		}
	}
	
</script>

  </head>
  <body>
  		<div id="header">
      	<div id="overlay_t"></div> 
      	<div id="t-l"></div>
      	<div id="top"><c:import url="../common/top.jsp" charEncoding="UTF-8" /></div>
       	<div id="t-r"></div>
      </div>
    <div id="container">
      <div id="left" class="box">
        
        <center>
        <h2>Mypage</h2>
        <img src="" style="width:160px; height:160px;">
        <h3>${ loginUser.userName } 님</h3><br>
        ${ loginUser.phone }<br>
        <h4><a href="mypage.b">MyPage</a></h4>
        <h4><a href="friendList.n">친구 목록 보기</a></h4>
        <h4><a href="mypagePoto.b">사진 보기</a></h4>
        <h4><a href="mypageDetail.b">정보 보기</a></h4>
        </center>
      </div>
      <div id="content" class="box">
			
			<div id="myInfodiv">
				<table	id="myInfoTable">
					<tr><td colspan="3" id="tftd"><h1 id="title">내 정보</h1></td></tr>
					<tr><td class="ftd"><label>아이디</label></td><td class="std"><input type="text" id="userId" name="userId" size="25" value="${loginUser.userId}" maxlength="25" class="t" readonly/></td><td><input type="button" id="memberDeletebtn" value="회원탈퇴" /></td></tr>
					<form action="deleteMember.k">
						<input type="hidden" name="userId" value="${loginUser.userId}" />
						<tr id="memberdelete"><td class="ftd"><label>회원탈퇴</label></td><td class="std"><label id="deletecheck">정말로 탈퇴 하시겠습니까?</label><br/><input type="submit" id="deletesubmit" class="deletebtn" value="확인"/><input type="button" id="memberDeleteCenclebtn" class="deletebtn" value="취소"></td><td></td></tr>
					</form>
					<tr><td class="ftd"><label>비밀번호</label></td><td class="std"><input type="password" id="userPwd" size="25" maxlength="25" class="t" name="userPwd" value="${loginUser.userPwd}" readonly/></td><td><input type="button" value="수정하기" id="pwdchangebtn"><input type="button" value="수정취소" id="pwdchangecanclebtn" /></td></tr>
					<form action="changePwd.k" method="post" onsubmit="return pwdCheck()">
						<input type="hidden" name="userId" value="${loginUser.userId}" />
						<tr class="pwdchange"><td class="ftd"><label>비밀번호 바꾸기</label></td><td class="std"><input type="password" id="pwdChange" size="25" maxlength="25" class="t" name="userPwd" /></td><td><input type="submit" value="수정완료" id="pwdmodifybtn"/></td></tr>
						<tr class="pwdchange"><td class="ftd"><label>비밀번호 확인</label></td><td class="std"><input type="password" id="pwdCheck" size="25" maxlength="25" class="t"/></td><td></td></tr>
					</form>
					<tr><td class="ftd"><label>이름</label></td><td colspan="2" class="std"><input type="text" size="25" maxlength="25" class="t" id="userName" name="userName" value="${loginUser.userName}" readonly/></td></tr>
					<tr><td class="ftd"><label>성별</label></td><td colspan="2" class="std"><input type="text" size="25" maxlength="25" class="t" id="gender" name="gender" value="${loginUser.gender}" readonly /></td></tr>
					<c:if test="${empty loginUser.birth}">
						<tr><td class="ftd"><label>생일</label></td><td class="std"><input type="text" size="25" maxlength="25" class="t" value="등록되지 않은 정보입니다." readonly /></td><td><input type="button" class="birthChangebtn" value="수정하기" /><input type="button" id="birthCenclebtn" value="수정취소" /></td></tr>
					</c:if>
					<c:if test="${not empty loginUser.birth}">
						<tr><td class="ftd"><label>생일</label></td><td class="std"><input type="text" size="25" maxlength="25" class="t" value="${loginUser.birth}" readonly /></td><td><input type="button" class="birthChangebtn" value="수정하기" /><input type="button" id="birthCenclebtn" value="수정취소" /></td></tr>
					</c:if>
					<form action="changeBirth.k" onsubmit="return birthCheck()">
						<input type="hidden" name="userId" value="${loginUser.userId}" />
						<tr id="birthchange"><td class="ftd"><label>생일 수정</label></td><td class="std"><input type="text" class="t" id="datePicker" name="birth" value=""/></td><td><input type="submit" value="수정완료" /></td></tr>
					</form>	
					<tr><td class="ftd"><label>전화번호</label></td><td class="std"><input type="text" id="phone" size="25" maxlength="25" class="t" value="${loginUser.phone}" readonly /></td><td><input type="button" id="phoneChangebtn" value="수정하기" /><input type="button" id="phoneCenclebtn" value="수정취소" /></td></tr>
					<form action="phoneChange.k" onsubmit="return phoneCheck()">
						<input type="hidden" name="userId" value="${loginUser.userId}" />
						<tr id="phonechange"><td class="ftd"><label>전화번호</label></td><td class="std"><input type="text" id="phoneChange" size="20" maxlength="20" class="t" name="phone" /></td><td><input type="button" id="phoneChangeFinish" value="중복체크" /><input type="submit" id="phoneSubmit" value="수정완료" /></td></tr>
					</form>
					<c:if test="${empty loginUser.birth}">
						<tr><td class="ftd"><label>주소</label></td><td class="std"><input type="text" id="address" size="25" class="t" maxlength="25" name="address"  value="등록되지 않은 정보입니다." readonly/></td><td><input type="button" id="addressChangebtn" value="수정하기" /><input type="button" id="addressCenclebtn" value="수정취소" /></td></tr>
					</c:if>
					<c:if test="${not empty loginUser.birth}">
						<tr><td class="ftd"><label>주소</label></td><td class="std"><input type="text" id="address" size="25" class="t" maxlength="25" name="address"  value="${loginUser.address}" readonly/></td><td><input type="button" id="addressChangebtn" value="수정하기" /><input type="button" id="addressCenclebtn" value="수정취소" /></td></tr>
					</c:if>
					<form action="changeAddress.k" onsubmit="return checkAddress()">
						<input type="hidden" name="userId" value="${loginUser.userId}" />
						<tr id="addresschange">
							<td class="ftd">
								<label>주소</label>
							</td>
							<td class="std">
								<select id="city" name="city">
									<option value="0">도 선택</option>
									
								</select>
								<select id="partition" name="partition">
									<option value="0">시 선택</option>
								</select>
							</td>
							<td>
								<input type="submit" id="submit" value="수정완료" />
							</td>
						</tr>
					</form>
					<tr><td class="ftd" id="fftd"><label>가입날짜</label></td><td colspan="2" class="std" id="fstd"><input type="text" size="25" maxlength="25" class="t" name="enrollDate" value="${loginUser.enrollDate}" readonly /></td></tr>
				</table>
				
			</div>
		</div>
      
      <div id="right" class="box">
        <h2>RIGHT</h2>
        <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </div>
    </div>
     <div id="footer">
        <c:import url="../common/footer.jsp" charEncoding="UTF-8" />
      </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>