<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html style="font-size: 16px;" lang="en"><head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <title>B_board</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
<link rel="stylesheet" href="B_board.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 6.15.2, nicepage.com">
    
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,500,500i,600,600i,700,700i,800,800i">
    
    
    
    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="B_board">
    <meta property="og:type" content="website">
  <meta data-intl-tel-input-cdn-path="intlTelInput/"></head>
  <body data-path-to-root="./" data-include-products="true" class="u-body u-xl-mode" data-lang="en"><header class="u-clearfix u-gradient u-header u-header" id="sec-b9bc" data-animation-name="" data-animation-duration="0" data-animation-delay="0" data-animation-direction=""><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-align-center u-text u-text-body-alt-color u-text-1">
          <a class="u-active-none u-border-none u-btn u-button-link u-button-style u-custom-font	 u-hover-none u-none u-text-body-alt-color u-btn-1" data-href="./">BOM </a>
        </p>
        <nav class="u-menu u-menu-one-level u-offcanvas u-menu-1">
          <div class="menu-collapse u-custom-font" style="font-size: 1rem; letter-spacing: 0px; font-family: PretendardVariable; font-weight: 700;">
            <a class="u-button-style u-custom-left-right-menu-spacing u-custom-padding-bottom u-custom-text-active-color u-custom-text-color u-custom-text-hover-color u-custom-top-bottom-menu-spacing u-nav-link u-text-active-palette-1-base u-text-hover-palette-2-base" href="#">
              <svg class="u-svg-link" viewBox="0 0 24 24"><use xlink:href="#menu-hamburger"></use></svg>
              <svg class="u-svg-content" version="1.1" id="menu-hamburger" viewBox="0 0 16 16" x="0px" y="0px" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns="http://www.w3.org/2000/svg"><g><rect y="1" width="16" height="2"></rect><rect y="7" width="16" height="2"></rect><rect y="13" width="16" height="2"></rect>
</g></svg>
            </a>
          </div>
          <div class="u-custom-menu u-nav-container">
            <ul class="u-custom-font u-nav u-unstyled u-nav-1"><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1" href="./" style="padding: 10px 20px;">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1" href="goB_board" style="padding: 10px 20px;">Market</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1" href="goB_board" style="padding: 10px 20px;">Board</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link u-text-active-custom-color-6 u-text-black u-text-hover-custom-color-1" href="goLogin" style="padding: 10px 20px;">MyPage</a>
</li></ul>
          </div>
          <div class="u-custom-menu u-nav-container-collapse">
            <div class="u-black u-container-style u-inner-container-layout u-opacity u-opacity-95 u-sidenav">
              <div class="u-inner-container-layout u-sidenav-overflow">
                <div class="u-menu-close"></div>
                <ul class="u-align-center u-nav u-popupmenu-items u-unstyled u-nav-2"><li class="u-nav-item"><a class="u-button-style u-nav-link" href="./">Home</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="goB_board">Market</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="goB_board">Board</a>
</li><li class="u-nav-item"><a class="u-button-style u-nav-link" href="goLogin">MyPage</a>
</li></ul>
              </div>
            </div>
            <div class="u-black u-menu-overlay u-opacity u-opacity-70"></div>
          </div>
        </nav>
      </div></header>
    <section class="u-clearfix u-grey-15 u-section-1" id="sec-ee33">
      <div class="u-clearfix u-sheet u-sheet-1">
        <div class="u-border-2 u-border-grey-30 u-container-style u-group u-group-1" data-href="#">
          <div class="u-container-layout u-valign-bottom u-container-layout-1">
            
            <img class="u-image u-image-contain u-image-default u-preserve-proportions u-image-1" src="/save/${filename}" alt="" data-image-width="512" data-image-height="512">
            <h3 class="u-custom-font u-text u-text-default u-text-1">${deal.b_title}</h3>
            <h6 class="u-custom-font u-text u-text-default u-text-2">${deal.how_much}<span style="font-size: 1.125rem;"></span>
            </h6>
            <p class="u-custom-font u-text u-text-default u-text-3">조회수 ${deal.b_views}/ 관심 ♡ </p>
          </div>
        </div>
        <a href="goWrite" class="u-btn u-button-style u-custom-color-1 u-hover-custom-color-7 u-btn-1">글 쓰기 </a>
      </div>
    </section>
    
    
    
    <footer class="u-align-center u-clearfix u-footer u-grey-10 u-footer" id="sec-199d"><div class="u-clearfix u-sheet u-sheet-1">
        <p class="u-custom-font u-small-text u-text u-text-variant u-text-1">광주 서구 송암로 60 2층 6교육관<br>고객센터 담당자 채수민 
        </p>
      </div></footer>
    <section class="u-backlink u-clearfix u-grey-80">
      <p class="u-text">
        <span>This site was created with the </span>
        <a class="u-link" href="https://nicepage.com/" target="_blank" rel="nofollow">
          <span>Nicepage</span>
        </a>
      </p>
    </section>
  
</body></html>