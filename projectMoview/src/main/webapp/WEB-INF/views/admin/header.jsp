<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"
	integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous"
>
<title>관리 페이지</title>
<script type="text/javascript">
	$(document).ready(function() {
		var id =
<%request.getSession().getAttribute("id");%>
	console.log(id);
		if (id == null) {
			// 			window.location = "/admin";
		}
	});
</script>
<link href="/resources/css/admin2.css" rel="stylesheet" type="text/css" />
	<div class="container">
		<div class="form-inline col-lg-2">
			<h2>관리 페이지</h2>
		</div>
		<div class="form-inline col-lg-4 nav">
			<ul class="nav nav-pills">
				<li role="presentation"><a href="/admin/userList">유저 관리 </a></li>
				<li role="presentation"><a href="/admin/movieDBList">영화 DB 관리 </a></li>
				<li role="presentation"><a href="/admin/boardList">게시물 관리 </a></li>
			</ul>
		</div>
		<div class="form-inline col-lg-6">
			<div class= "pull-right">
				<em>환영합니다, ${userVO.userName }님!</em>
				<input type="button" class="btn btn-default" onclick="javascript:window.location = '/admin/logout';" value="로그아웃">
			</div>
		</div>
	</div>
	<hr>
</head>


