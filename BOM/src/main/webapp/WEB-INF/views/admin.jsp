<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자용 유모차페이지</title>
    <link rel="stylesheet" href="admin.css">
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
                        <li><a href="./">Home</a></li>
                        <li><a href="b_board">Market</a></li>
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
                     
                        <th>상태</th>
                    </tr>
                </thead>
                <tbody>
                   <c:forEach var="deal" items="${deal}">
                         <tr>
                            <td>${deal.car_idx}</td>
                            <td><a href="goWriteDetail">${deal.car_title}</a></td>
                            <td>${deal.id}</td>
                            <td>${deal.card_at}</td>
                            <td>
                               <div class="status-action">
                               <!-- id="status-${deal.car_idx} -->
                                   <select name="status" >
                                   	    <option value="신청" ${deal.car_cours == '신청' ? 'selected' : ''}>신청</option>
                                       <option value="접수" ${deal.car_cours == '접수' ? 'selected' : ''}>접수</option>
                                       <option value="심사" ${deal.car_cours == '심사' ? 'selected' : ''}>심사</option>
                                       <option value="매입" ${deal.car_cours == '매입' ? 'selected' : ''}>매입</option>
                                       <option value="거절" ${deal.car_cours == '거절' ? 'selected' : ''}>거절</option>
                                       <option value="완료" ${deal.car_cours == '완료' ? 'selected' : ''}>완료</option>
                                   </select>
                                   <button onclick="processStatus(${deal.car_idx})">처리</button>
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