<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, news.model.vo.*, member.model.vo.Member"%>
<!DOCTYPE html>

<%
	ArrayList<NewsCompany> list = (ArrayList<NewsCompany>) request.getAttribute("newslist");
	Member member = (Member) session.getAttribute("loginUser");
	ArrayList<Subscription> sublist = (ArrayList<Subscription>) request.getAttribute("sublist");
	
%>
<html>
<head>


<script type="text/javascript" src="/bgm/common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
	
	isLogin=true;
	<% if(member==null){%>
	isLogin=false;
	
	<%}%>
	$(function() {
		$('header').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");
		
	});

	function handle(no){
		if(isLogin==false){
			alert("로그인이 필요한 페이지입니다.")
			return true;
		}else{
			<%
			if(sublist!=null){
		
				for(int i=0; i<sublist.size();i++){%>
						
				if(no==<%=sublist.get(i).getCompanyNo()%>){
						alert("이미 구독중인 상품입니다.")
						return false;
				}
				
			<%}}%>
		}
		
		
		
	}

</script>
<meta charset="UTF-8">
<style>
#item {
	width: 400px;
	height: 400px;
}
</style>
<title>구독페이지</title>


</head>
<header></header>
<body>
<br><br>
	<h1><a style='color:black' href='/bgm/newscontroll'>news</a> > 구독</h1>

	<h2 align="center">신문사 구독</h2>


	<table id="item" align="center">
		<tr>
			<%
				int i = 0;
				while (i < list.size()) {
			%>

			<td><a id="news" onclick = "return handle('<%=list.get(i).getCompanyNo()%>');" 
				href="pay?newsno=<%=list.get(i).getCompanyNo()%>"><img
					src="/bgm/news/images/<%=list.get(i).getImage()%>" width="110"
					height="110"></a></td>


			<%
				if ((i+1)%3==0) {
			%>
		</tr>
		<tr>
			<%
				}
					i++;
				}
			%>



		</tr>



	</table>
</body>
<footer> </footer>
</html>