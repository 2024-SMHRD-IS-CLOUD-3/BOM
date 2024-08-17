<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Post Detail</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="container">
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
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="b_board" style="padding: 10px 20px;">Market</a>
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
							</li>
						<li class="u-nav-item">
						
						<a id="car"
							class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
							href="car" style="padding: 10px 20px;">Stroller</a></li>
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
            <div class="post-detail">
                <div class="post-header">
                    <div class="author-info">
                        <div class="author-icon"></div>
                        <span class="author-name">작성자: ${post.id}</span>
                        <span class="post-date">작성일: ${post.created_at}</span>
                    </div>
                    <div class="view-count">
                        조회수: <span id="viewCount">${post.views}</span>
                    </div>
                </div>
                
                <div class="post-content">
                    <h2 id="postTitle">${post.cb_title}</h2>
                    <p style="white-space: pre-line;">${post.cb_content}</p>
                </div>
                
				<!-- If there's an attached file -->
	            <c:if test="${post.cb_file != null}">
	                <div class="post-file">
	                     <c:choose>
				            <c:when test="${post.cb_file.toLowerCase().endsWith('.jpg') || 
				            				post.cb_file.toLowerCase().endsWith('.jpeg') || 
				            				post.cb_file.toLowerCase().endsWith('.png') || 
				            				post.cb_file.toLowerCase().endsWith('.gif')}">
				                <!-- 이미지 파일일 경우 이미지를 본문에 표시 -->
				                <img src="forComm/${post.cb_file}" alt="첨부 이미지" style="max-width: 100%; height: auto;">
				            </c:when>
				            <c:otherwise>
				                <!-- 이미지가 아닌 파일은 다운로드 링크로 표시 -->
				                <p><strong>첨부파일:</strong> <a href="${uploadDir}/${post.cb_file}" download>${post.cb_file}</a></p>
				            </c:otherwise>
				        </c:choose>
	                </div>
	            </c:if>
	            
                <div class="post-footer">
                    <div class="like-comment-section">
                        <!-- <span class="like-count">좋아요 0</span> -->
                        <span class="comment-count">댓글 ${comments.size()}</span>
                    </div>
                </div>

                <div class="comment-section">
                    <div class="comment-bot-warning">클린봇이 악성 댓글을 감지합니다.</div>
                	<!-- 댓글 작성 폼 -->
				    <form action="addComment" method="POST">
				        <textarea name="ccmt_content" placeholder="댓글을 남겨보세요"></textarea>
				        <input type="hidden" name="cb_idx" value="${post.idx}">
				        <button type="submit">등록</button>
				    </form>

				    <!-- 댓글 목록 -->
				    <div class="comments">
				       <c:choose>
					        <c:when test="${empty comments}">
					            <p>댓글이 없습니다.</p>
					        </c:when>
					        <c:otherwise>
					            <c:forEach var="comment" items="${comments}">
					                <div class="comment-item">
					                    <p><strong>${comment.id}</strong>: ${comment.ccmt_content} / ${comment.created_at}</p>
					                </div>
					            </c:forEach>
					        </c:otherwise>
					    </c:choose>
				    </div>
				    
                </div>
            </div>

            <div class="back-button">
                <a href="goPostList" class="button">목록</a>
                <!-- 수정 및 삭제 버튼 -->
                <c:if test="${sessionScope.userId == post.id}">
                    <a href="editPost?idx=${post.idx}" class="button">수정</a>
                    <a href="deletePost?idx=${post.idx}" class="button" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
                </c:if>
            </div>
        </main>

        <footer>
            <p>@BOM</p>
        </footer>
    </div>
    <script>
/*         // URL에서 쿼리 파라미터를 가져오는 함수
        function getQueryParam(param) {
            let urlParams = new URLSearchParams(window.location.search);
            return urlParams.get(param);
        }

        // 페이지 로드 시, 제목을 설정
        window.onload = function() {
            let postTitle = getQueryParam('title');
            if (postTitle) {
                document.getElementById('postTitle').textContent = decodeURIComponent(postTitle);
            }
        } */
    </script>
</body>
</html>
