<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
    <title>거래 게시판</title>
    <meta charset="UTF-8">
</head>
<body>        
    <div id="deal">
        <table id="list">
            <tr>
                <td>번호</td>
                <td>제목</td>
                <td>작성자</td>
                <td>시간</td>
                <td>조회수</td>
                <td>삭제</td>
            </tr>
            <c:forEach items="${list}" var="deal" varStatus="i"> 
                <tr>
                    <td>${i.b_view}</td>
                    <td><a href="goDetail?idx=${deal.idx}">${deal.title}</a></td>
                    <td>${deal.writer}</td>
                    <td>${deal.b_date}</td>
                    <td>${deal.count}</td>
                    <td><a href="goDelete?idx=${deal.idx}">삭제</a></td>
                </tr>
            </c:forEach>
        </table>
        <a href="goWrite"><button id="writer">작성하러가기</button></a>
    </div>
    <!-- Scripts -->
  
</body>
</html>
