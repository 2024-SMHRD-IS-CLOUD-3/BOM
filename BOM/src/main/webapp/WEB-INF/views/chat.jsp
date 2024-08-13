<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<title>Chat Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.3/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
</head>

<body>

	<div class="container">
		<div class="jumbotron jumbotron-fluid alert-success">
			<div class="container">
				<p> 사업명 </p>
				<h1> 과정명 </h1>
				<!-- EL을 이용해 쿼리스트링에 담긴 데이터 집어넣기 -->
				<h1 id="room">${param.room}</h1>
			</div>
		</div>

		<div class="row">  
			<div class="col-lg-2"></div>   
			<div class="col-lg-8">
				<div class="card" style="height:600px;">
					<!-- chat body -->
					<div class="card-body" style="overflow-y:scroll;" id="chatBody">
						<div id="msgArea" style="height : 100%">
						
						<!-- 메세지가 작성되는 영역 -->
							
							<!-- 내가 보낸 메세지 예시 -->
							<div class='row'>
								<div class='col-sm-6'></div>
								<div class='col-sm-6'>
									<div class='alert alert-secondary'>
										<b>메세지 내용</b>
									</div>
								</div>
							</div>
							
							<!-- 남이 보낸 메세지 예시 -->
							<div class='row'>
								<div class='col-6'>
									<div class='alert alert-warning'>
										<b>보낸 사람 : 메세지 내용</b>
									</div>
								</div>
							</div>
						
						
						</div>
					</div>
					<!-- chat body end -->
					<!-- chat input -->
					<div style="text-align: center;">
						<div class="row">
							<div class="col-lg-1"></div>
							<div class="input-group col-lg-10">
								
								<!-- username  -->
								<input id="userId" class="form-control" placeholder="아이디를 입력해야 채팅 사용가능">
								
								<button id="idSelect" class="btn btn-sm btn-success">아이디 결정</button>
							
							</div>
						</div>
						<br>
						<div class="row">
						<div class="col-lg-1"></div>
						<div class="input-group col-lg-10">
							
							<!-- 메세지 전송 버튼 -->
							<input type="text" id="msg" class="form-control"
								aria-label="Recipient's username"
								aria-describedby="button-addon2">
							
							<div class="input-group-append">
								<button class="btn btn-sm btn-info" type="button"
									id="button-send" disabled>전송</button>
							</div>
							
						</div>
						</div>
					</div>
					<!-- chat input end -->
				</div>
			</div>
		</div>

		<div class="col-lg-2"></div>
	</div>
	
	<!-- webapp 을 기준으로 하면 된다. 내 jsp파일이 어디에 있는게 중요한 것이 아니라 webapp을 기준으로 src를 작성하면 된다. -->
	<script type="text/javascript" src="asset/js/chat.js"></script>
</body>
</html>