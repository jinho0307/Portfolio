<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.text.SimpleDateFormat, member.model.vo.Member" %>
<% 
	Member loginUser = (Member)session.getAttribute("loginUser");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>결제 페이지 입니다.</title>
<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	$(function() {
		$('header').load('/bgm/common/view/header.jsp');
		$('footer').load('/bgm/common/view/footer.jsp');
		$('#dirpay').change(function () {
			 var price = $(this).val();
			$('.print').html(price); 
		});
		
		
	});
	function change(i) {
		$('#dirpay').prop('readonly',true);
		var price = i * 10000;
		$('#dirpay').val(price);
		$('.print').html(price);
	}
	function paybtn() {
		$('#dirpay').prop('readonly',false);
		$('.rapay').prop('checked',false);
		$('.print').html('');
	}
	function payment() {
		
		IMP.init('imp27129033');
		IMP.request_pay({
			
			amount : $('.print').text(),
			
			buyer_name : "<%= loginUser.getUserId() %>" ,
			
			name : "BGM.COM cash 충전"
		}, function(res) {
			//결제 후 호출되는 callback함수
			if (res.success) { //결제 성공
				var userid = res.buyer_name;
				var amoun = res.paid_amount;
				alert('충전이 완료되었습니다.');
				location.href('/bgm/ccharge?userid='+userid+'&amount='+amoun);
			} else {
				alert('결제실패 : ' + response.error_msg);

			}

		});	
	}
	function tempay() {
		var amount = $('.print').text();
		var id = '<%= loginUser.getUserId()%>';
		alert('충전이 완료되었습니다.');
		location.href='/bgm/ccharge?userid='+id+'&amount='+amount;	
	}
	

</script>
<style type="text/css">
body{
	width: 1150px;
	background: rgb(250,250,250);
}

.item {
	list-style-type: none;
}

.font1 {
	font-size: 15pt;
}

.font2 {
	font-size: 30px;
	color: red;
}
.date {
	color:blue;
}

.paydiv {
	width: 300;
	height: 200;
}
#dirpay{
	text-align: right;
}

.paytable{
	width:1100px;
}
</style>
</head>
<body>
<header></header>
<% if(loginUser !=null){ %>
	<br>
	<br>
	<div class="userinfo">
		<fieldset>
			<legend>
				<h3>구매자 정보</h3>
			</legend>
			<ol class="item">
				<li><label id="username"><strong><%=loginUser.getUserName()%></strong></label></li>
				<li></li>


			</ol>

		</fieldset>



	</div>




	<br>
	<br>
	<div class="mon">
		<fieldset>
			<legend>
				<h3>충전 금액</h3>
			</legend>
			<form name="rform">
				<table class="paytable"><tr><td><input type="radio" id="r1" name="ra" class="rapay" onchange="change(1)" checked="checked">10,000원&nbsp;</td>
				 <td><input type="radio" id="r1" class="rapay" name="ra" onchange="change(3)">30,000원&nbsp; </td>
				 <td><input type="radio" id="r1" class="rapay" name="ra" onchange="change(5)">50,000원&nbsp;</td>
				 <td><input type="radio" id="r1" class="rapay" name="ra" onchange="change(10)">100,000원&nbsp;</td>
				 <td align="right"><input type="text" size="10" readonly="readonly" id="dirpay">원&nbsp; <input type="button" value="직접입력" onclick="paybtn()"> </td> </tr>
				</table>
			</form>

		</fieldset>




	</div>
	<br>
	<br>


	<div class="paydiv">

		<fieldset>
			<legend>
				<h2>최종 결제 정보</h2>
			</legend>

			<ol class="item">
				<li><img src="/bgm/Movie/영화포스터/너의이름은.jpg" width="80px" height="80px"></li>
				<li><label for="newcom">결제자 아이디 : </label>&nbsp;<label
					class="font1"><strong><%=loginUser.getUserId() %></strong></label><br></li>

				<li><label for="startday">결제일 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=new SimpleDateFormat("yyyy년 M월 d일").format(new Date())%><br></li>

				

				<li><label for="website"><strong>결제 금액 :</strong> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
					class="font2"><strong class="print">10000</strong></label>원</li>

				<li><button onclick="payment();">결제하기</button></li>
				<li><button onclick="tempay();">임시 결제</button></li>
			</ol>
		</fieldset>

	</div>
<%}else{%>
로그인 하시고 이용해주시기 바랍니다.
<%} %>
</body>
</html>