<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/header.jsp" %>
<%@include file="/WEB-INF/views/admin/db/dbSideMenu.jsp" %>
<link href="/resources/css/admin.css" rel="stylesheet" type="text/css" />


		<div class="list">
	<h3>상영관</h3>
			<table id = "list" name="list" border="1">
				<tr>
					<th width="50"><input type = "checkbox" name = "checkAll" id = "checkAll"></th>
					<th>번호</th>
					<th>상영관</th>
					<th>소속상영관</th>
					<th>상영지역</th>
					<th>상영관 URL</th>
				</tr>
				
				<c:forEach var="theater" items="${theater}">
					<tr>
						<td><input type="checkbox" name = "check" id = "check"></td>
						<td><c:out value="${theater.theaterNo}" /></td>
						<td><a href = "#"><c:out value="${theater.theaterNm}" /></a></td>
						<td><c:out value="${theater.theaterClub}" /></td>
						<td><c:out value="${theater.theaterArea}" /></td>
						<td><a href="#"><c:out value="${theater.theaterURL}" /></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td class="paging" colspan="6" height="40">${pagecode}페이징</td>
				</tr>
				<tr>
					<td colspan="3" class="search">
						<select name="SearchType">
								<option value = "na">Name</option>
								<option value = "cl">Club</option>
								<option value = "ar">Area</option>
								<option value = "naclar">Name & Club & Area</option>
						</select>
						<input type="text">
						<input type="button" value="Search">
					</td>
					<td colspan="3" class="controlPanel">
						<input type="button" class="btn btn-default" id="Manual Write" value = "상영관 작성">
						<input type="button" class="btn btn-default" id="Boxoffice Delete" value = "삭제">
					</td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file = "/resources/js/admin.js" %>
</body>
</html>