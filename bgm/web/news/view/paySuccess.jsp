<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.SimpleDateFormat, member.model.vo.Member, news.model.vo.NewsCompany"%>
    
    
<!DOCTYPE html>

<% 
	Member member=(Member)session.getAttribute("loginUser");
	NewsCompany newsCom=(NewsCompany)session.getAttribute("nc");
	String date= (String)session.getAttribute("endDay");
	int price= (Integer)session.getAttribute("price");

%>

<html>
<head>


<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	
	$(function() {
		$('header').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");
		
	});

	

</script>
<meta charset="UTF-8">
<style>

.item {
	list-style-type: none;
}

#page{
margin:auto;
margin-top:100px;
width:1150px;
height:600px;

}
</style>
<title>결제 완료</title>


</head>
<header></header>
<body>

	<div id= "page">
<h1 align="center">결제가 완료되었습니다</h1>
	<br>
	<div class="paydiv">

		<fieldset>
			<legend>
				<h2>최종 결제 정보</h2>
			</legend>

			<ol class="item">
				
				<li><label>결제상품 : </label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
					><strong><%=newsCom.getCompanyName()%></strong></label><br></li>

				<li><label>결제일 :</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label><%=new SimpleDateFormat("yyyy년 M월 d일").format(new Date())%></label>
					<br> <label>구독종료일 :</label>&nbsp;&nbsp;&nbsp;<label><%=date %></label><br>
				<br></li>

				

				<li><label><strong>결제 금액 :</strong> </label>&nbsp;&nbsp;&nbsp;
				<label><strong><%=price%>원</strong></label></li>

				
			</ol>
		</fieldset>

			
			
	</div>

	<a href="/bgm/mynews" style='float:right' >my뉴스 페이지로 가기</a>
</div>

</body>
<footer> </footer>
</html>
