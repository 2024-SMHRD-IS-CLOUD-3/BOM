<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link rel="stylesheet" href="join.css">
</head>
<body>
    <div class="signup-container">
        <h1>회원 가입</h1>
        <form action="join" method="post">
            <!-- 아이디 -->
            <label for="id">아이디</label>
            <div class="input-group">
                <input type="text" id="id" name="id" placeholder="아이디를 입력해주세요" required>
                <button type="button" class="check-btn">중복확인</button>
            </div>

            <!-- 비밀번호 -->
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" placeholder="비밀번호를 입력해주세요" required>

            <!-- 비밀번호 확인 -->
            <label for="confirm-password">비밀번호 확인</label>
            <input type="password" id="confirm-password" name="confirmPassword" placeholder="비밀번호를 다시 입력해주세요" required>

            <!-- 성명 -->
            <label for="name">성명</label>
            <input type="text" id="name" name="name" placeholder="성명을 입력해주세요" required>

            <!-- 전화번호 -->
            <label for="phone">전화번호</label>
            <input type="text" id="phone" name="phone" placeholder="전화번호를 입력해주세요" required>

            <!-- 주소 -->
            <label for="addr">주소</label>
            <input type="text" id="addr" name="addr" placeholder="주소를 입력해주세요" required>

            <div class="button-group">
                <!-- 신분증 등록 버튼 -->
                <button type="button" class="id-btn">신분증 등록</button>
                <!-- 확인 버튼 (폼 제출) -->
                <button type="submit" class="submit-btn">확인</button>
            </div>
        </form>
    </div>
</body>
</html>
