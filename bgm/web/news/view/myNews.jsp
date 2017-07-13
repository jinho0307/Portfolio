<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.*, news.model.vo.*"%>
<!DOCTYPE html>

<%
	ArrayList<NewsCompany> mylist = (ArrayList<NewsCompany>)request.getAttribute("mylist");
	

%>
<html>
<head>
<meta charset="UTF-8">
<title>my뉴스</title>
</head>
<script src="/bgm/common/js/jquery-3.1.1.min.js">
	
</script>

<script>

isEmpty = true;
<% if(mylist!=null){%>
	isEmpty=false;
	compName= "<%=mylist.get(0).getCompanyName()%>";
<%}%>
	
	



$(document).ready(function() {
	$('header').load("/bgm/common/view/header.jsp");
	$('footer').load("/bgm/common/view/footer.jsp");

	if(isEmpty==false){
		newsChange(compName);
	}else{
		empty();
	}
	
	
});

function empty(){
	
	$("#page").children().remove();
	
	
	value= "<center><div style='position:absolute; top:200px; font-size:1.2em'><hr><br><strong> 구독중인 뉴스가 없습니다.  </strong><br><br> 신문사 구독 결제를 하면 여러 뉴스들을 볼 수 있습니다."+
			"<br><br><button id='subBtn' style='width:180px; height:50px; font-size:1.2em;' onclick='sub();'>구독하러가기</button><br><hr></div></center>"
				
	$("#page").html(value);
	
	
	
}

function sub(){
	location.href="/bgm/sub";
	
}
$(document).on("change", "#selectlist", function() {

	newsChange($("#selectlist").val());
	
	

});


function printrank(comName){
	
	$.ajax({
		url : "myrank",
		data : {companyName : comName},
		type : "get",
		dataType : "json",
		success : function(data){
			var jsonStr = JSON.stringify(data);  
			
			var jsonArr = JSON.parse(jsonStr);
			
			var value = "";
			
			for(var i = 0; i<jsonArr.myRank.length;i++){
				
				value+="<li id = 'rankli'>"+"<a id='atag' href='/bgm/incount?url="+decodeURIComponent(jsonArr.myRank[i].url)+"' target='_blank'>"+decodeURIComponent(jsonArr.myRank[i].title).substr(0,21).replace(/[+]/gi," ")+"..."+"</a></li>";
			}
			
			$("#printrank").html(value);
			
		}
		
		
	});
	
}

function newsChange(comName){

	
	$.ajax({
		url : "myview",
		data : {companyName : comName},
		type : "get",
		dataType : "json",
		success : function(data){
			//console.log(data);
			var jsonStr = JSON.stringify(data);  
			//console.log(jsonStr);
			var jsonArr = JSON.parse(jsonStr);
			
			var date = decodeURIComponent(jsonArr.myNews[0].endDate).replace(/[+]/gi, " ");
			
			$("#dateLabel").html(date);
			
			var image= "<a href='"+decodeURIComponent(jsonArr.myNews[1].mainurl)+"' target='_blank'> <img src='/bgm/news/images/"+jsonArr.myNews[1].comimg+"' width=80 height=80></a>";
			
			$("#newsImage").html(image);
			
			
			
			var maintitle= "<a id= 'atag' href='/bgm/incount?url="+decodeURIComponent(jsonArr.myNews[2].url)+"' target='_blank'><center style='font-size:1.8em'>"
			+decodeURIComponent(jsonArr.myNews[2].title).replace(/[+]/gi, " ")+"</center></a>";
			
			$("#mainTitle").html(maintitle);
			
			
			var	main = "<a id='atag' href='/bgm/incount?url="+decodeURIComponent(jsonArr.myNews[2].url)+"' target='_blank'><img src='/bgm/news/images/"
						+jsonArr.myNews[2].image+"' width=300 height=200></a>";
						
						
						
			$("#mainImage").html(main);
			
			
			
			
			var images="";
			
			for(var i = 3; i<8;i++){
				
				images+="<td align='center' style='width:150px; height:100px;'><a id='atag' href='/bgm/incount?url="+decodeURIComponent(jsonArr.myNews[i].url)+"' target='_blank'><img src='/bgm/news/images/"
				+jsonArr.myNews[i].image+"' width=150 height=100><center style='font-size:0.7em'>"+decodeURIComponent(jsonArr.myNews[i].title).replace(/[+]/gi, " ")
				+"</center></a></td>";
			}
			
			$("#images").html(images);
			
			
			var value="";
			for (var i = 8; i < 15;i++) {

				if(i >= jsonArr.myNews.length) break;
				
				
				value+="<li class='li'><a id='atag' href='/bgm/incount?url="+decodeURIComponent(jsonArr.myNews[i].url)+"' target='_blank'>"+decodeURIComponent(jsonArr.myNews[i].title).replace(/[+]/gi, " ")+"</a></li>";
				
			}
			
			
			$("#newsul").html(value);
			
			
		
			
			
			
			compName=decodeURIComponent(jsonArr.myNews[1].comname);
			printrank(compName);
			
		
			
			
		}
	});
	
	
	

} 
</script>

<style>
#page {
	margin: auto;
	height: 800px;
	width: 1150px;
	border:0;
	position:relative;
}

#newsImage {
	width: 80px;
	height: 80px;
	

	left:30px;
	position:absolute;
	
	
	
}

#news {
	width:430px;
	height:200px;
	left:300px;
	
	font-size: 0.8em;
	margin:50px;
	position:absolute;
	top:20px;
}

#imagesform{
width:850px;
height:200px;
top:320px;
position:absolute;

}


#mainImage{
position:absolute;
top:70px;
width:300px;
height:300px;

}
.newsSelect{

	text-align: right;
	width: 100px;
	height: 50px;
	border: 0;
	right:30px;
	top:170px;
	
	position:absolute;
}

#date{
position:absolute;
top:170px;
font-size:0.8em;
left:150px;
}


#main{
position:absolute;
width:850px;
height:500px;
top:220px;
background:#F5F5F5;

}

#mainTitle{
position:absolute;
width:900px;
height:50px;
left:0px;
}

#rankform{


width:260px;
height:500px;
position:absolute;
right:20px;
top:220px;
background:#F5F5F5;

}

#rankli{
margin-top:10px;
font-size: 0.9em;

margin: 0; 
padding: 1px;
list-color:red;
}

.li{
margin-top:5px;
}


#atag{
	color:black;
}

</style>



<header></header>
<body>


<div id="page">
<h1><a style='color:black' href='/bgm/newscontroll'>news</a>> myNews</h1>
<br><br>
<div class= "newsSelect">
	<select id="selectlist">
	<option selected>구독 목록</option>

			
					<%
					if(mylist!=null){
						for (int i = 0; i < mylist.size(); i++) {
					%>
					<option value="<%=mylist.get(i).getCompanyName()%>"><%=mylist.get(i).getCompanyName()%></option>


					<%
						}
					}						
					%>

		</select>

</div>

<div id="newsImage"></div>
<div id="date">구독 종료일 : <label id = "dateLabel"></label> </div>
	<br><br><br><br>
	<hr style='width:1150px'>	
	
	
<div id= "main" >

		
		
	
		
		<div id="mainTitle"></div>
		
		<div id="mainImage"></div>



		<div id="news">
			<ul id = "newsul"></ul>
			
		</div>
		
		<div id="imagesform">
		
		<table><tr id ="images"></tr>
		
		</table>
		
		</div>
		
		
		</div>
		
		<div id="rankform" >
		<br>
			
			
			<div 
				style='position: absolute; top:200px;  font-size:0.8em; width:260px;'>
				<strong>&nbsp;&nbsp;&nbsp; 많이 본 뉴스</strong><br>
				<ol id="printrank"></ol>
			</div> 
		


		</div>
</div>


</body>
<footer></footer>
</html>