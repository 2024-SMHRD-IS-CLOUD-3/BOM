<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쪽지함</title>
    <link rel="stylesheet" href="message.css">
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
            <!-- 탭 섹션 -->
            <div class="tabs">
                <button class="tab-link active" onclick="openTab(event, 'received')">받은 쪽지</button>
                <button class="tab-link" onclick="openTab(event, 'sent')">보낸 쪽지</button>
            </div>

            <!-- 받은 쪽지 컨테이너 -->
            <div id="received" class="tab-content container-box" style="display: block;">
                <h2>받은 쪽지</h2>
                <table class="message-table">
                    <thead>
                        <tr>
                            <th>보낸 사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="message" items="${receivedMessages}">
                            <tr>
                                <td>${message.senderName}</td>
                                <td><a href="goMessageDetail?id=${message.id}">${message.subject}</a></td>
                                <td>${message.date}</td>
                                <td>
                                    <button class="reply-btn">답장</button>
                                    <button class="delete-btn">삭제</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <!-- 보낸 쪽지 컨테이너 -->
            <div id="sent" class="tab-content container-box">
                <h2>보낸 쪽지</h2>
                <table class="message-table">
                    <thead>
                        <tr>
                            <th>받는 사람</th>
                            <th>제목</th>
                            <th>날짜</th>
                            <th>작업</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="message" items="${sentMessages}">
                            <tr>
                                <td>${message.receiverName}</td>
                                <td><a href="goMessageDetail?id=${message.id}">${message.subject}</a></td>
                                <td>${message.date}</td>
                                <td>
                                    <button class="delete-btn">삭제</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </main>

        <footer>
            <p>@BOM</p>
        </footer>
    </div>

    <script>
        function openTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tab-content");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tab-link");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
        }
    </script>
</body>

</html>
