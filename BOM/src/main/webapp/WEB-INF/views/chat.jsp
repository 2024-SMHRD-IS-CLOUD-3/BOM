<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="chat.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>

<body>

	<div class="header">
		<div class="logo">BOM</div>
		<div class="menu">
			<a href="#">Home</a> <a href="#">Menu</a> <a href="#">Board</a> <a
				href="#">My page</a>
		</div>

	</div>

	<button id="backButton" onclick="goBack()">뒤로가기</button>

	<div class="main-content">
		<div class="friend-list">
			<div class="col-lg-8">
				<div class="my-name" style="height: 600px;">
					<div class="my-avatar"></div>
					<!-- 내 닉네임 표기할 장소 -->
					내 닉네임 표기할 장소
				</div>

				<!--  채팅목록 -->
				<div class="friend-item" onclick="selectFriend('연주씨', this)">
					<div class="friend-avatar"
						style="background-image: url('https://randomuser.me/api/portraits/women/1.jpg');"></div>
					<div class="friend-name">
						<!-- 상대방 닉네임 -->
						상대방 닉네임 표기
					</div>
					<div class="friend-last-message">마지막 메시지 내용</div>
				</div>
				<!-- 몇개이상인지는 모름 (아마 4개 이상일걸?)ㅋㅋ -->
				<div class="more-button" onclick="toggleMoreFriends()">더보기</div>
			</div>
		</div>
		<!-- chat body -->
		<div class="container">
			<div class="current-friend">
				<div class="current-friend-avatar" id="currentFriendAvatar"></div>
				<div id="currentFriendName"
					style="font-size: 18px; font-weight: bold;"></div>
			</div>
			<div class="chat-messages" id="chatMessages">
			<div class='row'>
			<div class='col-sm-6'></div>
			<div class='col-sm-6'>
				<div class='alert alert-secondary'>
					<b>메세지 내용</b>
				</div>
			</div>
		</div>

		<!-- 남이 보낸 메세지 예시 -->
		<div class='row'>
			<div class='col-6'>
				<div class='alert alert-warning'>
					<b>보낸 사람 : 메세지 내용</b>
				</div>
			</div>
		</div>

			
			</div>
			<!-- 메세지가 작성되는 영역 -->
			
			<div class="chat-input">
				<input type="text" id="messageInput" placeholder="메시지를 입력하세요..."
					onkeypress="checkEnter(event)" />

				<!-- onClick으로 답이 무조건 오게 설정되어있음. -->
				<button onclick="sendMessage()">전송</button>
			</div>
		</div>

		<!-- 내가 보낸 메세지 예시 -->
		

	</div>
	<!-- chat body end -->
	<!-- chat input -->
	<div style="text-align: center;">
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="input-group col-lg-10">

				<!-- username  -->
				<input id="userId" class="form-control"
					placeholder="아이디를 입력해야 채팅 사용가능">

				<button id="idSelect" class="btn btn-sm btn-success">아이디 결정</button>

			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-lg-1"></div>
			<div class="input-group col-lg-10">

				<!-- 메세지 전송 버튼 -->
				<input type="text" id="msg" class="form-control"
					aria-label="Recipient's username" aria-describedby="button-addon2">

				<div class="input-group-append">
					<button class="btn btn-sm btn-info" type="button" id="button-send"
						disabled>전송</button>
				</div>

			</div>
		</div>
	</div>
	<!-- chat input end -->




	<div class="col-lg-2"></div>


	<!-- webapp 을 기준으로 하면 된다. 내 jsp파일이 어디에 있는게 중요한 것이 아니라 webapp을 기준으로 src를 작성하면 된다 -->
	<script type="text/javascript" src="asset/js/chat.js"></script>
</body>
</html>