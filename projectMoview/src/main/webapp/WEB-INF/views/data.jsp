<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 팝업창 만들기 -->
	<a href="#"
		onClick="javascript:window.open('/admin/movieList','popup','scrollbars=no, resizable=no, width=100,height=100')">
		클릭 </a>
	<!-- 		새창열기 -->
	<a href="/admin/userDetail?userNo=${user.userNo }&pageNum=${pageNum }"
		target="_blank"><c:out value="${user.userMail}" /></a>
</body>
</html>