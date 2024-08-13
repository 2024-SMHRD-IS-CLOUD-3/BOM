<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Script 작성을 위한 준비 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		document.getElementById('cb_file').value = ${userId};
	});
</script>
</head>
<body>
	<h1>Community Write</h1>
	<form action="commContent" method="POST" enctype="multipart/form-data">
		제목 <input type="text" name="cb_title"><br>
		내용 <input type="text" name="cb_content"><br>
		파일 첨부 <input type="file" name="cb_file" accept="image/*"><br>
		작성자 <input type="text" name="id" required readonly><br>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>