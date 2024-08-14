<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>이미지 업로드 폼</title>
    <link rel="stylesheet" href="writing.css">
</head>
<body>
    <header>
        <h1>BOM</h1>
        <nav>
            <a href="#">Home</a>
            <div class="dropdown">
                <a href="#" class="active">Market</a>
                <div class="dropdown-content">
                    <a href="#">남아의류</a>
                    <a href="#">여아의류</a>
                    <a href="#">장난감류</a>
                    <a href="#">도서교구</a>
                    <a href="#">아이가구</a>
                    <a href="#">육아출산</a>
                    <a href="#">유모차</a>
                </div>
            </div>
            <a href="#">Board</a>
            <a href="#">MyPage</a>
        </nav>
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

              <form id="upload-form"  action="dealWrite" method="post" enctype="multipart/form-data">
                    <label for="category">카테고리</label>
                    <select id="category" name="category">
                        <option value="유아가구">유아가구</option>
                        <option value="남아의류">남아의류</option>
                        <option value="여아의류">여아의류</option>
                        <option value="장난감류">장난감류</option>
                        <option value="도서교구">도서교구</option>
                        <option value="아이가구">아이가구</option>
                        <option value="육아출산">육아출산</option>
                        <option value="유모차">유모차</option>
                    </select>

                    <label for="title">제목</label>
                    <input type="text" id="title" name="b_title" placeholder="제목을 입력해 주세요">

                    <label for="price">가격</label>
                    <input type="text" id="price" name="how_much" placeholder="가격을 입력해 주세요">

                    <label for="description">내용</label>
                    <textarea id="description" name="b_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <div class="file-upload">
                        <input type="file" id="imageUpload" name="file" style="display: none;" onchange="loadImage(event)">
                        <label for="imageUpload" class="file-select-btn">파일선택</label>
                    </div><br>

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

      
        function goBack() {
            window.location.href = 'b_board'; // 돌아가기 버튼
        }
    </script>
</body>
</html>
