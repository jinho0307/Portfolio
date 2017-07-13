<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, news.model.vo.NewsCompany, news.model.vo.NewsURL, member.model.vo.*"%>
<%
	ArrayList<NewsCompany> list = (ArrayList<NewsCompany>) request.getAttribute("newslist");
	ArrayList<NewsURL> ulist = (ArrayList<NewsURL>) request.getAttribute("newsurl");
	
	Member loginUser = (Member)session.getAttribute("loginUser");
	Collections.shuffle(ulist);
	
	
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/bgm/common/js/jquery-3.1.1.min.js">
	
</script>

<script>

islogin = true;
<%if(loginUser==null){%>
	islogin=false;
<%}%>

$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");

	hotrank();
	newsform();
	 
		
		
	});
	
	

	$(document).on("change", "#selectlist", function() {

		var val= $("#selectlist").val();
		if(val!="신문사 선택")
			location.href = "detail?comname=" + val;

	});
	
	
	
	
	
	
	$(document).on("click", "#hotbtn", function(){
		
		hotrank();
		
	});
	 
	
	$(document).on("click", "#newbtn", function(){
		
		newrank();
	});
	

	function hotrank(){
		$.ajax({
			url : "rank",
			data : {option : "1"},
			type : "get",
			dataType : "json",
			success : function(data){
				//console.log(data);
				var jsonStr = JSON.stringify(data);  
				//console.log(jsonStr);
				var jsonArr = JSON.parse(jsonStr);
				
				var value="";
				for(var i =0; i<10;i++){
					value += "<li id = 'rankli'>"+"<a href='/bgm/incount?url="+decodeURIComponent(jsonArr.rank[i].url)+"' target='_blank' id='atag'>"+decodeURIComponent(jsonArr.rank[i].title).substr(0,21).replace(/[+]/gi," ")+"..."+"</a></li>";

				}

					
				$("#printrank").html(value);	
			}
		});
	}
	
	function newrank(){
	
		$.ajax({
			url : "rank",
			data : {option : "2"},
			type : "get",
			dataType : "json",
			success : function(data){
				//console.log(data);
				var jsonStr = JSON.stringify(data);  
				//console.log(jsonStr);
				var jsonArr = JSON.parse(jsonStr);
				
				
				var value="";
				for(var i =0; i<10;i++){
					value += "<li id = 'rankli'>"+"<a href='/bgm/incount?url="+decodeURIComponent(jsonArr.rank[i].url)+"' target='_blank' id='atag'>"+decodeURIComponent(jsonArr.rank[i].title).substr(0,21).replace(/[+]/gi," ")+"..."+"</a></li>";
					
				}

				
				$("#printrank").html(value);
				
			}
		});
	}
	
	
	
	$(document).on("click", "#thumb", function(){
		
		
		
		$("#newsform").children().remove();
		
		
		$("#newsform").html(
				
		"<div id='images' style='position:absolute; top:0px; left:200px;'>"+
		"<table style='margin:30px;' id='item'>"+
		"<tr>"+
			<%
				int in = 0;
				while (in < list.size()) {
					
					
					%>
			

			"<td><a id='imgtable' href = 'detail?comname=<%=list.get(in).getCompanyName()%>'>"+
			
			"<img src='/bgm/news/images/<%=list.get(in).getImage()%>'"+
			"width='150' height='150'></a></td>"+
				


			<%
				if ((in+1)%3==0) {
			%>
		"</tr><tr>"+
			<%
				}
					in++;
				}
				in=0;
			%>



		"</tr></table></div>");
	});
	
	
	
 	$(document).on("click", "#list", function(){
		
 		newsform();
 	});	
 		
 		
 		
 	function newsform(){
	
 		
 		$("#newsform").children().remove();
	
 		
 		
 		
 		
		$("#newsform").html(
				"<hr style='background:gray; position:absolute; left:0px; width:830px; '><br>"+
		<%
			int count;
			for (int i = 0; i < list.size(); i++) {
		%>
	
		"<div id='newsImage'>"+
			"<a href='<%=list.get(i).getMainURL()%>'><img "+
				"src='/bgm/news/images/<%=list.get(i).getImage()%>'" +
				<%if (i == 1) {%> 
				"width=85 height=85"+ 
				<%} else {%> 
				"width=80 height=80"+
				<%}%>
				"></a></div>"+
				
				
				"<div id='news'>"+
				"<ul id='ul'>"+
					<%
						count = 0;
							for (int j = 0; j < ulist.size(); j++) {
								if (count < 5 && list.get(i).getCompanyName().equals(ulist.get(j).getCompanyName())) {
					%>
						"<li id='li'>"+
						"<a href='/bgm/incount?url=<%=ulist.get(j).getNewsURL()%>' id = 'atag'"+
						"target='_blank'>"+
						"<%=ulist.get(j).getNewsTitle()%>"+
						"</a></li>"+


					<%
						count++;
								}
							}
						
					%>
					"</ul></div>"+
				
				
			
						
		<%if(i%2==1){%> "<br><hr style='position:relative; left:-20px; width:830px; background:gray;'>"+<%}}%>
		"</div>");
	} 
 	
 	
 	$(document).on("click", "#mynews", function(){
 		if(islogin==false)
 		alert("로그인이 필요한 페이지입니다.");

 	});
	
</script>

<title>BGM뉴스 - BGM</title>

<style type="text/css">

    


#ul, #li {margin: 0; padding: 1px; list-style: none;}


#atag{
color:black;

}

#newsform {


	top: 400px;
	height: 400px;
	width: 880px;
	border: 0;
	position: absolute;
	
}

#page {
	margin: auto;
	
	width: 1150px;
	height:800px;
	border: 0; 
	
}

#newsImage {
	width: 90px;
	height: 90px;
	float: left;
}

#news {
	
	
	width: 340px;
	height: 100px;
	float: left;
	font-size: 0.7em;
}

.news_sort {
	
	text-align: right;
	width: 97%;
	height: 30px;
	
	border: 0;
}

#hotnews {
	position:relative;
	left:870px;
	background: white;
	width: 260px;
	height: 350px;
	
	
}

#rankli{
margin:0;
margin-top:10px;

font-size: 0.9em;

}

</style>

</head>
<header></header>
<body>

	<br>
	<br>
	
	<div id="page">

		
		<h1>news ></h1>
		<h2><a href="#"></a></h2>
			<div class="news_sort">
				<a id="thumb" title="매체보기" class="sort_thumb">매체보기</a> <a
					id="list" title="기사보기" class="sort_list ">기사보기</a> <a
					id="mynews" title="my뉴스" class="mynews" href= "/bgm/mynews">my뉴스</a>
				&nbsp;&nbsp;&nbsp; <a href="/bgm/sub">구독하기</a> <select
					id="selectlist">



					<option selected>신문사 선택</option>

			
					<%
						for (int i = 0; i < list.size(); i++) {
					%>
					<option value="<%=list.get(i).getCompanyName()%>"><%=list.get(i).getCompanyName()%></option>


					<%
						}
					%>

				</select>


			</div>

<br>

<div id="newsform">
		</div>

<div id="hotnews" style='background: rgb(250,250,250);'>
<br>
			 실시간 인기뉴스<br><br>
			<button id="hotbtn" style=' position:absolute; top:40px;right:0px'>조회순</button><button id="newbtn" style='position:absolute; top:40px; right:55px'>최신순</button>
			<div 
				style='position: absolute; border-top:3px double gray; border-bottom:3px double gray;  font-size:0.8em; width:260px;'>
				<ol id="printrank" style='color:red'></ol>
			</div> 
		


		</div>
		


	</div>
</body>

<footer></footer>
</html>