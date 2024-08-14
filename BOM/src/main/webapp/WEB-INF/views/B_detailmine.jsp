<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>
<html lang="ko" xmlns:th="http://www.thymeleaf.org">>
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
     <c:forEach items="${deal}" var="deal"> 
        <div class="product-container">
            <div class="slider">
            
                <div class="slides">
                    <img src="uploads/${deal.filenames}" class="slide" alt="Product Image 1">
              
                </div>
          
            </div>
            <div class="product-details">
                <div class="seller-info">  
                    <img src="${duInfo}" alt="개인정보설정이미지" class="seller-icon">
                 
                    <div>
                        <p class="seller-name">${deal.id}</p>
                        </c:forEach>
                         
                        <p class="location">주소 ${duAddr} </p>
                         
               
                             <c:forEach items="${deal}" var="deal" > 
                    </div>
                </div>
                <h2>${deal.b_title}</h2>
                <p class="price">${deal.how_much}</p>
                <p class="description">
                    ${deal.b_content}
                </p>
            </div>
           <a href="goChat"> <button class="chat-btn">채팅하기</button></a>
        </div>
         </c:forEach>
    </main>

    <script src="B_detail.js"></script>
</body>
</html>
