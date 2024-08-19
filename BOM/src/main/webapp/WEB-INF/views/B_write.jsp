<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>중고거래 게시글 작성</title>
<link rel="stylesheet" href="writing.css">
</head>
<body>
	<header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
		data-animation-name="" data-animation-duration="0"
		data-animation-delay="0" data-animation-direction="">
		<div class="u-clearfix u-sheet u-sheet-1">
			<p class="u-align-center u-text u-text-body-alt-color u-text-1">
				<a
					class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1"
					href="./">BOM </a>
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
									class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
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
			</nav>
		</div>
	</header>

		<main>
		<div style="text-align: left; margin-top: 20px;">
			<button onclick="goBack()" class="back-btn">← 돌아가기</button>
		</div>
		<div class="upload-container">
			<div class="image-preview">
				<img src="image-placeholder.png" id="preview" alt="Image Preview">
			</div>
			<div class="form-container">

				<form id="upload-form" action="dealWrite" method="post"
					enctype="multipart/form-data">
					<label for="category">카테고리</label> <select id="category"
						name="category">

						<option value="남아의류">남아의류</option>
						<option value="여아의류">여아의류</option>
						<option value="장난감류">장난감류</option>
						<option value="도서교구">도서교구</option>
						<option value="아이가구">아이가구</option>
						<option value="육아출산">육아출산</option>
						<option value="유모차">유모차</option>
					</select> <label for="title">제목</label> <input type="text" id="title"
						name="b_title" placeholder="제목을 입력해 주세요"> <label
						for="price">가격</label> <input type="text" id="price"
						name="how_much" placeholder="가격을 입력해 주세요"> <label
						for="description">내용</label>
					<textarea id="description" name="b_content" rows="5"
						placeholder="게시글 내용을 작성해주세요."></textarea>

					<div class="file-upload">
						<input type="file" id="imageUpload" name="file" multiple
							style="display: none;" onchange="loadImage(event)"> <label
							for="imageUpload" class="file-select-btn">파일선택</label>
					</div>
					<br>

					<button type="submit" class="submit-btn">완료</button>
				</form>
			</div>
		</div>
	</main>

	<script>
    
    function loadImage(event) {
        const imagePreview = document.getElementById('preview');
        imagePreview.src = URL.createObjectURL(event.target.files[0]);
        imagePreview.onload = function() {
            URL.revokeObjectURL(imagePreview.src);
        }
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