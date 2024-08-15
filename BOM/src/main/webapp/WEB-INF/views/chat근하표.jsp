<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>채팅</title>
    <link rel="stylesheet" href="chat.css">
    
    <style>
        
    </style>
</head>

<body>
    <div class="header">
        <div class="logo">BOM</div>
        <button id="backButton" onclick="goBack()">Back</button>
        <div class="menu">
            <a href="#">Home</a>
            <a href="#">Menu</a>
            <a href="#">Board</a>
            <a href="#">My page</a>
        </div>
    </div>

    <div class="main-content">
        <div class="friend-list">
            <div class="my-name">
                <div class="my-avatar"></div>
                <!-- 내 닉네임 -->세상은 이렇다
            </div>
            <div class="friend-item" onclick="selectFriend('연주씨', this)">
                <div class="friend-avatar"
                    style="background-image: url('https://randomuser.me/api/portraits/women/1.jpg');"></div>
                <div class="friend-name"><!-- 상대방 닉네임 --></div>
                <div class="friend-last-message">마지막 메시지 내용</div>
            </div>
            <div class="friend-item" onclick="selectFriend('희경씨', this)">
                <div class="friend-avatar"
                    style="background-image: url('https://randomuser.me/api/portraits/women/2.jpg');"></div>
                <div class="friend-name">희경씨</div>
                <div class="friend-last-message">마지막 메시지 내용</div>
            </div>
           <!-- 몇개이상인지는 모름 (아마 4개 이상일걸?)ㅋㅋ -->
            <div class="more-button" onclick="toggleMoreFriends()">더보기</div>
        </div>

        <div class="container">
            <div class="current-friend">
                <div class="current-friend-avatar" id="currentFriendAvatar"></div>
                <div id="currentFriendName" style="font-size: 18px; font-weight: bold;"></div>
            </div>
            <div class="chat-messages" id="chatMessages"></div>
            <div class="chat-input">
                <input type="text" id="messageInput" placeholder="메시지를 입력하세요..." onkeypress="checkEnter(event)" />
                <!-- onClick으로 답이 무조건 오게 설정되어있음. -->
                <button onclick="sendMessage()">전송</button>
            </div>
        </div>
    </div>
    <script>

        let currentFriend = '';
        const chatHistory = {};

        function selectFriend(friendName, element) {
            currentFriend = friendName;
            document.getElementById('currentFriendName').textContent = `${currentFriend}`;
            const currentFriendAvatar = document.getElementById('currentFriendAvatar');

            // 친구 프로필 이미지 설정
            const friendAvatarUrl = element.querySelector('.friend-avatar').style.backgroundImage.slice(5, -2);
            currentFriendAvatar.style.backgroundImage = `url(${friendAvatarUrl})`;
            currentFriendAvatar.style.width = '50px';
            currentFriendAvatar.style.height = '50px';
            currentFriendAvatar.style.borderRadius = '50%';
            currentFriendAvatar.style.backgroundSize = 'cover';

            const chatMessages = document.getElementById('chatMessages');
            chatMessages.innerHTML = '';

            if (chatHistory[currentFriend]) {
                chatHistory[currentFriend].forEach(message => {
                    const messageContainer = document.createElement('div');
                    messageContainer.classList.add('message-container');

                    const messageDiv = document.createElement('div');
                    messageDiv.classList.add('message', message.type);
                    messageDiv.textContent = message.text;

                    const timeDiv = document.createElement('div');
                    timeDiv.classList.add('message-time');
                    timeDiv.textContent = message.time;

                    const reactionContainer = document.createElement('div');
                    reactionContainer.classList.add('reaction-container');
                    const heartReaction = document.createElement('span');
                    heartReaction.classList.add('reaction');
                    heartReaction.innerHTML = '❤️';
                    heartReaction.onclick = () => handleReaction('❤️', messageDiv);

                    const moneyReaction = document.createElement('span');
                    moneyReaction.classList.add('reaction');
                    moneyReaction.innerHTML = '💰';
                    moneyReaction.onclick = () => handleReaction('💰', messageDiv);

                    reactionContainer.appendChild(heartReaction);
                    reactionContainer.appendChild(moneyReaction);

                    messageContainer.appendChild(messageDiv);
                    messageContainer.appendChild(timeDiv);
                    messageContainer.appendChild(reactionContainer);
                    chatMessages.appendChild(messageContainer);
                });
            } else {
                const infoMessageDiv = document.createElement('div');
                infoMessageDiv.classList.add('message', 'info');
                infoMessageDiv.textContent = `${friendName}와의 대화입니다.`;
                chatMessages.appendChild(infoMessageDiv);
            }

            const friendItems = document.querySelectorAll('.friend-item');
            friendItems.forEach(item => item.classList.remove('active'));
            element.classList.add('active');
        }

        function handleReaction(reaction, messageDiv) {
            const reactionText = document.createElement('span');
            reactionText.textContent = reaction;
            reactionText.style.marginLeft = '5px';
            messageDiv.appendChild(reactionText);
        }

        function sendMessage() {
            const input = document.getElementById('messageInput');
            const messageText = input.value.trim();
            if (messageText && currentFriend) {
                const chatMessages = document.getElementById('chatMessages');
                const messageContainer = document.createElement('div');
                messageContainer.classList.add('message-container');

                const messageDiv = document.createElement('div');
                messageDiv.classList.add('message', 'user');
                messageDiv.textContent = messageText;

                const time = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                const timeDiv = document.createElement('div');
                timeDiv.classList.add('message-time', 'right');
                timeDiv.textContent = time;

                messageContainer.appendChild(messageDiv);
                messageContainer.appendChild(timeDiv);
                chatMessages.appendChild(messageContainer);

                if (!chatHistory[currentFriend]) {
                    chatHistory[currentFriend] = [];
                }
                chatHistory[currentFriend].push({ type: 'user', text: messageText, time: time });

                input.value = '';
                chatMessages.scrollTop = chatMessages.scrollHeight;

                const responseContainer = document.createElement('div');
                responseContainer.classList.add('message-container');

                const responseDiv = document.createElement('div');
                responseDiv.classList.add('message', 'other');
                const responseMessage = `${currentFriend}의 메시지`; // 상대방 메시지
                responseDiv.textContent = responseMessage;

                const responseTime = new Date().toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
                const responseTimeDiv = document.createElement('div');
                responseTimeDiv.classList.add('message-time', 'left'); // 왼쪽 정렬
                responseTimeDiv.textContent = responseTime;

                responseContainer.appendChild(responseDiv);
                responseContainer.appendChild(responseTimeDiv);
                chatMessages.appendChild(responseContainer);

                chatHistory[currentFriend].push({ type: 'other', text: responseMessage, time: responseTime });

                // 마지막 메시지 업데이트
                updateLastMessage(currentFriend, responseMessage);
            }
        }

        function updateLastMessage(friendName, messageText) {
            const friendItems = document.querySelectorAll('.friend-item');
            friendItems.forEach(item => {
                if (item.querySelector('.friend-name').textContent === friendName) {
                    item.querySelector('.friend-last-message').textContent = messageText;
                }
            });
        }

        function checkEnter(event) {
            if (event.key === 'Enter') {
                sendMessage();
                event.preventDefault();
            }
        }

        function toggleMoreFriends() {
            const moreFriends = document.getElementById('moreFriends');
            if (moreFriends.style.display === 'none') {
                moreFriends.style.display = 'block';
            } else {
                moreFriends.style.display = 'none';
            }
        }
    </script>
</body>

</html>