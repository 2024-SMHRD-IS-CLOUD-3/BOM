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
            <div class="dropdown">
				<a href="car"
					class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1">
					Stroller</a>
				<div class="dropdown-content">
					<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>

				</div>
			</div>
            <a href="car">Stroller</a>
            <a href="goComm">Board</a>
            <a href="goMyPage">MyPage</a>
        </nav>
    </header>

    <main>
  
        <!-- 돌아가기 버튼 추가 -->
        <div style="text-align: left; margin: 20px 0;" >
        <form action="b_board" method="get">
            <button type="submit" class="back-btn">← 돌아가기</button>
        </form>
        </div>        
            <div class="product-container">
                <div class="slider">
                    <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
                    <div class="slides">
                        <!-- 이미지 슬라이드가 필요한 경우 이곳에 이미지를 추가할 수 있습니다. -->
                        <img src="uploads/${yoyo.filenames}" id="product-image" class="slide" alt="Product Image">
                    </div>
                    <button class="next" onclick="moveSlide(1)">&#10095;</button>
                </div>
                <div class="product-details">
                    <div class="seller-info">
                        <img src="uploads/${duInfo}" alt="Seller Icon" class="seller-icon">
                        <div>
                            <p class="seller-name">${yoyo.id}</p>
                            <p class="region">${duAddr}</p>
                        </div>
                        <div class="seller-buttons">
                       <a href="dealModify?idx=${yoyo.b_idx}"> <button class="change-btn">수정하기</button></a>
                        <a href="goDelete?idx=${yoyo.b_idx}"><button class="del-btn">삭제하기</button></a>
                    </div>
                        
                    </div>
                    
                    <h2 id="product-title">${yoyo.b_title}</h2>
                    <p id="product-price" class="price">${yoyo.how_much}원</p>
                    <p id="product-description" class="description">
                        ${yoyo.b_content}
                    </p>
                </div>
               
                <a href="goChat?idx=${yoyo.b_idx}"> <button class="chat-btn">쪽지보내기</button></a>
           	
            </div>
              
    </main>


    </script>
   <!--  <script src="market_d.js"></script> -->
</body>

</html>