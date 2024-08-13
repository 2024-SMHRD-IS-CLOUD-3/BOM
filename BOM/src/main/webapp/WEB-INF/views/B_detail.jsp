<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html><!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Product Page</title>
    <link rel="stylesheet" href="B_detail.css">
</head>
<body>
    <header>
        <h1>BOM</h1>
        <nav>
            <a href="#">Home</a>
            <div class="dropdown">
                <a href="#" class="active">Market</a>
                <div class="dropdown-content">
                    <a href="#">남아의류</a>
                    <a href="#">여아의류</a>
                    <a href="#">장난감류</a>
                    <a href="#">도서교구</a>
                    <a href="#">아이가구</a>
                    <a href="#">육아출산</a>
                    <a href="#">유모차</a>
                </div>
            </div>
            <a href="#">Board</a>
            <a href="#">MyPage</a>
        </nav>
    </header>

    <main>
        <div class="product-container">
            <div class="slider">
                <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
                <div class="slides">
                    <img src="../../images/img29.jpg" class="slide" alt="Product Image 1">
                    <img src="../../images/img33.jpg" class="slide" alt="Product Image 2">
                    <img src="../../images/img34.jpg" class="slide" alt="Product Image 3">
                    <img src="../../images/img35.jpg" class="slide" alt="Product Image 4">
                    <img src="../../images/img33.jpg" class="slide" alt="Product Image 5">
                </div>
                <button class="next" onclick="moveSlide(1)">&#10095;</button>
            </div>
            <div class="product-details">
                <div class="seller-info">  
                    <img src="../../images/free-icon-person-4203951.png" alt="Seller Icon" class="seller-icon">
                    <div>
                        <p class="seller-name">땅꾼</p>
                        <p class="location">남구 달동</p>
                    </div>
                </div>
                <h2>남자애옷 판매합니다</h2>
                <p class="price">15,000원</p>
                <p class="description">
                    남자애옷 팝니다.한복 외에도 많아요<br>
                    판매한 시간이 없어서 싸게 내놓습니다.<br>
                    <br>
                    필요하시면 연락주세요.<br>
                    네고 안됩니다
                </p>
            </div>
            <button class="chat-btn">채팅하기</button>
        </div>
    </main>

    <script src="market_d.js"></script>
</body>
</html>
