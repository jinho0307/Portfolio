<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "news.model.vo.*, java.text.*"%>
    
    
<%
	Subscription sub = (Subscription)request.getAttribute("sub");
	NewsCompany nc = (NewsCompany)request.getAttribute("nc");
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 M월 d일");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/bgm/common/js/jquery-3.1.1.min.js"></script>

<script>
$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");
	
});
</script>
<style>
li{
list-style:none;
}
#page{
width:1150px;
height:800px;

}
.paydiv{
position:absolute;
width:400px;
height:300px;
left:600px;
top:250px;
}

</style>
<title>뉴스 결제내역 상세페이지</title>
</head>
<header></header>
<body>

<div id= "page">
	

	<br>
	<div class="paydiv">
	
<h1 align="center">결제 상세내역 조회</h1>
		
		<fieldset>
			<legend>
				<h2>결제 정보</h2>
			</legend>

			<ol class="item">
				
				<li><label>결제상품 : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
					><strong>뉴스구독(<%=nc.getCompanyName()%>)</strong></label><br></li>

				<li><label>결제일 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><%=sdf.format(sub.getStartDate()) %></label>
					<br> <label>구독종료일 :</label>&nbsp;&nbsp;&nbsp;<label><%=sdf.format(sub.getEndDate()) %></label><br>
				<br></li>

				

				<li><label><strong>결제 금액 :</strong> </label>&nbsp;&nbsp;&nbsp;
				<label><strong><%=sub.getAmount() %></strong> 원</label></li>

				
			</ol>
		</fieldset>
	
		<a href="javascript:history.go(-1);" style='float:right' >이전 페이지로</a>
			
			
	</div>


</div>

</body>
<footer></footer>
</html>