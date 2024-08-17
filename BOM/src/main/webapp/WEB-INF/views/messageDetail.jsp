<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>받은 쪽지</title>
    <link rel="stylesheet" href="messagedetail.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap" rel="stylesheet">
</head>

<body>
    <div class="container">
        <header>
            <div class="header-container">
                <nav class="main-nav">
                    <div class="logo">
                        <h1>BOM</h1>
                    </div>
                </nav>
                <nav class="main-nav">
                    <ul>
                        <li><a href="./">Home</a></li>
                        <li><a href="b_board">Market</a></li>
                        <li><a href="car">Stroller</a></li>                        
                        <li><a href="goComm">Board</a></li>
                        <li><a href="goMyPage">MyPage</a></li>
                    </ul>
                </nav>
            </div>
        </header>

        <main>
            <!-- 쪽지 상세 정보 -->
            <div class="message-detail-box">
                <div class="message-header">
                    <div>
                        <strong>보낸 사람:</strong> ${message.senderName}
                    </div>
                    <div>
                        <strong>받은 시간:</strong> ${message.date}
                    </div>
                </div>
                <div class="message-subject">
                    <strong>제목:</strong> ${message.subject}
                </div>
                <div class="message-body">
                    <p>${message.body}</p>
                </div>
                <div class="message-actions">
                    <button class="reply-btn">답장</button>
                    <button class="delete-btn">삭제</button>
                    <button class="inbox-btn" onclick="window.location.href='inbox.html'">쪽지함으로 돌아가기</button>
                </div>
            </div>
        </main>

        <footer>
            <p>@BOM</p>
        </footer>
    </div>
</body>

</html>