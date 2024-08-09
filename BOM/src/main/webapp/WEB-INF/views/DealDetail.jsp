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
<table id="list">
					<tr>
						<td>제목</td>
						<td>${deal.b_title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${dlea.id}</td>
					</tr>
					<tr>
						<td colspan="2">내용</td>
					</tr>
					<tr>
						<td colspan="2">
							<td>${deal.b_content}</td>
							
						</td>
					</tr>
					<tr><<td colspan="2"></td>
							<td>
						<c:if test="${not empty deal.filenames}">
                    <c:forEach var="filename" items="${deal.filenames}">
                        <img src="/bompj/save/${filename}" alt="Image" style="max-width: 100%; height: auto; margin: 10px;" />
                    </c:forEach>
                </c:if></td>
					</tr>
					<tr>
						<td colspan="2"><a href="list"><button>뒤로가기</button></a>
						<a href="dealModify?idx=${deal.idx}"><button>수정하기</button></button></a></td>

					</tr>
				</table>
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
