<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/header.jsp"%>
<%@include file="/WEB-INF/views/admin/db/dbSideMenu.jsp"%>

<div class="col-lg-10">
	<h3 class="pageTitle">
		<strong>박스오피스</strong>
	</h3>
	<table class="table table-hover">
		<tr class="active">
			<th><input type="checkbox" name="checkAll" id="checkAll"></th>
			<th>번호</th>
			<th>등록일</th>
			<th>작성자</th>
		</tr>

		<c:forEach var="boxoffice" items="${boxofficeList}">
			<tr>
				<td><input type="checkbox" name="check" id="check"></td>
				<td><c:out value="${boxoffice.dateNo}" /></td>
				<td><a href="#"
					onclick="javascript:window.open('/admin/movieDBDetail?dateNo=${boxoffice.dateNo}&type=0','popup  boxoffice${boxoffice.dateNo}','scrollbars=no, resizable=no')"
				><c:out value="${boxoffice.boxOfDate}" />일자 박스오피스</a></td>
				<td><a href="#"
					onclick="javascript:window.open('/admin/userDetail?userNo=${boxoffice.userNo}','popup user${boxoffice.userNo}','scrollbars=no, resizable=no')"
				><c:out value="${boxoffice.userName}" /></a></td>
			</tr>
		</c:forEach>
	</table>

	<div class="paging">
		<ul class="pagination pagination-sm">
			<c:if test="${pageMaker.prev }">
				<li><a href="movieDBList${pageMaker.makeSearch(pageMaker.startPage-1) }&type=${type}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>><a href="movieDBList${pageMaker.makeSearch(idx)}&type=0">${idx }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="movieDBList${pageMaker.makeSearch(pageMaker.endPage+1) }&type=0">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<div class="col-lg-12">
	<div class="pull-right">
		<input type="button" class="btn btn-default" id="Manual Write" onclick="javascript:window.open('/admin/writeBoxOfficeForm','popup ','scrollbars=no, resizable=no')" value="박스오피스 작성">
		<input type="button" class="btn btn-default" id="Boxoffice Delete" value="삭제">
	</div>
	</div>
</div>
</div>
</body>
</html>