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
            <a href="#" class="nav-link">Home</a>
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
            <a href="#" class="nav-link">Board</a>
            <a href="#" class="nav-link">MyPage</a>
        </nav>
    </header>

    <main>
        <section class="products" id="product-grid">
     <c:forEach items="${deal}" var="deal"> 
            <article class="product-card">
                <a class="card-link" href="goDetail?idx=${deal.b_idx}">
                    <div class="image">
                        <img alt="파일 경로 확인" src="uploads/${deal.filenames}" />
                    </div>
                    <div class="card-desc">
                        <h2 class="card-title">${deal.b_title}</h2>
                        <div class="price">
                            ${deal.how_much}
                        </div>
                        <div class="region">
                            ${duAddr}
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
		</c:forEach>
        </section>
        <a href="goWrite"><button class="write-btn">글 쓰기</button></a>
        <button class="scroll-to-top" onclick="scrollToTop()">↑</button>
    </main>
    
    

    <script>
/* document.addEventListener("DOMContentLoaded", function() {
    // 로컬 스토리지에서 모든 상품 데이터를 불러옴
    let products = JSON.parse(localStorage.getItem('products')) || [];

    // 모든 상품을 화면에 추가
    renderProducts(products);
}); */

function renderProducts(deal) {
    const productGrid = document.getElementById('product-grid');
    productGrid.innerHTML = '';  // 기존 내용을 비우고 새로 추가

    products.forEach((deal, index) => {
        const productHTML = `
            <article class="product-card">
        	/* onclick="viewProduct(${index})" */
        	<c:forEach items="${deal}" var="deal" > 
                <a class="card-link" href="goDetail?idx=${deal.b_idx}" >
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

function scrollToTop() {
    window.scrollTo({
        top: 0,
        behavior: 'smooth' // 부드럽게 스크롤
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
