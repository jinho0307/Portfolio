<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"
	import="java.util.*, news.model.vo.NewsCompany, member.model.vo.Member , news.model.vo.*"%>
<%
	
	NewsCompany nc=(NewsCompany)request.getAttribute("company");
	Member loginUser=(Member)session.getAttribute("loginUser");
	
	ArrayList<NewsCompany> list = (ArrayList<NewsCompany>)request.getAttribute("newslist");
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="/bgm/common/js/jquery-3.1.1.min.js">
	
</script>

<script>
islogin=true;
<%if(loginUser==null){%>
islogin=false;
<%}%>
	compName= "<%=nc.getCompanyName()%>";
	index=1;
	
	$(document).ready(function() {
		$('header').load("/bgm/common/view/header.jsp");
		$('footer').load("/bgm/common/view/footer.jsp");

		newsChange(compName);
		hotrank();
		setInterval('newsChange(compName);',5000); 
	});

	
	
	$(document).on("change", "#selectlist", function() {

		if($("#selectlist").val()!="신문사 선택")
			newsChange($("#selectlist").val());
		
		

	});
	
	
	$(document).on("click", "#btn", function(){
		if(islogin==false){
			alert("로그인이 필요한 서비스입니다. 로그인 해주세요.")
		}
	
		location.href="pay?newsno="+<%=nc.getCompanyNo()%>;
		
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
	
	
	
	
	
	function newsChange(comName){
	
		
		$.ajax({
			url : "dview",
			data : {companyName : comName},
			type : "get",
			dataType : "json",
			success : function(data){
				//console.log(data);
				var jsonStr = JSON.stringify(data);  
				//console.log(jsonStr);
				var jsonArr = JSON.parse(jsonStr);
				
				if(index==jsonArr.newsURL.length)
					index=1;
					
				
				
				var image= "<a href='"+decodeURIComponent(jsonArr.newsURL[0].mainurl)+"' target='_blank'> <img src='/bgm/news/images/"+jsonArr.newsURL[0].comimg+"' width=80 height=80></a>";
				
				$("#newsImage").html(image);
				
				
				var	main = "<a href='/bgm/incount?url="+decodeURIComponent(jsonArr.newsURL[index].url)+"' target='_blank' id='atag'><img src='/bgm/news/images/"
							+jsonArr.newsURL[index].image+"' width=400 height=300><center style='font-size:1.2em'>"+decodeURIComponent(jsonArr.newsURL[index].title).replace(/[+]/gi, " ")
							+"</center></a>";
							
							
							
				$("#image").html(main);
					
					
					
				$("#newsul").children().remove();
				
				var value="";
				
				if(index==1){
					for (var i = 2; i<jsonArr.newsURL.length;i++) {
	
						
						if(i==index) continue;
						
						
						
						value+="<li class='li'><a href='/bgm/incount?url="+decodeURIComponent(jsonArr.newsURL[i].url)+"' target='_blank' id='atag'>"+decodeURIComponent(jsonArr.newsURL[i].title).replace(/[+]/gi, " ")+"</a></li>";
					}
				}else{
					for (var i = 1; i<jsonArr.newsURL.length;i++) {

						
						if(i==index) continue;
						
						
						
						value+="<li class='li'><a href='/bgm/incount?url="+decodeURIComponent(jsonArr.newsURL[i].url)+"' target='_blank' id='atag'>"+decodeURIComponent(jsonArr.newsURL[i].title).replace(/[+]/gi, " ")+"</a></li>";
					}
					
				}
					
					
				
				
				$("#newsul").html(value);
				compName=decodeURIComponent(jsonArr.newsURL[0].comname);
				
				
				index++;
				
				
			}
		});
		
		
	
	}
	
</script>

<title>BGM뉴스 - BGM</title>

<style type="text/css">


.li{
margin-top:5px;
}


#atag{
color:black;
}

#page {
	margin: auto;
	height: 650px;
	width: 1150px;
	border:0;
	position:relative;
}

#newsImage {
top:0px;
	width: 80px;
	height: 80px;
	
	float: left;
	left:550px;
	position:absolute;
	
	
	
}

#news {
	width: 450px;
	height: 300px;
	left:300px;
	float: left;
	font-size: 0.9em;
	margin:100px;
	position:absolute;
	top:50px;
}

.selectview {
top:0px;
	text-align: right;
	width: 97%;
	height: 30px;
	border: 0;
	right:50px;
	position:absolute;
}

#image{
position:absolute;
top:120px;
width:400px;
height:300px;

}
#hotnews {
	position: absolute;
	left: 850px;
	top:100px;
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
	
	<h1><a style='color:black' href='/bgm/newscontroll'>news</a> > detail</h1>
	<br>
		<div class="selectview">
			
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

		


		<div id="newsImage">
			
		</div>
		
		
		<div id="image">
			
		</div>



		<div id="news">
			<ul id = "newsul">
				

			</ul>
			
		</div>
		
		
	
		
		
		<div style='position:absolute; bottom:100px; right: 10px;  width:250px; height:50px; '><button id="btn" style='width:200px; height:50px; font-size:1.3em;'>구독하기</button>
		</div>
		
		<div id="hotnews" style='background: rgb(250,250,250);'>
			실시간 인기뉴스
			<button id="hotbtn" style='background:white; position:absolute; top:15px ;right:0px'>조회순</button><button id="newbtn" style='background:white; position:absolute; top:15px; right:56px'>최신순</button>
			<div 
				style='position: absolute; top:40px;   border-top:3px double gray; border-bottom:3px double gray; font-size:0.8em; width:260px;'>
			
			<ol id="printrank" style='color:red;'>
	


		</ol>
			
				
			</div>
			



		</div>
		
		</div>
	





</body>

<footer></footer>
</html>