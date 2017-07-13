<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="movie.model.vo.*, java.text.*, java.util.*,  member.model.vo.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>bgm 메인페이지(index)</title>
<script type="text/javascript" src="common/js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">

ii=0;

	$(function() {
		$('header').load('/bgm/common/view/header.jsp');
		$('footer').load('/bgm/common/view/footer.jsp');
        main();
	 	rank(); 
	 	var obj = document.getElementById('div2');
	 	obj.style.display="none"; 
	});
	
	



	$(document).on("mouseenter", "#scroll", function(){
		 var obj = document.getElementById('div2');
			
		  obj.style.display = "block";
	});
		 
	 
	 $(document).on("mouseleave", "#div2", function(){
		 var obj = document.getElementById('div2');
			
		  obj.style.display = "none";
	});
			
		
		

		
	function textScroll(scroll_el_id) {
	    this.objElement = document.getElementById(scroll_el_id);
	    this.objElement.style.position = 'relative';
	    this.objElement.style.overflow = 'hidden';

	    this.objLi = this.objElement.getElementsByTagName('li');
	    this.height = this.objElement.offsetHeight; // li 엘리먼트가 움직이는 높이(외부에서 변경가능)
	    this.num = this.objLi.length; // li 엘리먼트의 총 갯수
	    this.totalHeight = this.height*this.num; // 총 높이
	    this.scrollspeed = 2; // 스크롤되는 px
	    this.objTop = new Array(); // 각 li의 top 위치를 저장
	    this.timer = null;
	    
	    for(var i=0; i<this.num; i++){
	        this.objLi[i].style.position = 'absolute';
	        this.objTop[i] = this.height*i;
	        this.objLi[i].style.top = this.objTop[i]+"px";
	    }
	}

	textScroll.prototype.move = function(){
	    for(var i=0; i<this.num; i++) {
	        this.objTop[i] = this.objTop[i] - this.scrollspeed;
	        this.objLi[i].style.top = this.objTop[i]+"px";
	    }
	    if(this.objTop[0]%this.height == 0){
	        this.jump();
	    }else{
	        clearTimeout(this.timer);
	        this.timer = setTimeout(this.name+".move()",50);
	    }
	}

	textScroll.prototype.jump = function(){
	    for(var i=0; i<this.num; i++){
	        if(this.objTop[i] == this.height*(-2)){
	            this.objTop[i] = this.objTop[i] + this.totalHeight;
	            this.objLi[i].style.top = this.objTop[i]+"px";
	        }
	    }
	    clearTimeout(this.timer);
	    this.timer = setTimeout(this.name+".move()",3000);
	}

	textScroll.prototype.start = function() {
	    this.timer = setTimeout(this.name+".move()",3000);
	}


	function rank(){
		$.ajax({
			url : "/bgm/rank",
			data : {option : "1"},
			type : "get",
			dataType : "json",
			success : function(data){
			
				var jsonStr = JSON.stringify(data);  
			
				var jsonArr = JSON.parse(jsonStr);
				
				var value="";
				for(var i =0; i<10;i++){
					value += "<li id = 'rankli'><a href='/bgm/incount?url="+decodeURIComponent(jsonArr.rank[i].url)+"' target='_blank' id='atag'>"+decodeURIComponent(jsonArr.rank[i].title).substr(0,20).replace(/[+]/gi," ")+"...</a></li>"; 
					
				}

					
				$("#scroll").html(value);
				
				real_search_keyword = new textScroll('scroll'); // 스크롤링 하고자하는 ul 엘리먼트의 id값을 인자로 넣습니다
				real_search_keyword.name = "real_search_keyword"; 
				real_search_keyword.start();
				
				
				
				var val="";
				for(var i =0; i<10;i++){
					val += "<li id='rankli2' style='margin-bottom:10px; '><a id='panli' href='/bgm/incount?url="+decodeURIComponent(jsonArr.rank[i].url)+"' target='_blank'>"+decodeURIComponent(jsonArr.rank[i].title).replace(/[+]/gi," ")+"</a></li>"; 
				}
				
				$("#panel").html(val);
				
			}
			
			
		});
		
		
	} 
	function main(){
		$.ajax({
			url : "/bgm/bgscom",
			type : "get",
			dataType : "json",
			success : function(data){
			
				var jsonStr = JSON.stringify(data);  
			
				var jsonArr = JSON.parse(jsonStr);
				
				var value="";
				

				value= "<div id='slideConteiner'>"+
			
				"<br> ";
				
				
				

				for (var i=0; i<jsonArr.main.length; i++) {
					
					var movieLink = jsonArr.main[i].url;
				
				
				
				value+= "<a href='/bgm/msearch?movieid="+jsonArr.main[i].mid+"'>" +
		"<img src='"+movieLink+"' class='img1' style='width:300px;'></a>";
	
				}
		value+= "</div>"+
		"<ul id='slideBar'>";
		
		
		 for (var i=0; i<jsonArr.main.length/3-1; i++) {
			var j=-900*i; ii=i;
			value+="<li><a id='a"+i+"' class='active' data-left='"+j+"px'></a></li>";
			}
			
		 value+="</ul>";
		

				$("#wrap").html(value);
				
				
				
				
				
				i=0; j=ii+1;
				
				setInterval(function(){
					
					i++;if(i<j){
					$('#slideBar a').removeClass('active')
					$('#slideBar #a'+i).addClass('active');
					var dataLeft = $('#slideBar  #a'+i).attr('data-left');
					$('#slideConteiner').animate({
						left : dataLeft
					}, "fast");}else{i=0;
						$('#slideBar a').removeClass('active')
						$('#slideBar #a'+i).addClass('active');
						var dataLeft = $('#slideBar  #a'+i).attr('data-left');
						$('#slideConteiner').animate({
							left : dataLeft
						}, "fast");
					}
				},6000); 
				
				$(document).on("click","#slideBar a",function() {
					
					$('#slideBar a').removeClass('active')
					$(this).addClass('active');
					var dataLeft = $(this).attr('data-left');
					$('#slideConteiner').animate({
						left : dataLeft
					}, "fast");
				});	
				
			}	
				
				
	
				
			
			
			
		});

	}
		
			
		
		
		
		

			
	
</script>

<style type="text/css">
ul, li {
	list-style: none;
}

#page{
margin:auto;
width:1150px;
height:600px;
}
#wrap {
	margin: 0px auto;
	width: 900px;
	height: 520px;
	overflow: hidden;
	position: relative;
}

#slideConteiner {
	width: 6273px;
	position: absolute;
	-webkit-transition: all 1.2s ease-in-out;
	-moz-transition: all 1.2s ease-in-out;
	-o-transition: all 1.2s ease-in-out;
}

#slideConteiner img {
	float: left;
}

#slideBar {
	position: relative;
	margin: 470px auto;
	width: 120px;
}

#slideBar a {
	float: left;
	width: 15px;
	height: 15px;
	background: url(/bgm/Movie/영화포스터/dots.png) no-repeat;
}

#slideBar a.active {
	background-position: 0 -30px;
}




#scroll {
height:30px; 
width:300px;
background:black; color:white;


}
#rankli{height:30px;
list-style-type:decimal}

#rankli2{
list-style-type:decimal;
}
#atag{text-decoration: none; color:white;}

#div2{
position:absolute;
width:350px;
height:320px;
background:white;
color:black;
top:0px;
right:0px;
border:1px solid rgb(136, 56, 45);
z-index:10;

}
#listdiv{

position:relative;
float:right;
height:30px;
z-index:9;
}
#panli{
text-decoration: none;
color:black;
}



</style>

</head>
<header></header>
<body>
<section></section>


		<br>
		<div id= "page">
			<div id="div1" style="width: 1150px; height: 530px; background: black; color: #fff;">
				
				
				<div id = "listdiv"><ol id="scroll"></ol>
					<div id = "div2"><h3>&nbsp;&nbsp;&nbsp;실시간 인기뉴스</h3><ol id = "panel" style='font-size:0.7em; color:black;' ></ol></div>
				
				</div>
				
				
				<div id="wrap">
				
					
			</div>
			<br> <br>
			</div>
			</div>
</body>
<footer>

</footer>
</html>