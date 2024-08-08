<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>게시판 상세</title>
    <meta charset="utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="resources/assetsBoard/css/main.css" />
    <link rel="stylesheet" href="resources/assetsBoard/css/board.css" />
</head>
<body>
    <div id="deal">
        <h2>${deal.title}</h2>
        <p>작성자: ${deal.writer}</p>
        <p>작성일: ${deal.b_date}</p>
        <p>조회수: ${deal.b_view}</p>
        <p>${deal.content}</p>
        
      
        <a href="list">목록으로</a>
    </div>
    <!-- Scripts -->
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/js/jquery.scrolly.min.js"></script>
    <script src="resources/assets/js/jquery.scrollex.min.js"></script>
    <script src="resources/assets/js/skel.min.js"></script>
    <script src="resources/assets/js/util.js"></script>
    <script src="resources/assets/js/main.js"></script>
</body>
</html>
