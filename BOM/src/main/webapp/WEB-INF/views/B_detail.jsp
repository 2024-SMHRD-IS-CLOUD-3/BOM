<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="market_d.css">
    <script type="text/javascript"
        src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f26071dc8549ac02492f1a464b072358&libraries=services"></script>
</head>

<body>

     <header>
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
    </header>

    <main>

        <!-- 돌아가기 버튼 추가 -->
        <div style="text-align: left; margin: 20px 0;">
            <form action="b_board" method="get">
                <button type="submit" class="back-btn">← 돌아가기</button>
            </form>
        </div>

        <!-- 제품 정보 및 지도 영역을 같은 컨테이너 안에 두기 -->
        <div class="product-container" style="display: flex; flex-direction: column; align-items: center;">

            <div class="product-info" style="display: flex; flex-direction: row; width: 100%; justify-content: center;">
                <!-- 이미지 슬라이드 -->
                <div class="slider" style="margin-right: 20px;">
                    <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
                    <div class="slides">
                        <img src="uploads/${yoyo.filenames}" id="product-image" class="slide" alt="Product Image">
                    </div>
                    <button class="next" onclick="moveSlide(1)">&#10095;</button>
                </div>

                <!-- 제품 상세 -->
                <div id="product-details">
                    <div class="seller-info">
                        <img src="uploads/${duInfo}" alt="Seller Icon" class="seller-icon">
                        <div>
                            <p id="seller-name">${yoyo.id}</p>
                            <p id="region">${duAddr}</p>
                        </div>
                    </div>

                    <h2 id="product-title">${yoyo.b_title}</h2>
                    <p id="product-price" class="price">${yoyo.how_much}원</p>
                    <div><p id="product-description" class="description">${yoyo.b_content}</p></div>

                    <div><a href="smessage?idx=${yoyo.b_idx}">
                        <button class="chat-btn" style="position: relative; z-index: 10;">쪽지보내기</button>
                    </a></div>
                </div>
            </div>

            <!-- 지도 추가 -->
            <div id="map" style="width:800px; height:200px; margin-top:20px;" ></div>
        </div>

    </main>

    <!-- 지도 스크립트 -->
    <script>
        // 글 작성자의 좌표를 변수에 저장합니다. JSP에서 서버 데이터를 자바스크립트 변수로 전달
        var lat = ${user.latitude != null ? user.latitude : '37.5665'}; // 기본값으로 서울 위도 설정
        var lng = ${user.longitude != null ? user.longitude : '126.9780'}; // 기본값으로 서울 경도 설정

        // 좌표가 제대로 로드되지 않은 경우 기본값 설정을 위한 안전장치 (필요시 추가)
        if (!lat || !lng) {
            lat = 37.5665; // 서울의 기본 위도
            lng = 126.9780; // 서울의 기본 경도
        }

        // 카카오맵 API를 사용하여 지도를 표시합니다.
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
            mapOption = { 
                center: new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
                level: 3 // 지도의 확대 레벨
            };

        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다.

        // 글 작성자의 위치에 마커를 표시합니다.
        var markerPosition = new kakao.maps.LatLng(lat, lng); 
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });

        // 마커가 지도 위에 표시되도록 설정합니다.
        marker.setMap(map);
        
        $(document).ready(function() {
            $.ajax({
                url: "get-last-location",
                method: "GET",
                success: function(response) {
                    console.log("좌표 응답:", response);  // 응답 확인
                    if (response && response.latitude && response.longitude) {
                        var lat = response.latitude;
                        var lng = response.longitude;

                        // 지도 생성
                        var mapContainer = document.getElementById('map');
                        var mapOption = { 
                            center: new kakao.maps.LatLng(lat, lng),
                            level: 3
                        };

                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        // 마커 생성
                        var markerPosition = new kakao.maps.LatLng(lat, lng); 
                        var marker = new kakao.maps.Marker({
                            position: markerPosition
                        });
                        marker.setMap(map);
                    } else {
                        console.error("좌표가 올바르지 않습니다.", response);
                    }
                },
                error: function(xhr, status, error) {
                    console.error("AJAX 요청 실패:", error);
                }
            });
        });

    </script>

</body>
</html>

