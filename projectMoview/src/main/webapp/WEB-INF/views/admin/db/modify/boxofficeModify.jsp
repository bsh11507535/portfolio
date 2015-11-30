<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${boxoffice.showRange }박스오피스</title>
</head>
<body>
	<div class="container">
		<form>
			<table class="table table-hover">
				<tr class="active">
					<th>번호</th>
					<th>작성일</th>
				</tr>
				<tr>
					<td>${boxoffice.officeNo }</td>
					<td>${boxoffice.showRange }</td>
				</tr>
			</table>
	
			<table class="table table-hover">
				<tr class="active">
					<th>순위</th>
					<th>영화명</th>
					<th>신규진입</th>
					<th>순위 변동</th>
					<th>누적 매출액</th>
					<th>누적 관객수</th>
					<th>개봉일</th>
				</tr>
				<c:forEach var="boxoffice" items="${boxoffice }">
					<tr>
						<td><input type="text" id="rnum" name="rnum" value="<c:out value = "${boxoffice.rnum }"/>"></td>
						<td><input type="text" id="number" name="number" value="<c:out value = "${boxoffice.movieNm }"/>"></td>
						<td><input type="text" id="rankOldAndNew" name="rankOldAndNew" value="<c:out value = "${boxoffice.rankOldAndNew }"/>"></td>
						<td><input type="text" id="rankInten" name="rankInten" value="<c:out value = "${boxoffice.rankInten }"/>"></td>
						<td><input type="text" id="salesAcc" name="salesAcc" value="<c:out value = "${boxoffice.salesAcc }"/>"></td>
						<td><input type="text" id="audiAcc" name="audiAcc" value="<c:out value = "${boxoffice.audiAcc }"/>"></td>
						<td><input type="text" id="openDt" name="openDt" value="<c:out value = "${boxoffice.openDt }"/>"></td>
					</tr>
				</c:forEach>
			</table>
			<div class="col-lg-12">
				<input type="button" class="btn btn-primary" value="박스오피스 수정" id="boxofficeModify">
			</div>
		</form>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
</body>
</html>