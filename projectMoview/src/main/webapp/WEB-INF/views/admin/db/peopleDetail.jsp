<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${people.peopleNm } 상세정보</title>
</head>
<body>
	<table id = "peopleStatus">
		<tr>
			<th colspan="3">이름</th>
		</tr>
		<tr>
			<td>${people.peopleNm }</td>
		</tr>
		<tr>
			<th width="50"><input type = "checkbox" name = "checkAll" id = "checkAll"></th>
			<th>출연영화</th>
			<th>배역명</th>
		</tr>
		<c:forEach var="people" items="#{people }">
			<tr>
				<td><input type="checkbox" name = "check" id = "check"></td>
				<td>${people.movieNm }</td>
				<td>${people.castNm }</td>
			</tr>
		</c:forEach>
		<tr>
			<th colspan="3">추가</th>
		</tr>
		<tr>
			<th colspan="2">출연영화</th>
			<th>배역명</th>
		</tr>
		<tr>
			<td colspan="2"><input type = "text"></td>
			<td><input type = "text"></td>
		</tr>
		<tr>
			<td colspan="3" class="controlPanel">
			<input type = "button" value = "인물 수정" id = "peopleEdit">
			<input type = "button" value = "삭제" id = "delete">
			<input type="button" id="Window Close" value="창 닫기"
					onclick="javascript:window.open('about:blank', '_self').close()"
				></td>
		</tr>
	</table>
	</div>
	<script src="//code.jquery.com/jquery-1.11.3.min.js"></script>
	<script type="text/javascript"></script>
	<%@ include file = "/resources/js/admin.js" %>
</body>
</html>