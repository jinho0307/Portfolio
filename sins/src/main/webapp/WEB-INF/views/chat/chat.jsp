<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Your First WebSocket!</title>
<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script type="text/javascript" src="/sins/resources/js/chat/chat.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/chat/chat.css" />
</head>
<body>        
        <div id="chatmain">
            
	            <input type="hidden" id="userid" value="${loginUser.userId }">
	            <input type="hidden" id="username" value="${loginUser.userName }">
            	<input type="hidden" id="groupno" name="groupNo" value="1"/>
            	                
				<input type="button" value="out" onclick="exitchat()"/>
                <input id="chat" name="message" value="님이 입장하셧습니다." size="17" autofocus="autofocus"/>
                <input onclick="sendbtn()" value="쓰기" type="button">
                
            
            <div id="text"></div>
        </div>
        
</body>
</html>
