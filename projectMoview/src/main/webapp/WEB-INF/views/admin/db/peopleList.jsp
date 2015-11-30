<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/header.jsp" %>
<%@include file="/WEB-INF/views/admin/db/dbSideMenu.jsp" %>
<link href="/resources/css/admin.css" rel="stylesheet" type="text/css" />


		<div class="list">
	<h3>인물</h3>
			<table id = "list" name="list" border="1">
				<tr>
					<th width="50"><input type = "checkbox" name = "checkAll" id = "checkAll"></th>
					<th width="50" colspan="7" >이름</th>
				</tr>
				
				<c:forEach var="people" items="${people}">
					<tr>
						<td><input type="checkbox" name = "check" id = "check"></td>
						<td><a href = "#"><c:out value="${people.peopleNm}" /></a></td>
					</tr>
				</c:forEach>
				<tr>
					<td class="paging" colspan="8" height="40">${pagecode}페이징</td>
				</tr>
				<tr>
					<td colspan="3" class="search">
						<select name="SearchType">
								<option value = "da">Date</option>
								<option value = "no">No.</option>
								<option value = "dano">Date & No.</option>
						</select>
						<input type="text">
						<input type="button" value="Search">
					</td>
					<td colspan="5" class="controlPanel">
						<input type="button" id="Manual Write" value = "인물 작성">
						<input type="button" id="Boxoffice Delete" value = "삭제">
					</td>
				</tr>
			</table>
		</div>
	</div>
	<%@ include file = "/resources/js/admin.js" %>
</body>
</html>