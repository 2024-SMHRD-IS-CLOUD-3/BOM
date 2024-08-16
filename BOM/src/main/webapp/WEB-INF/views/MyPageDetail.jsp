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
<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>

</head>
<body>
   <header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
      data-animation-name="" data-animation-duration="0"
      data-animation-delay="0" data-animation-direction="">
      <div class="u-clearfix u-sheet u-sheet-1">
         <p class="u-align-center u-text u-text-body-alt-color u-text-1">
            <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1" data-href="./">BOM </a>
         </p>
         <nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
            <!-- Navigation content here -->
         </nav>
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
                     href="goComm" style="padding: 10px 20px;">Board</a></li>
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
                           href="b_board">Market</a></li>
                        <li class="u-nav-item"><a class="u-button-style u-nav-link"
                           href="goComm">Board</a></li>
                        <li class="u-nav-item"><a class="u-button-style u-nav-link"
                           href="goMyPage">MyPage</a></li>
                     </ul>
                  </div>
               </div>
               <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>
      
   </header>

   <div class="container">
      <h2 align="center">프로필 수정</h2>
      <div align="right"><a href="goMyList" ><button class="btn">내가 쓴 똥</button></a></div>
      
      <form action="updateProfile" method="post" enctype="multipart/form-data">
         <!-- 프로필 사진 변경 -->
         <div class="profile-picture-section">
            <label for="profilePicture" class="profile-label">프로필 사진 변경</label>
            <div class="profile-picture-preview">
               <img id="profileImage" src="uploads/${user.userFile}" alt="프로필 사진 미리보기" />
            </div>
            <input type="file" id="profilePicture" name="profilePicture" accept="image/*" onchange="previewProfileImage(event)">
         </div>

         <div class="input-group">
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="비밀번호를 입력 해주세요">
         </div>
         <div class="input-group">
            <label for="confirmPassword">비밀번호 확인</label>
            <input type="password" id="confirmPassword" name="confirmPassword" placeholder="비밀번호를 다시한번 입력 해주세요">
         </div>
         <div class="input-group">
            <label for="nickname">닉네임</label>
            <input type="text" id="nickname" name="nickname" placeholder="변경하실 닉네임을 입력해주세요" value="${user.name}">
         </div>
         <div class="input-group">
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" placeholder="변경하실 전화번호를 입력해주세요" value="${user.phone}">
         </div>
         <div class="input-group">
            <label for="addr">주소</label>
            <input type="text" id="addr" name="addr" placeholder="변경하실 주소를 입력해주세요" value="${user.addr}">
         </div>

         <button type="submit" class="btn">완료</button>
      </form>

      <div class="map">
         <h3>위치 변경</h3>
         <div id="map"></div>
         <button class="btn" id="changeLocationBtn" style="margin-top: 10px;">내 위치</button>
         <button class="btn" id="loadLastMarkerBtn" style="margin-top: 10px;">불러오기</button>
      </div>
   </div>
   
    <script>
    let map;
    let marker;
    let currentPosition;

    // 지도 초기화
    async function initMap() {
        let initialPosition = new kakao.maps.LatLng(35.1076352, 126.8809728); // 초기 위치

        map = new kakao.maps.Map(document.getElementById('map'), {
            center: initialPosition,
            level: 3 // 지도의 확대 레벨
        });

        marker = new kakao.maps.Marker({
            position: initialPosition,
            map: map
        });

        currentPosition = initialPosition;

        // 지도에 클릭 이벤트를 등록합니다
        kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
            // 클릭한 위도, 경도 정보를 가져옵니다 
            let latlng = mouseEvent.latLng;
            
            // 마커 위치를 클릭한 위치로 옮깁니다
            marker.setPosition(latlng);

            // 클릭한 위치의 좌표를 실시간으로 서버에 전송합니다
            const markerData = `${latlng.getLat()},${latlng.getLng()}`; // 좌표를 문자열로 변환

            const data = {
                marker: markerData // 좌표 데이터를 marker 컬럼에 맞게 보냅니다.
            };

            // 좌표를 서버로 실시간 전송
            fetch('/save-location', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(data)
            })
            .then(response => response.json())
            .then(result => {
                if (result.success) {
                    console.log('좌표가 성공적으로 저장되었습니다.');
                } else {
                    console.error('좌표 저장에 실패했습니다.');
                }
            })
            .catch(error => {
                console.error('좌표 전송 중 오류 발생:', error);
            });
        });
    }

    // 서버에서 마지막 클릭한 위치를 불러옵니다.
    async function loadLastMarker() {
        try {
            const response = await fetch('/get-last-location');
            const data = await response.json();

            if (data.marker) {
                const [lat, lng] = data.marker.split(',').map(Number); // 좌표를 분리하고 숫자로 변환
                let lastPosition = new kakao.maps.LatLng(lat, lng);

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

    // 내 위치 버튼 클릭 이벤트
    document.getElementById('changeLocationBtn').addEventListener('click', function() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function(position) {
                let newPosition = new kakao.maps.LatLng(position.coords.latitude, position.coords.longitude);

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

    // 불러오기 버튼 클릭 이벤트
    document.getElementById('loadLastMarkerBtn').addEventListener('click', function() {
        loadLastMarker(); // 마지막 위치를 불러오는 함수 호출
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
