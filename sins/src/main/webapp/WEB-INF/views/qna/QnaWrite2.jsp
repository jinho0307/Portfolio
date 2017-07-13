<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>Q&A</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.js"></script>

<script src="/sins/resources/js/qna/qna.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/qna/qna-common.css" />
	<link rel="shortcut icon" href="/sins/resources/images/favicon.ico">


</head>

<script>





</script>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top"><%@include file="/WEB-INF/views/common/top.jsp"%></div>
		<div id="t-r"></div>
	</div>
	<div id="container" >
		<div id="left" class="box">
			<h2>left</h2>
			<br>
			<ul>

			</ul>
		</div>
		<div id="content" class="box" >
			<strong class="titleFont"><a href="selectQna.n" class="atag">Q&A</a> - 문의하기</strong><br><br>
		
		<div id="writeForm" style='width:600px;'>
			<form id="write_form" action="write.n" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
			
				
					
					
					제목 <input id="title" name="title" style='width:530px;'/>
				
				<br><br>
						
		<textarea style="width: 500px;" rows="10" name="content" id="textAreaContent" cols="80"></textarea>
				<br>
				
				</form>
			
			
			<button id= "submitBtn" style='position:relative; float:left; left:470px; width:100px;'>작성</button>



		</div>
		</div>
		<div id="right" class="box">
		
			
			<%@include file="/WEB-INF/views/friend/friendView.jsp" %>
		</div>
	</div>
	<div id="footer"><%@include
			file="/WEB-INF/views/common/footer.jsp"%>

	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>