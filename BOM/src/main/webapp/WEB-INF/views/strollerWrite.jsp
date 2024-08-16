<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>매입</title>
    <link rel="stylesheet" href="strollerSales.css">
   
</head>
<body>
    <header>
        <h1>BOM</h1>
        <nav>
             <a href="./">Home</a>
            <div class="dropdown">
                <a href="b_board" class="active">Market</a>
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
            <a href="goComm">Board</a>
            <a href="goMyPage">MyPage</a>
        </nav>
    </header>

    <main>
        <div class="upload-container">
            <div class="image-preview">
                <img src="image-placeholder.png" id="preview" alt="Image Preview">
            </div>
            <div class="form-container">
                <form action="carWrite" method="POST" enctype="multipart/form-data">
                       <label for="category">카테고리</label>
                    <select id="category" name="category" >
                       
                        <option value="유모차매입">유모차</option>
                        
                      
                    </select>
                    
                    <label for="title">제목</label>
                    <input type="text" id="title" name="b_title" placeholder="제목을 입력해 주세요!">
                    
                    <label for="price">희망가격</label>
                    <input type="text" id="price" name="how_much" placeholder="희망하시는 가격을 제시해주세요!"  >
             
                    <label for="content">내용</label>
                    <textarea id="content" name="b_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <div class="file-upload">
                       <input type="file" id="imageUpload" name="file" style="display: none;" onchange="loadImage(event)">
                        <label for="imageUpload" class="file-select-btn">사진선택</label>           
                    </div><br>
                    <button type="submit" class="submit-btn">매입 신청하기</button>
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
     </script>
  <!--   <script>
         function formatPrice(input) {
        // 숫자만 허용하고, 천 단위 구분 기호 추가
        let value = input.value.replace(/[^0-9]/g, ''); // 숫자만 남김
        if (value) {
            value = Number(value).toLocaleString(); // 천 단위 구분 기호 추가
        }
        /* input.value = value + ' 원'; // '원' 추가 */
    }
        document.addEventListener('DOMContentLoaded', function () {
            const fileInput = document.getElementById('imageUpload');
            const imagePreview = document.getElementById('preview');

            fileInput.addEventListener('change', function () {
                const file = fileInput.files[0];

                if (file) {
                    const reader = new FileReader();

                    reader.onload = function (event) {
                        imagePreview.src = event.target.result;
                        imagePreview.style.display = 'block';
                    };

                    reader.readAsDataURL(file);
                } else {
                    imagePreview.src = 'image-placeholder.png';
                    imagePreview.style.display = 'none';
                }
            });
        });
    </script> -->

</body>
</html>