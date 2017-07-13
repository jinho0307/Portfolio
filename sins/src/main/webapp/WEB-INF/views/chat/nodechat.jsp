<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">
	<title>채팅방 - stoneis.pe.kr</title>
	<!-- <link rel="stylesheet" href="/stylesheets/style.css" /> -->
	<script  src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/1.7.3/socket.io.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script>
		// 채팅 아이디
		var chat_id = '';
		// 현재 접속자 수
		var cnt = 0;
		// Socket Object
		var socket = null;

		// DOM이 모두 로딩되었을 시 이벤트 발생
		$(document).ready(function() {
			// INPUT BOX에 키보드 이벤트가 발생했을 경우 발생
			$('#chat_input').keypress(function(evt){
				// 채팅 글을 입력 후 Enter 키를 눌렀을 경우 메시지 전달 처리 (Socket 통신)
			});

			// 브라우저 즉, 화면을 닫았을 경우 발생
			$(window).unload(function() {
				// 채팅창에서 나가는 로직 처리
				// 채팅글를 초기화하고, 미접속시 영역으로 바뀜
				// 현재 접속자 정보 새로고침 (Socket 통신)
			});
			chat_user();
		});
		// 채팅창 "입력" 버튼 클릭 시
		function chat_input() {
			// Socket 통신 메시지 전달
		}
		// 채팅 "나가기" 버튼 클릭 시
		function chat_out() {
			// Socket 통신
			// 처음 상태로 초기화 및 미접속영역으로 노출
		}
		// 접속하기 처리
		function chat_in() {
			// Socket 통신
		}
		// 현재 접속자 정보 새로고침
		function chat_user() {
			// Socket 통신
		}
		// "접속하기" 버튼 클릭 시에 대한 유효성 체크
		function connection() {
			// 유효성 체크 후 성공적인 로그인이라면 미접속영역을 숨기고 채팅창 영역이
			// 슬라이드 효과로 처리
		}
	</script>
</head>
<body>

	<!-- 컨텐츠 영역 -->
	<div id="contents">
	<h1>채팅방 (blog.naver.com/musasin84, cafe.naver.com/buldon)</h1>
	<div class="chat_content">
		<!-- 로그인 영역 -->
		<div class="chat_login">
			<div id="chat_login_form" class="chat_login_form">
				<input type="text" id="chat_id" class="login_input" value="ID 입력" onclick="$(this).val('');" />&nbsp;&nbsp;<a href="javascript:connection();">접속하기</a>
			</div>
			<!-- 현재접속자수 영역 -->
			<div class="now_user_cnt"><strong>현재접속자수</strong> : <span id="now_user_cnt">-</span></div>
		<!-- //로그인 영역 -->
		</div>
		<!-- 채팅창 영역 -->
		<!-- 미접속시 보여지는 영역 -->
		<div id="chat_form_no" class="chat_form">
			ID 입력 후 접속해 주세요.
		</div>
		<div id="chat_form" class="chat_form" style="display: none;">
			<!-- 채팅창 글 영역 -->
			<div class="chat_list">
				<ul id="chat_list"></ul>
			</div>
			<div class="chat_user">
				<!-- 현재접속자 목록 영역 -->
				<div class="chat_user_list">
					<ul id="chat_user_list"></ul>
				</div>
			</div>
			<!-- 입력 영역 -->
			<div class="chat_input">
				<input type="text" id="chat_input" class="chat_input_txt" value="대화 글을 입력하세요." onclick="$(this).val('');" />
			</div>
			<!-- 버튼 영역 -->
			<div class="chat_btn">
				<a href="javascript:chat_input();">입력</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="javascript:chat_out();">나가기</a>
			</div>
		<!-- //채팅창 영역 -->
		</div>
		<!-- 접속로그 영역 -->
		<div class="chat_history">
			<div class="chat_history_list">
				<ul id="chat_logs"></ul>
			</div>
		<!-- //접속로그 영역 -->
		</div>
	</div>
	<!-- //컨텐츠 영역 -->
	</div>


</body>
</html>
    