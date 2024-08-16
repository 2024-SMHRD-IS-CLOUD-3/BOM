<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BOM</title>
    <link rel="stylesheet" href="dd.css">
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
     <c:forEach items="${car}" var="deal"> 
        <section class="products" id="product-grid">
            <article class="product-card">
                <a class="card-link" href="goCarDetail?idx=${car.car_idx}">
                    <div class="image">
                        <img alt="파일 경로 확인" src="uploads/${car.file}" />
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">${car.car_title}</h2>
                        <div class="price">
                          ${car.car_price}
                        </div>
                        <div class="region">
                            ${car.car_rank}
                        </div>
                        <div class="card-counts">
                            <span class="like-counts">
                                관심 6
                            </span>
                            ∙
                            <span class="chat-counts">
                                채팅 9
                            </span>
                        </div>
                    </div>
                </a>
            </article>
        </section>
		</c:forEach>
        <a href="goCarWrite"><button class="write-btn">글 쓰기</button></a>
    </main>
    
    

    <script>


function renderProducts(deal) {
    const productGrid = document.getElementById('product-grid');
    productGrid.innerHTML = '';  // 기존 내용을 비우고 새로 추가

    products.forEach((deal, index) => {
        const productHTML = `
            <article class="product-card">
        	
        	<c:forEach items="${car}" var="car" > 
                <a class="card-link" href="goCarDetail?idx=${car.car_idx}" >
                    <div class="image">
                        <img alt="${product.title}" src="${product.image}" />
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">${product.title}</h2>
                        <div class="price">
                            ${product.price}
                        </div>
                        <div class="region">
                            ${product.region}
                        </div>
                        <div class="card-counts">
                            <span class="like-counts">
                                관심 0
                            </span>
                            ∙
                            <span class="chat-counts">
                                채팅 0
                            </span>
                        </div>
                    </div>
                </a>
                </c:forEach>
            </article>
        `;
        productGrid.innerHTML += productHTML;
    });
}
/* 
function viewProduct(index) {
    // 로컬 스토리지에 선택된 상품 인덱스를 저장
    localStorage.setItem('selectedProductIndex', index);

    // market_d.html로 이동
    window.location.href = 'market_d.html';
} */

/* 
function addProduct(product) {
    // 로컬 스토리지에서 기존 상품 목록을 불러옴
    let products = JSON.parse(localStorage.getItem('products')) || [];

    // 새로운 상품을 목록에 추가
    products.push(product);

    // 로컬 스토리지에 갱신된 상품 목록 저장
    localStorage.setItem('products', JSON.stringify(products));
 */
    // 새로운 상품만 화면에 추가
 /*    const productGrid = document.getElementById('product-grid');
    const productHTML = `
        <article class="product-card">
            <a class="card-link" href="#">
                <div class="image">
                    <img alt="${product.title}" src="${product.image}" />
                </div>
                <div class="card-desc">
                    <h2 class="card-title">${product.title}</h2>
                    <div class="price">
                        ${product.price}
                    </div>
                    <div class="region">
                        ${product.region}
                    </div>
                    <div class="card-counts">
                        <span class="like-counts">
                            관심 0
                        </span>
                        ∙
                        <span class="chat-counts">
                            채팅 0
                        </span>
                    </div>
                </div>
            </a>
        </article>
    `; 

    productGrid.innerHTML += productHTML;
}*/

    </script>
        
</body>

</html>
