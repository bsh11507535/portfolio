<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<title>Login</title>
<script src='https://www.google.com/recaptcha/api.js'></script>
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"
>
<link href="/resources/css/admin2.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="container">
		<form class="form-horizontal login img-rounded" role="form" action="/admin/login" method="post">
			<h2>관리자 로그인</h2>
			<div class="form-group">
				<label for="Name" class="control-label sr-only">아이디</label>
				<div class="col-lg-12">
					<input type="text" class="form-control" name="userMail" placeholder="아이디">
				</div>
			</div>
			<div class="form-group">
				<label for="Password" class="control-label sr-only">비밀번호</label>
				<div class="col-lg-12">
					<input type="password" class="form-control" name="userPass" placeholder="비밀번호">
				</div>
			</div>
			<div class="form-group">
				<label for="emailaddress" class="control-label sr-only">리캡챠</label>
				<div class="col-lg-12">
					<div class="g-recaptcha" data-sitekey="6LdcWhATAAAAAHIx8PVZiCyWschCWRy18PC3LEkg"></div>
				</div>
			</div>
			<div class="form-group">
				<div class="col-lg-12">
					<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>
