<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 글쓰기</title>
    <link rel="stylesheet" href="writing.css">
</head>
<body>
    <header>
        <h1>BOM</h1>
        <nav>
            <a href="/">Home</a>
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
                <form action="commContent" method="POST" enctype="multipart/form-data">

                    <label for="title">제목</label>
                    <input type="text" id="title" name="cb_title" placeholder="제목을 입력해 주세요">
                    
                    <label for="writer">작성자</label>
                    <input type="text" name="id" value="<%=session.getAttribute("userId") %>" placeholder="제목을 입력해 주세요" required readonly>

                    <label for="description">내용</label>
                    <textarea id="description" name="cb_content" rows="5" placeholder="게시글 내용을 작성해주세요."></textarea>

                    <div class="file-upload">
                        <input type="file" id="imageUpload" name="cb_file" accept="image/*" style="display: none;">
                        <label for="imageUpload" class="file-select-btn">파일선택</label>           
                    </div><br>
                    <button type="submit" class="submit-btn">작성</button>
                </form>
            </div>
        </div>
    </main>
    <script>
	    document.addEventListener('DOMContentLoaded', function () {
	        const fileInput = document.getElementById('imageUpload');
	        const imagePreview = document.getElementById('preview');
	
	        fileInput.addEventListener('change', function () {
	            const file = fileInput.files[0]; // 첫 번째 파일을 선택합니다.
	
	            if (file) {
	                const reader = new FileReader();
	
	                reader.onload = function (event) {
	                    imagePreview.src = event.target.result; // 파일의 데이터를 이미지의 src에 설정합니다.
	                    imagePreview.style.display = 'block'; // 이미지가 표시되도록 합니다.
	                };
	
	                reader.readAsDataURL(file); // 파일을 Data URL로 읽습니다.
	            } else {
	                imagePreview.src = 'image-placeholder.png'; // 파일이 없으면 기본 이미지로 설정합니다.
	                imagePreview.style.display = 'none'; // 이미지가 없을 때는 숨깁니다.
	            }
	        });
	    });
    </script>
    <script src="writing.js"></script>
</body>
</html>
