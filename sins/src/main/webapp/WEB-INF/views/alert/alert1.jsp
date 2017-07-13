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
html, body{
	height: 100%;
	overflow: hidden;
	margin: 0;
	pause: 0
	
}
#iframe{
	width : 100%;
	height: 96%;
	margin: 0;
	pause: 0;
}
</style>
<body>
<input type="hidden" id="ii"/>
<input type="hidden" id="userid" value="${loginUser.userId}"/>
<iframe id="iframe" src="/sins/alink.do?path=admin/adminPage">
</iframe>
</body>
</html>