<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript">
var idCheck=0;
var idCopyCheck=0;
var pwdCheck=0;
var pwdcCheck=0;
var nameCheck=0;
var phoneCheck=0;
var checkNumCheck=0;
var ch = 0;
var checkNum;
   $(document).ready(function() {
      $("#m-fdiv2").hide();
      $("#m-sdiv2").hide();
      $("#m-fdiv3").hide();
      $("#m-sdiv3").hide();
      
      $("#enroll").click(function() {
         $("#m-fdiv").slideUp("slow");
         $("#m-sdiv").slideUp("slow");
         
         $("#m-fdiv2").slideDown("slow");
         $("#m-sdiv2").slideDown("slow");
         
         $("#email").focus();
      });
      
      $("#findPwd").click(function() {
         $("#m-fdiv").slideUp("slow");
         $("#m-sdiv").slideUp("slow");
         
         $("#m-fdiv3").slideDown("slow");
         $("#m-sdiv3").slideDown("slow");
      });
      
      $("#returnLogin").click(function(){
         $("#m-fdiv2").slideUp("slow");
         $("#m-sdiv2").slideUp("slow");
         
         $("#m-fdiv").slideDown("slow");
         $("#m-sdiv").slideDown("slow");
         
      });
      
      $("#returnlog1, #returnlog2").click(function(){
         $("#m-fdiv3").slideUp("slow");
         $("#m-sdiv3").slideUp("slow");
         
         $("#m-fdiv").slideDown("slow");
         $("#m-sdiv").slideDown("slow");
         
      });
      
      $("#check").prop("readonly", "readonly");
      $("#checkbtn").prop("disabled", "disabled");

      $("#idCheck").click(function(){
         
         var id = $("#email").val();
         var check = /^[a-zA-Z]{1}[A-Za-z0-9-_]{4,13}\@[a-zA-Z]{1,6}.(com|co.kr|net)$/;
      
         
         if(check.test(id)){
            $.ajax({
               url : 'idCheck.m',
               type : "post",
               data : {"userId" : id},
                  success : function(data){
                  if(data.length == 1){
                     idCopyCheck = 0;
                     alert("아이디가 중복되었습니다.");
                     idCheck = 0;
                     $("#email").css("border", "2px solid red");
                     $("#email").focus();
                  }
                  else {
                     alert("인증메일이 발송되었습니다.");
                     checkNum = data;
                     idCheck = 1;
                     idCopyCheck = 1;
                     $("#email").css("border", "2px solid green");
                     $("#check").removeAttr("readonly");
                     $("#checkbtn").removeAttr("disabled");
                     $("#idCheck").prop("disabled", "disabled");
                     $("#check").focus();
                  }
                  }
            });
            
         }
         else {
            idCheck = 0;
            idCopyCheck = 0;
            $("#email").css("border", "2px solid red");
            $("#email").focus();
         }
      });
      
      $("#checkbtn").click(function(){
         var check = $("#check").val();
         if(check == checkNum){
            $("#check").css("border", "2px solid green");
            $("#email").prop("readonly", "readonly");
            checkNumCheck=1;
            $("#pwd").focus();
         }
         else{
            $("#check").css("border", "2px solid red");
            $("#check").focus();
         }
      });
      
      var pwd;
      $("#pwd").blur(function(){
         pwd = $("#pwd").val();
         var check = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,16}$/;
         
         if(check.test(pwd)){
            pwdCheck = 1;
            $("#pwd").css("border", "2px solid green");
         }
         else{
            pwdCheck = 0;
            $("#pwd").css("border", "2px solid red");
            
         }
      });
      
      $("#pwdc").blur(function(){
         var pwdc = $("#pwdc").val();
         
         if(pwdc == pwd && pwdc != ""){
            pwdcCheck = 1;
            $("#pwdc").css("border", "2px solid green");
         }
         else {
            pwdcCheck = 0;
            $("#pwdc").css("border", "2px solid red");
         }
      });
      
      $("#name").blur(function(){
         var check = /^[가-힣]{2,6}$/;
         var name = $("#name").val();
         
         if(check.test(name)){
            nameCheck = 1;
            $("#name").css("border", "2px solid green");
         }
         else {
            nameCheck = 0;
            $("#name").css("border", "2px solid red");
         }
      });
      
      $("#phone").blur(function(){
         var phone = $("#phone").val();
         var check = /^01[0179]-\d{3,4}-\d{4}$/;
         
         if(check.test(phone)){
            phoneCheck = 1;
            
            if(phoneCheck == 1){
               $.ajax({
                  url : "phoneCheck.m?phone="+phone,
                  type : "post",
                     success : function(data){
                     if(data == 1){
                        phoneCheck = 0;
                        $("#phone").css("border", "2px solid red");
                        alert("핸드폰 번호가 중복되었습니다.");
                     }
                     else {
                        phoneCheck = 1;
                        $("#phone").css("border", "2px solid green");
                        $("#phone").prop("readonly", "readonly");
                     }
                     }
               });
            }
            
            else {
               phoneCheck = 0;
               $("#phone").css("border", "2px solid red");
            }
            
         }
         else {
             phoneCheck = 0;
              $("#phone").css("border", "2px solid red");
          }
      });
      
   
   });
   function chb(checkbox){
      if(checkbox.checked == true){
         ch = 1;
      }
      else{
         ch = 0;
      }
   }
   
   function enroll(){
      
      if(idCheck == 1 && idCopyCheck == 1 && pwdCheck == 1 && pwdcCheck == 1 && phoneCheck == 1 && checkNumCheck == 1 && ch == 1){
         return true;
      }
      else if(idCheck == 0){
         $("#email").focus();            
         return false;
      }
      else if(idCopyCheck == 0){
         return false;
      }
      else if(pwdCheck == 0){
         $("#pwd").focus();            
         return false;
      }
      else if(pwdcCheck == 0){
         $("#pwdc").focus();            
         return false;
      }
      else if(phoneCheck == 0){
         $("#phone").focus();            
         return false;
      }
      else if(checkNumCheck == 0){
         $("#check").focus();            
         return false;
      }
      else if(ch == 0){
         alert("이용약관을 확인해주세요.");
         return false;
      }
   }
   
   function setsave(name, value, expiredays){
      var today = new Date();
      today.setDate( today.getDate() + expiredays );
      document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";"
   }
   
   function saveLogin(id){
      if(id != "")
      {
          // userid 쿠키에 id 값을 7일간 저장
          setsave("userid", id, 7);
      }else{
          // userid 쿠키 삭제
          setsave("userid", id, -1);
      }
   }
   function loginCheck(){
      if(login.idSaveCheck.checked) 
         saveLogin(login.userId.value);
      else 
         saveLogin("");
      return true;
   }
   function getLogin(){
      // userid 쿠키에서 id 값을 가져온다.
       var cook = document.cookie + ";";
      var idx = cook.indexOf("=")+1;
      var index;
      var val;
      if(cook.length <= 8) {
         document.login.userId.value = "";
          document.login.idSaveCheck.checked = false;
      }
      else {
         index = cook.indexOf(";");
         val = cook.substring(idx, index);
         
         document.login.userId.value = val;
         document.login.idSaveCheck.checked = true;
      } 
      /* var cook = document.cookie + ";";
      var idx = cook.indexOf("=")+1;
      var index;
      var val;
      if(cook.length <= 8) {
         document.login.userId.value = "";
          document.login.idSaveCheck.checked = false;
      }
      else {
         index = cook.length-1;
         val = cook.substring(30, index);
         document.login.userId.value = val;
         document.login.idSaveCheck.checked = true;
      }
       */
   }

</script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/index.css" />
</head>
<body onLoad="getLogin()">
   <div id="container">
      <div id="header"></div>

      <div id="mdiv">
         <div id="m-fdiv">
            <form action="loginCheck.k" method="post" name="login" onsubmit="return loginCheck();">
               <table id="m-f-ltable" style="cellpadding: 0; cellspacing: 0">
                  <tr style="height: 100px;">
                     <td><h2>로그인</h2></td>
                  </tr>

                  <tr style="height: 120px;">
                     <td colspan="2">
                        <table id="LT" style="cellpadding: 0; cellspacing: 0; height: 100px">
                           <tr style="height: 50px;">
                              <td><input id="tdd1" type="text" class="box" id="userid" name="userId" Autofocus tabindex="1"/></td>
                              <td rowspan="2">&nbsp;<input type="submit" value="로그인" id="loginbtn" tabindex="3"/></td>
                           </tr>
                           <tr style="height: 50px;">
                              <td><input id="tdd2" type="password" class="box" name="userPwd" tabindex="2"/></td>
                              <td></td>
                           </tr>
                           <tr><td><input type="checkbox" name="idSaveCheck" id="idSaveCheck"/><label style="font-size : 10pt">아이디 저장</label></td></tr>
                        </table>
                     </td>
                  </tr>

                  <tr style="height: 100px;">
                     
                     <td><label id="enroll" style="border-right: 1px solid gray;" tabindex="4">회원가입
                           &nbsp; &nbsp;</label> &nbsp; &nbsp;
                           <label id="findPwd" tabindex="5">아이디/비밀번호 찾기</label></td>
                     
                  </tr>
               </table>
            </form>
         </div>
         <div id="m-sdiv"></div>

         <div id="m-fdiv2">
            <table id="m-f-ctable" style="cellpadding: 0; cellspacing: 0">
               <tr>
                  <td><h2>이용약관</h2></td>
               </tr>
               <tr>
                  <td><textarea id="yakwan" readonly>제 1 조 ( 목적 )
이 약관은 SINS77(이하”회사”)가 운영하는 모든 웹사이트(이하 “웹사이트” 라 한다)에서 제공하는 인터넷 관련 서비스(이하 “서비스”라 한다) 를 이용함에 있어 이용조건 및 절차와 회원과 회사간의 권리 • 의무 및 책임사항, 절차 등 기본적인 사항을 규정함을 목적으로 합니다.
※「 PC 통신 등을 이용하는 전자거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준용합니다」
제 2 조 ( 정의 )
① “웹사이트” 란 “회사”가 재화 또는 이용자에게 제공하기 위하여 컴퓨터 등 정보통신설비를 이용하여 재화 또는 용역을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울러 웹사이트 를 운영하는 “회사”의 의미로도 사용합니다.
② " 이용자 " 란 “웹사이트” 에 접속하여 이 약관에 따라 “웹사이트” 가 제공하는 서비스를 받는 회원을 말합니다.
③ “회원' 이라 함은 “웹사이트” 에 개인정보를 제공하여 회원등록을 한 자로서 , “웹사이트” 의 정보를 지속적으로 제공받으며 , “웹사이트” 가 제공하는 각종 서비스를 계속적으로 이용할 수 있는 자를 말합니다.
④ "서비스"란 회사가 운영하는 모든 웹사이트 등에서 제공하는 서비스(무선 인터넷 서비스 포함를 말합니다.)
⑤ "게시물"이란 이용자가 서비스를 이용함에 있어 웹사이트에 게시한 부호∙문자∙음성∙음향∙화상∙동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 말합니다.
제 3 조 ( 약관 등의 명시와 설명 및 개정 )
① “웹사이트” 는 이 약관의 내용과 상호 , 영업소 소재지 주소 , 대표자의 성명 , 사업자등록번호 , 연락처 ( 전화 , 팩스 , 전자우편 주소 등 ), 통신판매업신고번호 , 개인정보관리책임자 등을 이용자가 알 수 있도록 웹사이트 의 초기 서비스화면 ( 전면 ) 에 게시합니다 . 단 , 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.
②“웹사이트” 는 이용자가 약관에 동의하기에 앞서 약관에 정하여져 있는 내용 중 청약철회•배송책임•환불조건 등과 같은 중요한 내용을 이용자가 이해할 수 있도록 별도의 연결화면 또는 팝업화면 등을 제공하여 이용자의 확인을 구하여야 합니다.
③“웹사이트” 는 약관의 규제에 관한 법률 , 전자상거래 등에서의 소비자보호에 관한 법률 , 전자거래기본법 , 전자서명법 , 정보통신망이용촉진 등에 관한 법률 , 방문판매 등에 관한 법률 , 소비자보호법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
④“웹사이트”가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 웹사이트 의 초기화면에 그 적용일자 7 일 이전부터 적용일자 전일까지 공지합니다. 단, 이용자에게 불리하게 약관내용을 변경하는 경우에는 최소한 30 일 이상의 사전 유예기간을 두고 공지합니다 . 이 경우 “웹사이트” 는 개정 전 내용과 개정 후 내용을 명확하게 비교하여 이용자가 알기 쉽도록 표시합니다.
⑤“웹사이트” 가 약관을 개정할 경우에는 그 개정약관은 그 적용일자 이후에 체결되는 계약에만 적용되고 , 그 이전에 이미 체결된 계약에 대해서는 개정전의 약관조항이 그대로 적용됩니다 . 다만 이미 계약을 체결한 이용자가 개정약관 조항의 적용을 받기를 원하는 뜻을 제 3 항을 준수하는 범위 내에서 개정약관의 제 4 항에 의한 공지기간 내에 “웹사이트” 에 송신하여 “웹사이트” 의 동의를 받은 경우에는 개정약관 조항이 적용됩니다.
⑥ 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 전자상거래 등에서의 소비자보호에 관한 법률 , 약관의 규제 등에 관한 법률 , 공정거래위원회가 정하는 전자상거래 등에서의 소비자보호지침 및 관계법령 또는 상관례에 따릅니다.
제 4 조 ( 서비스의 제공 및 변경 )
① 다음과 같은 업무를 수행합니다.
1. 재화 또는 용역에 대한 정보 제공 및 구매계약의 체결
2. 구매계약이 체결된 재화 또는 용역의 배송
3. 기타 “웹사이트” 가 정하 는 업무
② “웹사이트” 는 재화 또는 용역의 품절 또는 기술적 사양의 변경 등의 경우에는 장차 체결되는 계약에 의해 제공할 재화•용역의 내용을 변경할 수 있습니다 . 이 경우에는 변경된 재화•용역의 내용 및 제공일자를 명시하여 현재의 재화•용역의 내용을 게시한 곳에 그 제공일자 이전 7 일부터 공지합니다.
③ “웹사이트” 가 제공하기로 이용자와 계약을 체결한 서비스의 내용을 재화•용역의 품절 또는 기술적 사양의 변경 등의 사유로 변경할 경우에는 그 사유를 이용자에게 통지 가능한 주소로 통지합니다.
④ 전항의 경우 “웹사이트” 는 이로 인하여 이용자가 입은 손해를 배상합니다 . 단 , “웹사이트” 에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
제 5 조 ( 서비스의 중단 )
① “웹사이트” 는 컴퓨터 등 정보통신설비의 보수점검•교체 및 고장 , 통신의 두절 등의 사유가 발생한 경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.
② 제 1 항에 의한 서비스 중단의 경우에는 “웹사이트” 는 제 8 조에 정한 방법으로 이용자에게 통지합니다.
③ “웹사이트” 는 제 1 항의 사유로 서비스의 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제 3 자가 입은 손해에 대하여 배상합니다 . 단 , “웹사이트” 에 고의 또는 과실이 없는 경우에는 그러하지 아니합니다.
④ 사업종목의 전환 , 사업의 포기 , 업체간의 통합 등의 이유로 서비스를 제공할 수 없게 되는 경우에는 “웹사이트” 는 제 8 조에서 정한 방법으로 이용자에게 통지하고 당초 “웹사이트” 에서 제시한 조건에 따라 소비자에게 보상합니다. 
단 , “웹사이트” 가 보상기준 등을 고지하지 아니한 경우에는 이용자들의 마일리지 또는 적립금 등을 “웹사이트” 에서 통용되는 통화가치에 상응하는 현물 또는 현금으로 이용자에게 지급합니다.
제 6 조 ( 회원가입 )
① 이용자는 “웹사이트” 가 정한 가입 양식에 따라 회원정보를 기입한 후 , 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.
② “웹사이트” 는 제 1 항과 같이 회원으로 가입할 것을 신청한 이용자 중 다음 각호에 해당하지 않는 한 회원으로 등록합니다.
1. 가입신청자가 이 약관 제 7 조 제 3 항에 의하여 이전에 회원자격을 상실한 적이 있는 경우 단 , 제 7 조 제 3 항에 의한 회원자격 상실 후 3 년이 경과한 자로서 “웹사이트” 의 회원재가입 승낙을 얻은 경우에는 예외로 한다.
2. 등록 내용에 허위 , 기재누락 , 오기가 있는 경우
3. 기타 회원으로 등록하는 것이 “웹사이트” 의 기술상 현저히 지장이 있다고 판단되는 경우
③ 회원가입계약의 성립시기는 “웹사이트” 의 승낙이 회원에게 도달한 시점으로 합니다.
④ 회원은 제 16 조 제 1 항에 의한 등록사항에 변경이 있는 경우 , 즉시 전자우편 기타 방법으로 “웹사이트” 에 대하여 그 변경사항을 알려야 합니다.
제 7 조 ( 회원 탈퇴 및 자격 상실 등 )
① 회원은 “웹사이트” 에 언제든지 탈퇴를 요청할 수 있으며 “웹사이트” 는 즉시 회원탈퇴를 처리합니다.
② 회원이 다음 각호의 사유에 해당하는 경우 , “웹사이트”는 회원자격을 제한 및 정지시킬 수 있습니다.
1. 가입 신청시에 허위 내용을 등록한 경우
2. “웹사이트” 을 이용하여 구입한 재화 • 용역 등의 대금 , 기타 “웹사이트” 이용에 관련하여 회원이 부담하는 채무를 3 회 이상 기일에 지급하지 않는 경우
3. “웹사이트” 을 이용하여 구입한 재화를 3 회 이상 정당한 사유없이 수취 거부하였을 경우
4. 다른 사람의 “웹사이트” 이용을 방해하거나 그 정보를 도용하는 등 전자상거래질서를 위협하는 경우
5. “웹사이트” 을 이용하여 법령 또는 이 약관이 금지하거나 공서 양속에 반하는 행위를 하는 경우
6. 기타 다음과 같은 행위 등으로 “웹사이트” 의 건전한 운영을 해하거나 “웹사이트” 의 업무를 방해하는 경우
1) “웹사이트” 의 운영에 관련하여 근거 없는 사실 또는 허위의 사실을 적시하거나 유포하여 “웹사이트” 의 명예를 실추시키거나 “웹사이트” 의 신뢰성을 해하는 경우
2) “웹사이트” 의 운영과정에서 “웹사이트” 의 직원에게 폭언 또는 음란한 언행을 하여 업무환경을 심각히 해하는 경우
3) “웹사이트” 의 운영과정에서 이유 없는 잦은 연락이나 소란 또는 협박 , 인과관계가 입증되지 않는 피해에 대한 보상 ( 적립금 , 현금 , 상품 ) 요구 등으로 업무를 방해하는 경우
4) “웹사이트” 을 통해 구입한 재화 • 상품 또는 용역에 특별한 하자가 없는데도 불구하고 일부 사용 후 상습적인 취소 • 전부 또는 일부 반품 등으로 업무를 방해하는 경우
단 , 당해 회원의 취소 반품비율이 회사의 평균 취소 반품율 보다 % 이상 높을 경우에는 상습적인 것으로 인정될 수 있습니다.
③ “웹사이트” 가 회원 자격을 제한 • 정지 시킨 후 , 동일한 행위가 2 회 이상 반복되거나 @30 일 이내에 그 사유가 시정되지 아니하는 경우 “웹사이트” 는 회원자격을 상실시킬 수 있습니다.
④ “웹사이트” 가 회원자격을 상실시키는 경우에는 회원등록을 말소합니다 . 이 경우 회원에게 이를 통지하고 , 회원등록 말소 전에 소명할 기회를 부여합니다.
제 8 조 ( 회원에 대한 통지 )
① “웹사이트” 가 회원에 대한 통지를 하는 경우 , 회원이 “웹사이트” 에 제출한 전자우편 주소로 할 수 있습니다.
② “웹사이트” 는 불특정다수 회원에 대한 통지의 경우 1 주일이상 “웹사이트” 게시판에 게시함으로서 개별 통지에 갈음할 수 있습니다. 단, 회원 본인의 거래와 관련하여 중대한 영향을 미치는 사항에 대하여는 개별통지를 합니다.
제 9 조 (게시물의 관리)
① 이용자의 게시물이 관련 법에 위반되거나 회사 또는 웹사이트 및 회사의 제품을 비방하는 경우 회사는 그 게시물에 대하여 게시중단, 삭제 등의 조치를 취할 수 있습니다.
② 회사는 제1항 기재 조치 전 이용자에 대한 소명 및 시정의 기회를 부여하며, 조치를 취한 후에는 그 조치의 내용 등에 관하여 이용자에게 개별통지를 합니다.</textarea></td>
               </tr>
               <tr>
                  <td style="float:right">동의합니다 <input type="radio" id="ch" onclick="chb(this);" /> </td>
               </tr>
            </table>
         </div>

         <div id="m-sdiv2">
         <form action="enroll.m" method="post" onsubmit="return enroll();">
               <table id="m-s-enrolltable">
                  <tr class="tr1"><td class="std" style="text-align : center"><h2>회원가입</h2></td></tr>
                  <tr class="tr1"><td class="std"><input type="email" size="25" maxlength="25" name="userId" id="email" tabindex="1" placeholder="아이디@이메일"/></td><td class="ttd"><input type="button" id="idCheck" value="중복확인" tabindex="2" /></td></tr>
                  <tr class="tr1"><td class="std"><input type="text" size="25" maxlength="25" name="check" id="check" tabindex="3" placeholder="인증번호"/><td class="ttd"><input type="button" id="checkbtn" value="인증확인" /></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" name="userPwd" id="pwd" tabindex="3" placeholder="암호(특문,영문,숫자 조합 8~25자)" /></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="password" size="25" maxlength="25" name="pwdc" id="pwdc" tabindex="4" placeholder="암호 확인"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="text" size="25" maxlength="15" name="userName" id="name" tabindex="5" placeholder="이름"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std"><input type="phone" size="25" maxlength="13" name="phone" id="phone" tabindex="6" placeholder="010-0000-0000"/></td><td class="ttd"></td></tr>
                  <tr class="tr1"><td class="std">
                        <input type="radio" name="gender" value="M" tabindex="7" checked>남
                        &nbsp;&nbsp;&nbsp;<input type="radio" name="gender" value="F" tabindex="8">여</td>
                     <td class="ttd"></td></tr>
                  <tr id="rtr"><td><input type="reset" value="지우기" style="margin-left : 16.5px; margin-right : 16.5px;" tabindex="9" /><input type="submit" value="가입하기"  id="sub" style="margin-right : 16.5px" tabindex="10" /><input type="button"  id="returnLogin" value="취소" tabindex="11" /></td></tr>
              </table>
            </form>
            </div>
         
         <div id="m-fdiv3">
         <form action="findId.m" method="post">
         <table id="idt">
         <tr><td><h2>아이디 찾기</h2></td></tr>
         <tr><td><input class="box" name="userName" placeholder="이  름" /></td></tr>
         <tr><td><input class="box" name="phone" placeholder="전화번호" /></td></tr>
         <tr><td><input type="submit" class="btn" value="아이디 찾기"/>&nbsp;&nbsp;<input type="button" class="btn" id="returnlog1" value="취소"/></td></tr>
         </table>
         </form>
         </div>
         
         <div id="m-sdiv3">
         <form action="findPwd.m" method="post">
         <table id="pwdt">
         <tr><td><h2>비밀번호 찾기</h2></td></tr>
         <tr><td><input type="email" class="box" name="userid" placeholder="이메일형식 아이디" /></td></tr>
         <tr><td><input type="submit" class="btn" value="비밀번호 찾기"/>&nbsp;&nbsp;<input type="button" class="btn" id="returnlog2" value="취소"/></td></tr>
         </table>
         </form>
         </div>
      </div>

      <div id="footer"><p id="c">copyright ⓒ SINS77 Allright reserved.</p></div>
   </div>
   <div id="spot1"></div>
   <div id="spot2"></div>
</body>
</html>