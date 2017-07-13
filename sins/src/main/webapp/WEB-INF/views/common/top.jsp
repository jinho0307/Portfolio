<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="/sins/resources/js/common/top.js"></script>
<link rel="stylesheet" type="text/css" href="/sins/resources/css/common/top-common.css" />
<title>Insert title here</title>

	</head>
<body>
<div id="logo" onclick="goHome()"></div>
<div id="serchbar">
	<%@include file="/WEB-INF/views/search/searchBar.jsp" %>
</div>

<div id="mylayout">
	<div id="friendTab"><div id="friendlist" ></div></div>
	<div id="message" onmouseover="msgover()" onclick="message()"><div id="msglist"></div></div>
	<div id="allet" onmouseover="alertover()" onclick="alert1()"><div id="alertlist"></div></div>
	<div id="logout" onmouseover="removealertlist()" onclick="logout()"></div>
	<div id="my" onclick="goMyInfo()"><p id="m">내 정보보기</p></div>
	
	
</div>

</body>
</html>