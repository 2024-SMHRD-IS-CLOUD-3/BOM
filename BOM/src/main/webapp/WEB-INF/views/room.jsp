<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org"
	xmlns:sec="http://www.thymeleaf.org/extras/spring-security">
<head>
<title>Room Example</title>
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
				<p>사업명</p>
				<h1>과정명</h1>
			</div>
		</div>

		<div class="row">
			<div class="col-lg-2"></div>
			<div class="col-lg-8">
				<div class="card" style="height: 600px;">
					<!-- chat body -->
					<div class="card-body" style="overflow-y: scroll;" id="chatBody">

						<!-- 채팅방 목록 -->
						<div class="card bg-success text-white"
							onclick="goChat?idx=${chat.b_idx}">
							<div class="card-body">${chat.id} 채팅방</div>
						</div>
						<br>

						<div class="card bg-success text-white"
							onclick="window.location.href='goChat?idx=${chat.id}'">
							<div class="card-body">dog 채팅방</div>
						</div>
						<br>

						<div class="card bg-success text-white"
							onclick="window.location.href='chat.jsp?room=bird'">
							<div class="card-body">bird 채팅방</div>
						</div>
						<br>

					</div>

				</div>
			</div>
		</div>

		<div class="col-lg-2"></div>
	</div>

</body>
</html>