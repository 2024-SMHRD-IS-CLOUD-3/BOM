<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>관리자용 유모차페이지</title>
<link rel="stylesheet" href="styles.css">
<link rel="stylesheet" href="index.css">
<link rel="stylesheet" href="nicepage.css">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap"
	rel="stylesheet">
	
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
	<div class="container">
		<main>
			<!-- Search bar -->
			<div class="search-bar">
				<input type="text" id="searchInput" placeholder="Search posts..."
					onkeyup="searchPosts()">
			</div>

			<!-- Table of posts -->
			<table class="board-table" id="postsTable">
				<thead>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<!-- 게시물 목록 반복 -->
					<c:forEach var="deal" items="${deal}">
						<tr>
							<td>${deal.car_idx}</td>
							<td><a href="goCarDetail?idx=${deal.car_idx}">${deal.car_title}</a></td>
							<td>${deal.id}</td>
							<td>${deal.card_at}</td>
							<td>
								<div class="status-action">
									<form action="updateStatus?idx=${deal.car_idx}" method="post">
										<select name="car_cours">
											<option value="신청"
												${deal.car_cours == '신청' ? 'selected' : ''}>신청</option>
											<option value="접수"
												${deal.car_cours == '접수' ? 'selected' : ''}>접수</option>
											<option value="심사"
												${deal.car_cours == '심사' ? 'selected' : ''}>심사</option>
											<option value="매입"
												${deal.car_cours == '매입' ? 'selected' : ''}>매입</option>
											<option value="거절"
												${deal.car_cours == '거절' ? 'selected' : ''}>거절</option>
											<option value="완료"
												${deal.car_cours == '완료' ? 'selected' : ''}>완료</option>
										</select>
										<!-- 숨겨진 필드로 car_idx 전송 -->
										<input type="hidden" name="car_idx" value="${deal.car_idx}" />
										<button type="submit">처리</button>
									</form>
								</div>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<!-- 페이징 처리 -->
			<c:if test="${totalPages > 0}">
				<div class="pagination">
					<c:if test="${currentPage > 0}">
						<a href="goComm?page=${currentPage - 1}">Previous</a>
					</c:if>

					<c:forEach begin="0" end="${totalPages - 1}" var="i">
						<c:choose>
							<c:when test="${i == currentPage}">
								<span>${i + 1}</span>
							</c:when>
							<c:otherwise>
								<a href="goComm?page=${i}">${i + 1}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>

					<c:if test="${currentPage < totalPages - 1}">
						<a href="goComm?page=${currentPage + 1}">Next</a>
					</c:if>
				</div>
			</c:if>
		</main>

		<footer>
			<p>@BOM</p>
		</footer>
	</div>

	<!-- 외부 JS 파일을 포함합니다 -->
	<script src="admin.js"></script>
</body>

</html>
