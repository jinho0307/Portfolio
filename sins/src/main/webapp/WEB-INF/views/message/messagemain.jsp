<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">
    <script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
    <style>
      #container {
        width: 1000px;
        margin: 0px auto;
        background-color: #E7E4F9;
      }
      #header {
    	height: 40px;
        margin-bottom: 10px;
        background-color: #9581BF;
      }
      #t-l {
      	float:left;
      	margin-left: 10px;
      	display:none;
      }
      #t-r {
      	position: absolute;
      	float:right;
      	margin-right: 10px;
      	right: 10px;
      	display:none;
      }
      #left {
        width: 130px;
        height : 500px;
        margin-left: 30px;
        float: left;
        background-color: white;
      }
      #content {
        width: 600px;
        height: 500px;
        padding: 20px;
        margin-left: 20px;
        float: left;
        background-color: white;
      }
      #right {
        width: 130px;
        height : 500px;
        margin-right: 30px;
        float: right;
        background-color: white;
      }
      #footer {
      	height:30px;
        clear: both;
        margin-top: 10px;
        border: 1px solid #9581BF;
        background-color: white;
      }
      @media screen and (max-width:500px) {
      	#t-l {
      	display:block;
      	}
      	#t-r {
      	display:block;
      	}
        #container {
          width: auto;
        }
        #left {
          display : none;
          float: none;
          width: auto;
        }
        #content {
          float: none;
          width: auto;
          margin: auto;
        }
        #right {
          display : none;
          float: none;
          width: auto;
        }
      }
      
      @media screen and (max-width:900px) {
      	#t-r {
      	display:block;
     	}
        #right {
          display: none;
          float: none;
          width: auto;
        }
      }
      #overlay_t { 
      background-color: #000; 
      bottom: 0; 
      left: 0; 
      opacity: 0.0; 
      filter: alpha(opacity = 50); /* IE7 & 8 */ 
      position: fixed; 
      right: 0; 
      top: 0; 
      z-index: 99; 
      display:none;
      }
      #spot1 {
      width: 200px;
      height : 300px;
      background-color: white;
      position:absolute; 
      left:10px; 
      top:30px; 
      display:none;
      z-index: 100;
      border: 1px solid #9581BF;
      }
      #spot2 {
      width: 200px;
      height : 300px;
      background-color: white;
      position:absolute; 
      right:10px; 
      top:30px; 
      display:none;
      z-index: 100;
      border: 1px solid #9581BF;
      }

    </style>
<script type="text/javascript">
$( document ).ready(function() { 
    $('#t-l-b').click(function(){ 
     	$('#spot1, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot1, #overlay_t').hide(); 
	});
 	$('#t-r-b').click(function(){ 
     	$('#spot2, #overlay_t').show(); 
 	}); 
 	$('#overlay_t').click(function(e){ 
     	e.preventDefault(); 
     	$('#spot2, #overlay_t').hide(); 
	});
});
</script>
  </head>
  <body>
    <div id="container">
      <div id="header">
      	<div id="overlay_t"></div> 
      	<div id="t-l"><a id="t-l-b" href="#">=</a></div>
       	<div id="t-r"><a id="t-r-b" href="#">=</a></div>
      </div>
      <div id="left">
        <h2>메시지함</h2>
        <ul>
        	<li><h4>받은 메세지</h4></li>
        	<li><a href="alink.do?path=message/messagewrite">메시지 쓰기</a></li>
          	<li>보낸 메시지</li>
          
          
        </ul>
      </div>
      <div id="content">
        <h2>받은 메세지</h2>
        쪽지지지지
      </div>
      <div id="right">
        <h2>RIGHT</h2>
        <ul>
          <li>Lorem</li>
          <li>Ipsum</li>
          <li>Dolor</li>
        </ul>
      </div>
      <div id="footer">
        FOOTER
      </div>
    </div>
    <div id="spot1"></div>
    <div id="spot2"></div>
  </body>
</html>