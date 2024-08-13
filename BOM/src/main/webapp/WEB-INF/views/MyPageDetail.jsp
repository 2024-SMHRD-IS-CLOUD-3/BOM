<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>프로필 수정</title>
<link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="myfageRe.css">
<link rel="stylesheet" href="index.css">
<script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js"
	defer=""></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>
<link id="u-theme-google-font" rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">

<style>
/* 지도 크기 설정 */
#map {
	width: 100%;
	height: 350px;
}
</style>
</head>
<body>
	<header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
		data-animation-name="" data-animation-duration="0"
		data-animation-delay="0" data-animation-direction="">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-align-center u-text u-text-body-alt-color u-text-1">
				<a
					class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1"
					data-href="./">BOM </a>
			</p>
			<nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
				<div class="menu-collapse u-custom-font"
					style="font-size: 1rem; letter-spacing: 0px; font-family: PretendardVariable; font-weight: 700;">
					<a
						class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base"
						href="#"> <svg class="u-svg-link" viewBox="0 0 24 24">
							<use xlink:href="#menu-hamburger"></use></svg> <svg
							class="u-svg-content" version="1.1" id="menu-hamburger"
							viewBox="0 0 16 16" x="0px" y="0px"
							xmlns:xlink="http://www.w3.org/1999/xlink"
							xmlns="http://www.w3.org/2000/svg">
							<g>
							<rect y="1" width="16" height="2"></rect>
							<rect y="7" width="16" height="2"></rect>
							<rect y="13" width="16" height="2"></rect>
</g></svg>
					</a>
				</div>
				<div class="u-custom-menu u-nav-container">
					<ul class="u-custom-font u-nav u-unstyled u-nav-1">
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="./" style="padding: 10px 20px;">Home</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="b_board" style="padding: 10px 20px;">Market</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="b_board" style="padding: 10px 20px;">Board</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goMyPage" style="padding: 10px 20px;">MyPage</a></li>
					</ul>
				</div>
				<div class="u-custom-menu u-nav-container-collapse">
					<div
						class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
						<div class="u-inner-container-layout u-sidenav-overflow">
							<div class="u-menu-close"></div>
							<ul
								class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2">
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="./">Home</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="B_board">Market</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="B_board">Board</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="goMyPage">MyPage</a></li>
							</ul>
						</div>
					</div>
					<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
				</div>
			</nav>
		</div>
	</header>

	<div class="container">
		<h2>프로필 수정</h2>
		<button class="btn">수정 완료</button>
		<form action="/updateProfile" method="post"
			enctype="multipart/form-data">
			<!-- 수정된 액션 경로 및 메서드, 파일 업로드를 위해 enctype 추가 -->
			<!-- 프로필 사진 변경 -->
			<div class="profile-picture-section">
				<label for="profilePicture" class="profile-label">프로필 사진 변경</label>
				<div class="profile-picture-preview">
					<img id="profileImage" src="default-profile.png" alt="프로필 사진 미리보기" />
					<!-- 프로필 사진 미리보기 기능 추가 -->
				</div>
				<input type="file" id="profilePicture" name="profilePicture"
					accept="image/*" onchange="previewProfileImage(event)">
				<!-- 파일 입력 추가 및 미리보기 이벤트 설정 -->
			</div>

			<div class="input-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" placeholder="비밀번호를 입력 해주세요">
				<!-- 비밀번호 입력 필드 추가 -->
			</div>
			<div class="input-group">
				<label for="confirmPassword">비밀번호 확인</label> <input type="password"
					id="confirmPassword" name="confirmPassword"
					placeholder="비밀번호를 다시한번 입력 해주세요">
				<!-- 비밀번호 확인 입력 필드 추가 -->
			</div>
			<div class="input-group">
				<label for="email">이메일</label> <input type="email" id="email"
					name="email" placeholder="변경하실 이메일을 입력해주세요">
				<!-- 이메일 입력 필드 추가 -->
			</div>
			<div class="input-group">
				<label for="nickname">닉네임</label> <input type="text" id="nickname"
					name="nickname" placeholder="변경하실 닉네임을 입력해주세요">
				<!-- 닉네임 입력 필드 추가 -->
			</div>

			<button type="submit" class="btn">완료</button>
			<!-- 제출 버튼 추가 -->
		</form>


		<div class="map">
			<h3>위치 변경</h3>
			<div id="map"></div>
			<button class="btn" id="changeLocationBtn" style="margin-top: 10px;">내
				위치</button>
			<button class="btn" id="changeLocationBtn2" style="margin-top: 10px;">지도
				검색</button>
		</div>
	</div>

	<script>
		let map;
		let marker;
		let currentPosition;
		let rememberMarker; // 클릭한 마커의 위치를 저장할 변수

		// 지도 초기화

		function initMap() {
			let initialPosition = new kakao.maps.LatLng(35.1076352, 126.8809728); // 초기 위치

			map = new kakao.maps.Map(document.getElementById('map'), {
				center : initialPosition,
				level : 3
			// 지도의 확대 레벨
			});

			marker = new kakao.maps.Marker({
				position : initialPosition,
				map : map
			});

			currentPosition = initialPosition;

			// 지도에 클릭 이벤트를 등록합니다
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
				// 클릭한 위도, 경도 정보를 가져옵니다 
				let latlng = mouseEvent.latLng;

				// 마커 위치를 클릭한 위치로 옮깁니다
				marker.setPosition(latlng);

				// 클릭한 위치의 좌표를 변수에 저장합니다
				rememberMarker = latlng;

				// 사용자가 좌표를 볼 필요가 없으므로, 출력 부분을 제거합니다
			});
		}

		// 내 위치 버튼 클릭 이벤트
		document.getElementById('changeLocationBtn').addEventListener(
				'click',
				function() {
					if (navigator.geolocation) {
						navigator.geolocation.getCurrentPosition(function(
								position) {
							let newPosition = new kakao.maps.LatLng(
									position.coords.latitude,
									position.coords.longitude);

							map.setCenter(newPosition);
							marker.setPosition(newPosition);
							currentPosition = newPosition;

							console.log('현재 위치:', currentPosition);
						}, function() {
							alert('위치를 가져올 수 없습니다.');
						});
					} else {
						alert('이 브라우저에서는 Geolocation이 지원되지 않습니다.');
					}
				});

		// 페이지 로드 후 지도 초기화
		window.onload = initMap;
	</script>

	<script>
		// 프로필 사진 미리보기 기능
		function previewProfileImage(event) {
			const reader = new FileReader();
			reader.onload = function() {
				const output = document.getElementById('profileImage');
				output.src = reader.result;
			};
			reader.readAsDataURL(event.target.files[0]);
		}
	</script>
</body>
</html>
