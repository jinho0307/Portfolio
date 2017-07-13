<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*,java.text.SimpleDateFormat, news.model.vo.NewsCompany, member.model.vo.Member"%>
	
<!DOCTYPE html>
<html>

<%
	NewsCompany newsCom = (NewsCompany) request.getAttribute("newscom");
	Member loginUser= (Member) session.getAttribute("loginUser");
	
	
	

%>
<head>




<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.2.js"></script>
<script type="text/javascript">
	
	
	
	
	$(document).ready(function() {
		$('header').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");

		
	
		});


	
	option = 1;
	
	function change(i){
		
		var price = <%=newsCom.getPrice()%>
		$(".print").html(i*price);
		
	
		var date = new Date();
		date.setMonth(date.getMonth()+(i+1));
		var year = date.getFullYear();
		var month = date.getMonth();
		var date = date.getDate();
		
		$(".endDate").html(year+"년 "+month+"월 " + date+"일");
		
	}

	
	
	
	
	function pay(){
		
		
		
		
		
		IMP.init('imp27129033');
		IMP.request_pay({
			
		
		   amount : $(".print").text(),
		  
		    buyer_name : "<%=loginUser.getUserName()%>" ,
		    
		    name :  "<%=newsCom.getCompanyName()%>"
	

		}, function(response) {
			//결제 후 호출되는 callback함수
			if (response.success) { //결제 성공
	
				var comName= response.name;
				var price= response.paid_amount;
				var id= "<%=loginUser.getUserId()%>";
				
				var endDay= $(".endDate").text(); 
				
			
				
				location.href="/bgm/paySuc?option=card&comName="+comName+"&price="+price+"&id="+id+"&endDay="+endDay;
				
			} else {
				alert('결제실패 : ' + response.error_msg);

			}

		});

	}
	
	
	function payBtn(){
		
		if($(".print").text()==""){
			alert("구독기간을 선택해주세요");
			return;
		}
		
		
		 if(option == 1){
			 pay();
		 }else if(option ==2){
			 pointPay();
		 }
		
		 
		 
	}
	
	function pointPay(){
		var price = $(".print").text();
		var point = "<%=loginUser.getTotalCash()%>";
		
		
		
		if((point-price)<0)
			alert("포인트가 부족합니다. 충전후 이용해주세요.");
		
		else{
			
			var comName= "<%=newsCom.getCompanyName()%>";
			var price= price;
			var id= "<%=loginUser.getUserId()%>";
			
			var endDay= $(".endDate").text(); 
			
		
			
			location.href="/bgm/paySuc?option=point&comName="+comName+"&price="+price+"&id="+id+"&endDay="+endDay;
			
		}
	}
	
	
	
	<%-- function pass(){
		
		if($(".print").text()==""){
			alert("구독기간을 선택해주세요");
			return;
		}
		
	
	
		var comName= "<%=newsCom.getCompanyName()%>";
		var price= $(".print").text();
		var id= "<%=loginUser.getUserId()%>";
		
		var endDay= $(".endDate").text(); 
		
		
		
		
		location.href="/bgm/paySuc?option=card&comName="+comName+"&price="+price+"&id="+id+"&endDay="+endDay;
		
	} --%>
	
	function textform(num){
		if(num==2){
			$("#text").val("<%=loginUser.getTotalCash()%>");
		}else{
			$("#text").val("");
		}
		option = num;
		
	}
	
</script>

<style type="text/css">


#page {
	margin: auto;
	
	width: 1150px;
	height:950px;
	border: 0; 
	
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
.endDate {
	color:blue;
}


</style>
<meta charset="UTF-8">
<title>결제 페이지</title>



</head>
<header></header>
<body>
	<br>
	<br>
	<div id="page">
	<h1><a style='color:black' href='/bgm/newscontroll'>news</a> > <a style='color:black;' href='/bgm/sub'>구독 > </a>결제</h1>
	<br><br>
	<div class="userinfo">
		<fieldset>
			<legend>
				<h3>구매자 정보</h3>
			</legend>
			<ol class="item">
				<li><strong>아이디 : <%=loginUser.getUserId()%></strong></li>
				<li><strong>이름 &nbsp;&nbsp;&nbsp;: <%=loginUser.getUserName()%></strong></li>
				
			


			</ol>

		</fieldset>



	</div>




	<br>
	<br>
	<div class="mon">
		<fieldset>
			<legend>
				<h3>구독기간</h3>
			</legend>
			<form name="rform">
				<input type="radio" id="r1" name="month" onchange='change(1);'>1개월&nbsp; <input type="radio" id="r1" name="month"
					onchange='change(3);'> 3개월 &nbsp; <input type="radio" id="r1"
					name="month" onchange='change(6);'>6개월&nbsp; <input
					type="radio" id="r1" name="month" onchange='change(12);'>1년
			</form>

</fieldset>




	</div>
	<br>
	<br>
<div class= "selectform">
<fieldset><legend><h3>결제 수단</h3></legend>
<form name = "selectPay">
<input type = "radio" id="r2" name = "sPay"  value="1" onchange="textform(1);" checked/>신용카드&nbsp;
<input type = "radio" id="r2" name = "sPay" value="2" onchange="textform(2);"/>포인트 결제
 
 
 <div id="pointform" style='position:relative; float:right; width:400px;height:30px;'>
 <input type = "text" id= "text" style='position:absolute; right:0px;' readonly/>
 
 <label style='position:absolute; right:200px;'>포인트 잔액&nbsp; </label>
</div>
</form>

</fieldset>


</div>
<br><br>
	<div class="paydiv">

		<fieldset>
			<legend>
				<h2>최종 결제 정보</h2>
			</legend>

			<ol class="item">
				<li><img src="/bgm/news/images/<%=newsCom.getImage()%>"
					width="80px" height="80px"></li>
				<li><label for="newcom">구독신문사명 : </label>&nbsp;<label
					class="font1"><strong><%=newsCom.getCompanyName()%></strong></label><br></li>

				<li><label for="startday">구독시작일 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label class="startDate"><%=new SimpleDateFormat("yyyy년 M월 d일").format(new Date())%></label>
					<br> <label for="endday">구독종료일 :</label> &nbsp;&nbsp;&nbsp;&nbsp;<label class ="endDate"></label><br>
				<br></li>

				<li><label for="startday">한달 구독료 :</label>&nbsp;&nbsp;&nbsp;&nbsp;<%=newsCom.getPrice() %>원</li>

				<li><label for="website"><strong>결제 금액 :</strong> </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
					class="font2"><strong class="print"></strong></label>원</li>

				
			</ol>
		</fieldset>

					<button onclick="payBtn();" style='position:relative; font-size:1.5em; width:200px; height:50px; float:right;'>결제하기</button>
			
			
	</div>
		
	</div>








</body>
<footer></footer>
</html>