<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>박스오피스</title>
</head>
<body>
	<div class="container">
		<div class="col-lg-12">
			<h3 class="detailTitle">${boxofficeData.boxOfDate }일자박스오피스</h3>

			<table class="table table-hover">
				<tr class="active">
					<th>순위</th>
					<th>영화번호</th>
					<th>영화명</th>
					<th>순위 변동</th>
					<th>개봉일</th>
				</tr>
				<c:forEach var="boxoffice" items="${boxofficeList }">
					<tr>
						<td><c:out value="${boxoffice.rnum }" /></td>
						<td><c:out value="${boxoffice.movieNo }" /></td>
						<td><a href=""
							onclick="javascript:window.open('/admin/movieDBDetail?movieNo=${boxoffice.movieNo}&type=1','popup  movie${boxoffice.movieNo}','scrollbars=no, resizable=no')"
						><c:out value="${boxoffice.movieNm }" /></a></td>
						<td><c:out value="${boxoffice.rankInten }" /></td>
						<td><c:out value="${boxoffice.openDt }" /></td>
					</tr>
				</c:forEach>
			</table>
		</div>
		<div class="col-lg-6 form-inline">
			<input type="button" class="btn btn-default" value="박스오피스 수정/작성" id="boxofficeEdit">
		</div>
		<div class="col-lg-6 form-inline">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
</body>
</html>