<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${boxoffice.showRange }영화</title>
</head>
<body>
	<div class="container">
		<form>
			<table class="table table-hover">
				<tr class="active">
					<th>번호</th>
					<th>영화명(국문)</th>
					<th>영화명(원문)</th>
					<th>제작 국가</th>
					<th>개봉 연도</th>
					<td rowspan="4">${movie.posterMv }</td>
				</tr>
				<tr>
					<td>${movie.movieCn }</td>
					<td><input type="text" id="movieNm" name="movieNm" value="${movie.movieNm }"></td>
					<td><input type="text" id="movieNm" name="movieNm" value="${movie.movieOg }"></td>
					<td><input type="text" id="nationNm" name="movieNm" value="${movie.nationNm }"></td>
					<td><input type="text" id="openDt" name="openDt" value="${movie.openDt }"></td>
				</tr>
				<tr class="active">
					<th>상영시간</th>
					<th>영화 감독</th>
					<th>제작사</th>
					<th>장르</th>
					<th>등급</th>
				</tr>
				<tr>
					<td><input type="text" id="showTm" name="showTm" value="${movie.showTm }"></td>
					<td><input type="text" id="peopleNm" name="peopleNm" value="${movie.peopleNm }"></td>
					<td><input type="text" id="companyNm" name="companyNm" value="${movie.companyNm }"></td>
					<td><input type="text" id="genrenNm" name="genreNm" value="${movie.genreNm }"></td>
					<td><input type="text" id="watchGradeNm" name="watchGradeNm" value="${movie.watchGradeNm }"></td>
				</tr>
				<tr class="active">
					<th>줄거리</th>
				</tr>
				<tr>
					<textarea rows="6" cols="30" name="story">${movie.story }</textarea>
				</tr>
			</table>
			
<!-- 
			<table>
				<tr class="active">
					<th colspan="5">출연진</th>
				</tr>
				<tr class="active">
					<th><input type="checkbox" id="checkAll" name="checkAll"></th>
					<th colspan="2">배우명</th>
					<th colspan="2">배역</th>
				</tr>
				<c:forEach var="people" items="${people }">
					<tr>
						<td><input type="checkbox" id="check" name="check"></td>
						<td colspan="2"><input type="text" id="peopleNm" name="peopleNm" value="${movie.peopleNm }"></td>
						<td colspan="2"><input type="text" id="castNm" name="castNm" value="${movie.castNm }"></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5">
						<input type="button" id="removeActor" name="removeActor" value="배우 입력칸 제거">
						<input type="button" id="addActor" name="addActor" value="배우입력칸 추가">
					</td>
				</tr>
			</table>
-->
			<div class="btn btn-primary">
				<input type="button" class="btn btn-primary" value="영화 수정" id="boxofficeModify">
			</div>
		</form>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
	<script type="text/javascript"></script>
</body>
</html>