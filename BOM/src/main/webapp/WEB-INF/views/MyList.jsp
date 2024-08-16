<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>사용자 프로필</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="MyList.css">
    <link rel="stylesheet" href="index.css">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
<script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
</head>

<body>
 <header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc"
      data-animation-name="" data-animation-duration="0"
      data-animation-delay="0" data-animation-direction="">
      <div class="u-clearfix u-sheet u-sheet-1">
         <p class="u-align-center u-text u-text-body-alt-color u-text-1">
            <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font u-hover-none u-none u-text-body-alt-color u-btn-1" data-href="./">BOM </a>
         </p>
         <nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
            <!-- Navigation content here -->
         </nav>
      </div>
      <div class="u-custom-menu u-nav-container">
               <ul class="u-custom-font u-nav u-unstyled u-nav-1">
                  <li class="u-nav-item"><a
                     class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
                     href="./" style="padding: 10px 20px;">Home</a></li>
                  <li class="u-nav-item"><a
                     class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
                     href="b_board" style="padding: 10px 20px;">Market</a></li>
                  <li class="u-nav-item"><a
                     class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
                     href="goComm" style="padding: 10px 20px;">Board</a></li>
                  <li class="u-nav-item"><a
                     class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1"
                     href="goMyPage" style="padding: 10px 20px;">MyPage</a></li>
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
                           href="goComm">Board</a></li>
                        <li class="u-nav-item"><a class="u-button-style u-nav-link"
                           href="goMyPage">MyPage</a></li>
                     </ul>
                  </div>
               </div>
               <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
            </div>
      
   </header>

    <section class="profile-section">
        <div class="profile-info">
            <img src="uploads/${user.userFile}" class="profile-image">
            <span class="username">${user.name}</span>
            <span class="favorite-heart">❤️</span><span class="faborite-score">${user.score}</span>
            <a href="goMyPage"><button class="profile-btn" id="profileBtn">프로필 보기</button></a>
        </div>
    </section>

    <section class="menu-section">
        <ul class="menu-list">
            <li><a href="#favorites">관심 목록</a></li>
            <li><a href="#sales">판매 목록</a></li>
            <li><a href="#purchases">구매 목록</a></li>
            <li><a href="#board-activity">게시판 활동 내역</a></li>
            <li><a href="#stroller-trades">유모차 매매 내역</a></li>
            <li><a href="logout">로그아웃</a></li>
            <li><a href="exit">탈퇴 하기</a></li>
        </ul>
    </section>
</body>

</html>
