<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.2/sockjs.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.js"></script>
<script type="text/javascript" src="/sins/resources/js/alert/alert.js"></script>
<style type="text/css">

body{
	overflow: auto;
	margin: 0;
	pause: 0;
}
#iframe{
	width : 100%;
	height: 99%;
	margin: 0;
	pause: 0;
	border-width: 0;
	border-style: none;

}
#aldi{
	width: 200px;
	height: 150px;
	background: white;
	border : 1px solid black;
	position: absolute;
	top : 10%;
	right : 5%;
}
</style>
<script type="text/javascript">

$(document).ready(function() {
			
	$('body').css('height', $(window).height());
	$('body').css('width', $(window).width());
	
	$(window).resize(function() {
		$('body').css('height', $(window).height());
		$('body').css('width', $(window).width());
		
	});
});

function locat(){
	location.href="http://192.168.20.89:9999/sins/";
}
</script>
<body>
<div id="aldi"></div>
<input type="hidden" id="userid" value="${loginUser.userId}"/>
<iframe id="iframe" src="/sins/newsfeed.b" >
</iframe>
</body>
</html>