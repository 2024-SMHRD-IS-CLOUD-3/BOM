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
<link rel="stylesheet" href="dd.css">
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>

</head>
<body>
	 <header>
	   <div class="container">
        <a href="./" style="text-decoration: none; color: inherit;">
            <h1>BOM</h1>
        </a>
        <nav>
             <a href="./">Home</a>
            <div class="dropdown">
                <a href="b_board" class="active">Market</a>
                <div class="dropdown-content">
                     <a href="boyC">남아의류</a>
                  <a href="girlC">여아의류</a>
                  <a href="toy">장난감류</a>
                  <a href="book">도서교구</a>
                  <a href="furniture">아이가구</a>
                  <a href="newBorn">육아출산</a>
                  <a href="babyCar">유모차</a>
                </div>
            </div>
            <a href="goCarWrite">Stroller</a>
               <div class="dropdown-content">
                  <a href="boyC">유모차 판매</a>
                  <a href="girlC">유모차 구입</a>
              
                </div>
            <a href="goComm">Board</a>
            <a href="goMyPage">MyPage</a>
        </nav>
         </div>
    </header>

	<div class="container">
		<h2 align="center">프로필 수정</h2>
		<div align="right">
			<a href="goMyList"><button class="btn">뒤로가기</button></a>
		</div>

		<form action="updateProfile" method="post"
			enctype="multipart/form-data">
			<!-- 프로필 사진 변경 -->
			<div class="profile-picture-section">
				<label for="profilePicture" class="profile-label">프로필 사진 변경</label>
				<div class="profile-picture-preview">
					<img id="profileImage" src="uploads/${user.userFile}"
						alt="프로필 사진 미리보기" />
				</div>
				<input type="file" id="profilePicture" name="profilePicture"
					accept="image/*" onchange="previewProfileImage(event)">
			</div>

			<div class="input-group">
				<label for="password">비밀번호</label> <input type="password"
					id="password" name="password" placeholder="비밀번호를 입력 해주세요">
			</div>
			<div class="input-group">
				<label for="confirmPassword">비밀번호 확인</label> <input type="password"
					id="confirmPassword" name="confirmPassword"
					placeholder="비밀번호를 다시한번 입력 해주세요">
			</div>
			<div class="input-group">
				<label for="nickname">닉네임</label> <input type="text" id="nickname"
					name="nickname" placeholder="변경하실 닉네임을 입력해주세요" value="${user.name}">
			</div>
			<div class="input-group">
				<label for="phone">전화번호</label> <input type="text" id="phone"
					name="phone" placeholder="변경하실 전화번호를 입력해주세요" value="${user.phone}">
			</div>
			<div class="input-group">
				<label for="addr">주소</label> <input type="text" id="addr"
					name="addr" placeholder="변경하실 주소를 입력해주세요" value="${user.addr}">
			</div>

			<button type="submit" class="btn">완료</button>
		</form>

		<div class="map">
			<h3>위치 변경</h3>
			<div id="map"></div>
			<button class="btn" id="changeLocationBtn" style="margin-top: 10px;">내
				위치</button>
			<button class="btn" id="loadLastMarkerBtn" style="margin-top: 10px;">저장하기</button>
		</div>
	</div>

	<script>
    let map;
    let marker;
    let rememberMarker;  // 클릭한 위치 좌표를 저장할 변수

    // 지도 초기화
    async function initMap() {
        let initialPosition = new kakao.maps.LatLng(35.1076352, 126.8809728); // 초기 위치

        map = new kakao.maps.Map(document.getElementById('map'), {
            center: initialPosition,
            level: 3 // 적절한 확대 레벨 설정
        });

        marker = new kakao.maps.Marker({
            position: initialPosition,
            map: map
        });

        // 서버에서 마지막 저장된 위치 불러오기
        await loadLastMarker();

        // 지도에 클릭 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            let latlng = mouseEvent.latLng;
            
            // 좌표가 정상적인지 확인합니다
            if (latlng.getLat() >= -90 && latlng.getLat() <= 90 && latlng.getLng() >= -180 && latlng.getLng() <= 180) {
                // 마커 위치를 클릭한 위치로 옮깁니다
                marker.setPosition(latlng);

                // 클릭한 위치를 rememberMarker에 저장
                rememberMarker = latlng;
                console.log('rememberMarker 저장:', rememberMarker);
            } else {
                console.error('잘못된 좌표값입니다:', latlng);
            }
        });
    }

    // 서버에서 마지막 저장된 위치를 불러옵니다
    async function loadLastMarker() {
    try {
        const response = await fetch('get-last-location');
        const data = await response.json();

        if (data.latitude && data.longitude) {
            const lastPosition = new kakao.maps.LatLng(data.latitude, data.longitude);

            // 마커 위치를 마지막 위치로 옮깁니다
            marker.setPosition(lastPosition);
            map.setCenter(lastPosition);

            console.log('마지막 위치가 로드되었습니다:', lastPosition);
        } else {
            console.error('마지막 위치가 없습니다.');
        }
    } catch (error) {
        console.error('마지막 위치를 불러오는 중 오류 발생:', error);
    }
}


    // 저장하기 버튼 클릭 이벤트 - rememberMarker를 서버로 전송
document.getElementById('loadLastMarkerBtn').addEventListener('click', async function() {
    if (rememberMarker) {
        const latitude = rememberMarker.getLat();
        const longitude = rememberMarker.getLng();

        try {
            const response = await fetch('save-location', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: new URLSearchParams({
                    latitude: latitude,
                    longitude: longitude
                })
            });

            const result = await response.text();
            console.log(result);

            if (result === "좌표가 성공적으로 저장되었습니다.") {
                alert('위치가 성공적으로 저장되었습니다!');
            } else {
                alert('위치 저장에 실패했습니다.');
            }
        } catch (error) {
            console.error('좌표 전송 중 오류 발생:', error);
        }
    } else {
        alert('저장할 위치가 없습니다. 먼저 지도를 클릭하세요.');
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
