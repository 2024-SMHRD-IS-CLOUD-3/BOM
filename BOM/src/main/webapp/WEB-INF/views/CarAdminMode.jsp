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
			<a href="./">Home</a>
			<div class="dropdown">
				<a href="b_board" class="active">Market</a>
				<div class="dropdown-content">
					<a href="boyC">남아의류</a> <a href="girlC">여아의류</a> <a href="toy">장난감류</a>
					<a href="book">도서교구</a> <a href="furniture">아이가구</a> <a
						href="newBorn">육아출산</a> <a href="babyCar">유모차</a>
				</div>
			</div>
			<a href="car">Stroller</a> <a href="goComm">Board</a> <a
				href="goMyPage">MyPage</a>
		</nav>
	</header>

	<main>
		<div style="text-align: left; margin-top: 20px;">
			<button onclick="goBack()" class="back-btn">← 돌아가기</button>
		</div>
		<div class="upload-container">
			<div class="image-preview">
				<img src="${empty file ? 'uploads/KakaoTalk_20240817_110031317.png' : file }" id="preview" alt="Image Preview">
			
			</div>
			<div class="form-container">

				<form id="upload-form" action="adminWrite?idx=${deal.car_idx}"
					method="post" enctype="multipart/form-data">
				
					</select> 
					<label for="title">제목</label> 
					<input type="text" id="title"
						name="car_title"
						value="${empty deal.car_title ? '제목을 입력하세요. ': deal.car_title}">
					<label for="car_rank">rank</label>
					 <select id="category"
						name="car_rank">

						<option value="S">S급</option>
						<option value="A">A급</option>
						<option value="B">B급</option>
					
					</select>
					<label for="car_cours">cours</label>
					<select name="car_cours">
											<option value="신청" ${deal.car_cours == '신청' ? 'selected' : ''}>신청</option>
											<option value="접수" ${deal.car_cours == '접수' ? 'selected' : ''}>접수</option>
											<option value="심사" ${deal.car_cours == '심사' ? 'selected' : ''}>심사</option>
											<option value="매입" ${deal.car_cours == '매입' ? 'selected' : ''}>매입</option>
											<option value="거절" ${deal.car_cours == '거절' ? 'selected' : ''}>거절</option>
											<option value="완료" ${deal.car_cours == '완료' ? 'selected' : ''}>완료</option>
										</select>
										
										
					<label for="price">가격</label> <input type="text" id="car_price"
						name="car_price"
						value="${empty deal.car_price ? '가격을 입력하세요.' : deal.car_price}">
			
					<label for="description">내용</label>
					<textarea id="description" name="car_content" rows="5">${empty deal.car_content ? '내용을 입력하세요.' : deal.car_content}
					</textarea>

					
					    <!-- 이전에 업로드된 파일 목록 -->
					<div id="existing-files">
						<c:if test="${not empty deal.car_file}">
							<ul>
								<c:forEach var="filename" items="${deal.car_file}">
									<li class="file-item">
								
										<button type="button"
											onclick="removeExistingFile('${image}')">삭제</button> <input
										type="hidden" name="existingFiles" value="${image}">

									</li>
									 </c:forEach>
                                </ul>
                            </c:if>
                        </div>
									
									
									
									<!-- 새로운 파일 업로드 -->
									<div class="file-upload">
    <input type="file" id="imageUpload" name="file" style="display: none;" onchange="handleFileChange(event)"> 
    <div id="file-name-display">${file}</div>
    <label for="imageUpload" class="file-select-btn">파일선택</label>
</div>
									
				
									<br>
							
						<button type="submit" class="submit-btn">완료</button>
						
					</div>
					<br>

					
				
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
    
    
    // 새로운 파일 이름 표시를 위한 이벤트 속성 추가
   function handleFileChange(event) {
    // 파일 이름 표시할 요소
    const fileNameDisplay = document.getElementById('file-name-display');
    
    // 선택한 파일 가져오기
    const file = event.target.files[0];
    
    if (file) {
        // 파일 이름 출력 (file.name)
        fileNameDisplay.innerHTML = `선택된 파일: ${file.substring(8)}`;
    } else {
        fileNameDisplay.innerHTML = '선택된 파일이 없습니다.';
    }
}
    
    // 페이지 상단으로 스크롤하는 함수
    function scrollToTop() {
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }

    // 스크롤을 감지해서 버튼의 표시 여부를 결정하는 함수
    window.onscroll = function() {
        const scrollToTopBtn = document.querySelector('.scroll-to-top');
        if (document.documentElement.scrollTop > 100) {
            scrollToTopBtn.style.display = 'block'; // 스크롤이 100px 이상 내려가면 버튼 보이기
        } else {
            scrollToTopBtn.style.display = 'none';  // 상단에 있으면 버튼 숨기기
        }
    }
    
    
    // 파일 교체시 이름 바꾸기
    document.getElementById('file-input').addEventListener('change', function(event) {
    	
    	fileList.innerHTML = ''; // 기존 파일 목록 비우기
        let fileList = document.getElementById('file-list');
        let previewContainer = document.getElementById('preview-container');
       
        
        previewContainer.innerHTML = ''; // 기존 미리보기 비우기

        let files = event.target.files;
        if (files.length === 0) {
            fileList.innerHTML = 'No files selected.';
            return;
        }

        Array.from(files).forEach(function(file, index) {
            let reader = new FileReader();
            reader.onload = function(e) {
                let imgContainer = document.createElement('div');
                imgContainer.className = 'file-item';

                let img = document.createElement('img');
                img.src = e.target.result;

                let fileName = document.createElement('span');
                fileName.textContent = file.name;

                let removeButton = document.createElement('button');
                removeButton.textContent = '삭제';
                removeButton.type = 'button';
                removeButton.onclick = function() {
                    imgContainer.remove();
                    document.getElementById('file-input').files = removeFileAtIndex(files, index);
                };

                imgContainer.appendChild(img);
                imgContainer.appendChild(fileName);
                imgContainer.appendChild(removeButton);

                previewContainer.appendChild(imgContainer);
            };
            reader.readAsDataURL(file);
        });
    });

    function removeFileAtIndex(files, index) {
        let dataTransfer = new DataTransfer();
        Array.from(files).forEach((file, i) => {
            if (index !== i) {
                dataTransfer.items.add(file);
            }
        });
        return dataTransfer.files;
    }

    function removeExistingFile(filename) {
        const fileItems = document.querySelectorAll('#existing-files .file-item');
        fileItems.forEach(item => {
            if (item.querySelector('input').value === filename) {
                item.remove();
            }
        });

        const input = document.createElement('input');
        input.type = 'hidden';
        input.name = 'removedFiles';
        input.value = filename;
        document.querySelector('form').appendChild(input);
    }
    
    
</script>

</body>
</html>
