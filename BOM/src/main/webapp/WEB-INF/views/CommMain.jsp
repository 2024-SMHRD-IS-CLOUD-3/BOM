<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Community Board</title>
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
</head>

<body>
    <div class="container">
        <header>
            <div class="header-container">
                <nav class="main-nav">
                    <div class="logo">
                        <h1>BOM</h1>
                    </div>
                </nav>
                <nav class="main-nav">
                    <ul>
                        <li><a href="/">Home</a></li>
                        <li><a href="#">Market</a></li>
                        <li><a href="goComm">Board</a></li>
                        <li><a href="goMyPage">MyPage</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <!-- Search bar -->
            <div class="search-bar">
                <input type="text" id="searchInput" placeholder="Search posts..." onkeyup="searchPosts()">
            </div>

            <!-- Table of posts -->
            <table class="board-table" id="postsTable">
                <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일</th>
                        <th>조회</th>
                    </tr>
                </thead>
                <tbody>
                	<c:forEach var="post" items="${posts}">
	                		<tr>
		                		<td>${post.cb_idx}</td>
		                		<td><a href="goWriteDetail">${post.cb_title}</a></td>
		                		<td>${post.id}</td>
		                		<td>${post.created_at}</td>
		                		<td>${post.cb_views}</td>
	                		</tr>
                	</c:forEach>
                </tbody>
				
            </table>
            <div class="pagination">
                <a href="#">&laquo;</a>
                <a href="#" class="active">1</a>
                <a href="#">2</a>
                <a href="#">3</a>
                <a href="#">4</a>
                <a href="#">5</a>
                <a href="#">6</a>
                <a href="#">7</a>
                <a href="#">8</a>
                <a href="#">9</a>
                <a href="#">10</a>
                <a href="#">&raquo;</a>
            </div>
        </main>
        <footer>
            <p>@BOM</p>
        </footer>
    </div>
    <script src="script.js"></script>
</body>

</html>