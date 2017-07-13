<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>SINS</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="/sins/resources/css/newsfeed-common.css" />

<script type="text/javascript">
	$(document).ready(function() {
		$('#t-l').click(function() {
			$('#spot1, #overlay_t').show();
		});
		$('#overlay_t').click(function(e) {
			e.preventDefault();
			$('#spot1, #overlay_t').hide();
		});
		$('#t-r').click(function() {
			$('#spot2, #overlay_t').show();
		});
		$('#overlay_t').click(function(e) {
			e.preventDefault();
			$('#spot2, #overlay_t').hide();
		});
	});
</script>
</head>
<body>
	<div id="header">
		<div id="overlay_t"></div>
		<div id="t-l"></div>
		<div id="top">
			<c:import url="../common/top.jsp" charEncoding="UTF-8" />
		</div>
		<div id="t-r"></div>
	</div>
	<div id="container">
		<div id="left" class="box">
			<h2>LEFT</h2>
			<ul>
				<li><a href="alink.do?path=group/GroupMain">그룹</a></li>
				<li><a href="alink.do?path=group/GroupList">그룹리스트</a></li>
				<li>Dolor</li>
			</ul>
		</div>
		<div id="content" class="box" style="position:relative;">
			<h2>그룹 이름</h2>
			<div style="width:100%;height:20%;border:1px solid; ">
				<h3>메인 사진</h3>
			</div>
			<div style="float:right;width:28%;height:40%;border:1px solid;margin-top:10px;">
				<h3>멤버 초대</h3>			
			</div>
			<div style="width:70%;height:20%;margin-top:10px; margin-right:10px;border:1px solid;">
				<h3>게시글 및 사진</h3>
			</div>
			


		</div>
		<div id="right" class="box">
			<h2>그룹회원</h2>
			<ul>
				<li>Lorem</li>
				<li>Ipsum</li>
				<li>Dolor</li>
			</ul>
		</div>
	</div>
	<div id="footer">
		<c:import url="../common/footer.jsp" charEncoding="UTF-8" />
	</div>
	<div id="spot1"></div>
	<div id="spot2"></div>
</body>
</html>