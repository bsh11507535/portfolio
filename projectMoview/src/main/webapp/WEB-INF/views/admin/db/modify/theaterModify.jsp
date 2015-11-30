<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${theater.theaterNm }상세정보</title>
</head>
<body>
	<div class="container">
		<form>
			<table class="table table-hover">
				<tr class="active">
					<th>번호</th>
					<th>상영관 명</th>
					<th>소속상영사</th>
					<th>상영지역</th>
					<th>상영관 URL</th>
				</tr>
				<tr>
					<td>${theater.theaterNo }</td>
					<td><input type="text" id="theaterNm" name="theaterNm" value="${theater.theaterNm }"></td>
					<td><input type="text" id="theaterClub" name="theaterClub" value="${theater.theaterClub }"></td>
					<td><input type="text" id="theaterArea" name="theaterArea" value="${theater.theaterArea }"></td>
					<td><input type="text" id="theaterURL" name="theaterURL" value="${theater.theaterURL }"></td>
				</tr>
				<tr class="active">
					<th><input type="checkbox" name="checkAll" id="checkAll"></th>
					<th>일자</th>
					<th colspan="2">상영영화</th>
					<th>상영시간</th>
				</tr>
				<c:forEach var="theater" items="#{theater }">
					<tr>
						<td><input type="checkbox" name="check" id="check"></td>
						<td><input type="text" id="showRange" name="showRange" value="${theater.showRange }"></td>
						<td colspan="2"><input type="text" id="movieNm" name="movieNm" value="${theater.movieNm }"></td>
						<td><input type="text" id="showTime" name="showTime" value="${theater.showTime }"></td>
					</tr>
				</c:forEach>
			</table>
			<div class="col-lg-12">
				<input type="button" class="btn btn-primary" id="theaterModify" value="정보 수정">
				<input type="button" class="btn btn-danger" id="deleteMovie" value="상영영화 삭제">
			</div>
		</form>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
	<script type="text/javascript"></script>
</body>
</html>