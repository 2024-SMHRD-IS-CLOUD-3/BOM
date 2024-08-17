<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>마이페이지</title>
<link rel="stylesheet" href="mypage.css">
</head>

<body>
	<header>
		<div class="navbar">
			<div class="logo" id="logo">BOM</div>
			<div class="nav-icons">
				<img src="./images/free-icon-bulletin-board-12094191.png"
					alt="Icon 1" class="icon" id="icon1"> <img
					src="./images/free-icon-chat-5962500.png" alt="Icon 2" class="icon"
					id="icon2"> <img
					src="./images/free-icon-baby-stroller-4080582.png" alt="Icon 3"
					class="icon" id="icon3">
				<div class="nav-icons1">
					<img src="./images/free-icon-magnifying-glass-49116.png"
						alt="Icon 4" class="icon" id="icon4"> <img
						src="./images/free-icon-person-4203951.png" alt="Icon 5"
						class="icon" id="icon5">
				</div>
			</div>
		</div>
	</header>

	<section class="profile-section">
		<div class="profile-info">
			<img src="./images/free-icon-person-4203951.png"
				class="profile-image"> <span class="username">${userName}님</span>
			<span class="favorite-heart">❤️</span>
			<button class="profile-btn" id="profileBtn">프로필 보기</button>
		</div>
	</section>

	<section class="menu-section">
		<ul class="menu-list">
			<li><a href="messageList">내 쪽지함</a></li>
			<li><a href="#favorites">관심 목록</a></li>
			<li><a href="#sales">판매 목록</a></li>
			<li><a href="#purchases">구매 목록</a></li>
			<li><a href="#board-activity">게시판 활동 내역</a></li>
			<li><a href="#stroller-trades">유모차 매매 내역</a></li>
			<li><a href="#logout">로그아웃</a></li>
			<li><a href="#delete-account">탈퇴 하기</a></li>
		</ul>
	</section>
</body>

</html>