<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>게시글 작성</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <link rel="stylesheet" href="resources/assetsBoard/css/main.css" />
      <link rel="stylesheet" href="resources/assetsBoard/css/board.css" />
      <style>
        /* 파일 이름 표시를 위한 스타일 */
        #file-list {
            margin-top: 10px;
        }
        .file-item {
            margin-bottom: 5px;
        }
        .file-upload-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 10px;
        }
        .preview-container img {
            max-width: 100px; /* 미리보기 이미지 크기 조절 */
            max-height: 100px;
            margin: 5px;
        }
        .file-item {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        .file-item img {
            max-width: 200px;
            max-height: 200px;
        }
        .file-item button {
            margin-left: 10px;
        }
      </style>
</head>
<body>
    <div id="deal">
        <form action="dealWrite" method="post" enctype="multipart/form-data">
            <table id="list">
                <tr>
                    <td>제목</td>
                    <td><input type="text" name="title"> </td>
                </tr>
                <tr>
                    <td>작성자</td>
                    <td><input type="text" name="writer"> </td>
                </tr>
                <tr>
                    <td colspan="2">내용</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="file-upload-container">
                            <input type="file" id="file-input" name="files" multiple>
                        </div>
                        <div id="file-list"></div>
                        <div class="preview-container" id="preview-container"></div>
                        <textarea rows="10" style="resize: none;" name="content"></textarea>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="reset" value="초기화"><span>　　　</span>
                        <input type="submit" value="작성하기">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <!-- Scripts -->
    <script src="resources/assets/js/jquery.min.js"></script>
    <script src="resources/assets/js/jquery.scrolly.min.js"></script>
    <script src="resources/assets/js/jquery.scrollex.min.js"></script>
    <script src="resources/assets/js/skel.min.js"></script>
    <script src="resources/assets/js/util.js"></script>
    <script src="resources/assets/js/main.js"></script>
    <script>
        document.getElementById('file-input').addEventListener('change', function(event) {
            let fileList = document.getElementById('file-list');
            let previewContainer = document.getElementById('preview-container');
            fileList.innerHTML = ''; // 기존 파일 목록 비우기
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
    </script>
</body>
</html>
