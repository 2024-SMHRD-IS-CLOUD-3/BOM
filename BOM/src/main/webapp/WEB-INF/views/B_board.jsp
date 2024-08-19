<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>BOM</title>

<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="nicepage.css">

<link rel="stylesheet" href="dd.css">
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


						<li class="u-nav-item">
							<div class="dropdown">
								<a
									class="active"
									href="b_board" style="padding: 10px 20px;">Market</a>
								<div class="dropdown-content">
									<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
									<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
										href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
								</div>
							</div>
						</li>
						<li class="u-nav-item">
							<div class="dropdown">
						<a id="car"
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="car" style="padding: 10px 20px;">Stroller</a>
							<div class="dropdown-content">
									<a href="car">유모차 매입 신청</a> <a href="goCar">유모차 구매</a>
									
								</div>
						
						</li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goComm" style="padding: 10px 20px;">Board</a></li>
						<li class="u-nav-item"><a
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="goMyList" style="padding: 10px 20px;">MyPage</a></li>
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
									href="car">Stroller</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="goComm">Board</a></li>
								<li class="u-nav-item"><a class="u-button-style u-nav-link"
									href="goMyList">MyPage</a></li>
							</ul>
						</div>
					</div>
					<div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
				</div>
			</nav>
		</div>
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
							<div class="price">${deal.how_much}원</div>
							<div class="region">${duAddr}</div>
							<div class="card-counts">
								<span class="like-counts"> 관심 0 </span> ∙ <span
									class="chat-counts"> 채팅 0 </span>
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


// 페이지 상단으로 스크롤하는 함수
function scrollToTop() {
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// 스크롤을 감지해서 버튼의 표시 여부를 결정하는 함수
window.onscroll = function() {
    const scrollToTopBtn = document.querySelector('.scroll-to-top');
    if (document.documentElement.scrollTop > 100) {
        scrollToTopBtn.style.display = 'block'; // 스크롤이 100px 이상 내려가면 버튼 보이기
    } else {
        scrollToTopBtn.style.display = 'none';  // 상단에 있으면 버튼 숨기기
    }
};
</script>

</body>

</html>
