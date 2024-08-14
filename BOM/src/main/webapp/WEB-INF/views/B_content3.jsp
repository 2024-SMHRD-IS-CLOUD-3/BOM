<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="dealWrite" method="POST" enctype="multipart/form-data">
	<select id="select-06fa" name="category"
								class="u-border-2 u-border-grey-10 u-custom-font u-input u-input-rectangle u-radius u-input-1">
								<option value="유아가구" data-calc="유아가구">유아가구</option>
								<option value="남아의류" data-calc="남아의류">남아의류</option>
								<option value="여아의류" data-calc="여아의류">여아의류</option>
								<option value="장난감 " data-calc="장난감류">장난감류</option>
								<option data-calc="도서교구" value="도서교구">도서교구</option>
							</select>
		<input
							id="text-eb56" name="b_title"
							class="u-border-2 u-border-grey-10 u-custom-font u-input u-input-rectangle u-radius u-input-2"
							type="text" placeholder="제목을 입력해 주세요">
							<input
							type="text" id="text-db2a" name="how_much"
							class="u-border-2 u-border-grey-10 u-custom-font u-input u-input-rectangle u-radius u-input-3"
							placeholder="가격을 입력해주세요.">
							<textarea rows="6" cols="50" id="message-4439" name="b_content"
							class="u-border-2 u-border-grey-10 u-custom-font u-input u-input-rectangle u-radius u-input-4"
							required="required"
							placeholder="​게시글 내용을 작성해주세요.( 판매금지 품목은 게시가 제한될 수 있어요 .)신뢰할 수 있는 거래를 위해 자세히 적어주세요."></textarea>
		<input type="file" id="file-input" name="file" 
				class="u-active-custom-color-7 u-btn u-button-style u-custom-color-1 u-hover-custom-color-7 u-btn-2">
		
		<input type="submit" value="완료">

	</form>
</body>
</html>