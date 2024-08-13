/*
		웹소캣 사용하기 전에 미리 했으면 좋겠다, 라고 생각되는 것은 
	1. 메세지 양식 지정 
	   JSON : JavaScript Object Notation ( 자바스크립트의 객체 문법대로 작성된 데이터 )
	  let test =  { 
		"키" : " 값" , 
	   "key" : "value"
   		}
		
	   메세지 데이터를 저장할 자바스크립트 객체 생성을 해둬야 밑에서 유용하게 사용할 수 있다.
*/

let chat = {
	"id" : "",
	"chat" : ""
}

/*
	2. 사용자의 id 가져오기
*/

let socket;  

$('#idSelect').on("click", function(){
	
	chat.id = $('#userId').val();
	// chat.jsp button에 disabled가 적용되어 있으므로 disabled 속성을 없애줘야 한다.
	$('#button-send').removeAttr('disabled');
	$(this).attr('disabled', 'disabled'); // id를 한 번 입력했으면 수정 할 수 없도록 하는 것
	// this : idSelect 버튼
	
	// Id를 결정한 시점에서 WebSocket과 연결하기 = WebSocket 객체 생성
	// new WebSocket("Socket에 연결하기 위한 URL");
	socket = new WebSocket("ws://localhost:8081/WebSocket/chat"); 
	socket.onopen = onOpen; // 함수의 기능을 가져오고 싶은 것이므로 소괄호가 필요없다.
	socket.onclose = onClose;
	socket.onmessage = onMessage;
	
});

$('#button-send').on("click", function(){
	// 1) 사용자가 작성한 데이터 가져오기
	chat.chat= $('#msg').val();
	
	// 2) chat 객체를 JSON 데이터로 변환
	// Javascript Object --> json String
	let json = JSON.stringify(chat); 
	
	// 3) WebSocket으로 메세지 전송
	// socket.send("보내고 싶은 문자열");
	socket.send(json);
});

// 웹소캣과 연결하는 기능을 구현하기 전에 3개의 함수를 정의해두면 편리하다.
// 웹소캣과 연결이 잘 되었을 경우 실행되는 메서드
function onOpen(){
	
}
// 웹소캣과 연결이 잘 끊어졌을 경우 실행되는 메서드
function onClose(){
	
}
// 메세지가 입력되었을 경우 실행되는 메서드
function onMessage(msg){ //msg: 받은 메세지가 저장되는 변수
	console.log(msg.data);

	// json String --> Javascript Object
	let data = JSON.parse(msg.data);
	console.log(data.id);
	console.log(data.chat);	
}