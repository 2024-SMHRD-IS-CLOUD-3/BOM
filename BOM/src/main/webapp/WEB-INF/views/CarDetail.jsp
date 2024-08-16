<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="market_d.css">
</head>

<body>

    <header>
        <h1>BOM</h1>
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
                  <a href="car_main">유모차</a>
                </div>
            </div>
            <a href="goComm">Board</a>
            <a href="goMyPage">MyPage</a>
        </nav>
    </header>

    <main>
  
        <!-- 돌아가기 버튼 추가 -->
        <div style="text-align: left; margin: 20px 0;" >
        <form action="car_main" method="get">
            <button type="submit" class="back-btn">← 돌아가기</button>
        </form>
        </div>        
            <div class="product-container">
                <div class="slider">
                
                    <!-- <button class="prev" onclick="moveSlide(-1)">&#10094;</button> -->
                    <div class="slides">
                        <!-- 이미지 슬라이드가 필요한 경우 이곳에 이미지를 추가할 수 있습니다. -->
                        <img src="babyCar/${car.file}" id="product-image" class="slide" alt="Product Image">
                    </div>
                    <!-- <button class="next" onclick="moveSlide(1)">&#10095;</button> -->
                </div>
                <div class="product-details">
                    <div class="seller-info">
                        <img src="${duInfo}" alt="Seller Icon" class="seller-icon">
                        <div>
                            <p class="seller-name">test(관리자)</p>
                            <p class="region"></p>
                        </div>
                    </div>
                    <h2 id="product-title">${car.car_title}</h2>
                    <p id="product-price" class="price">${car.price}원</p>
                    <p id="product-description" class="description">
                        ${car.car_content}
                    </p>
                </div>
               
                <a href="goChat?idx=${car.car_idx}"> <button class="chat-btn">채팅하기</button></a>
           	
            </div>
              
    </main>


    </script>
   <!--  <script src="market_d.js"></script> -->
</body>

</html>