<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Community Write</h1>
	<form action="commContent">
		제목 <input type="text" name="cb_title"><br>
		내용 <input type="text" name="cb_content"><br>
		파일 첨부 <input type="file" name="cb_file" accept="image/*"><br>
		작성자 <input type="text" name="id" required readonly><br>
		<input type="submit" value="작성완료">
	</form>
</body>
</html>