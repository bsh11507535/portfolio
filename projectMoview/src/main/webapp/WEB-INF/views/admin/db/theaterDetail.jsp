<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${theater.theaterNm } 상세정보</title>
</head>
<body>
	<div class="container">
		<table class="table table-hover" id = "companyStatus">
			<tr class="active">
				<th>번호</th>
				<th>상영관 명</th>
				<th>소속상영사</th>
				<th>상영지역</th>
				<th>상영관 URL</th>
			</tr>
			<tr>
				<td>${theater.theaterNo }</td>
				<td>${theater.theaterNm }</td>
				<td>${theater.theaterClub }</td>
				<td>${theater.theaterClub }</td>
				<td>${theater.theaterArea }</td>
				<td><a href="#">${theater.theaterURL }</a></td>
			</tr>
			<tr>
				<th colspan = "2">일자</th>
				<th colspan = "2">상영영화</th>
				<th>상영시간</th>
			</tr>
			<c:forEach var="theater" items="#{theater }">
				<tr>
					<td><input type="checkbox" name = "check" id = "check"></td>
					<td colspan = "2">${theater.showRange }</td>
					<td colspan = "2"><a href="#">${theater.movieNm }</a></td>
					<td>${theater.showTime }</td>
				</tr>
			</c:forEach>
			<tr class="active">
				<th colspan="5">추가</th>
			</tr>
			<tr class="active">
				<th colspan="2">일자</th>
				<th colspan="2">상영 영화</th>
				<th>상영 시간</th>
			</tr>
			<tr>
				<td colspan="2">
					<select name="SearchType">
						<option value = "da">날짜</option>
						<option value = "no">번호</option>
						<option value = "dano">날짜 & 번호</option>
					</select>
				</td>
				<td colspan="2"><input type = "text"></td>
				<td><input type="button" class="btn btn-info" value="검색"></td>
			</tr>
		</table>
		<div class="col-lg-12">
			<input type = "button" class="btn btn-primary" id = "theaterEdit" value = "정보 수정">
			<input type = "button" class="btn btn-danger" id = "delete" value = "삭제">
			<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
		</div>
	</div>
	<script type="text/javascript"></script>
</body>
</html>