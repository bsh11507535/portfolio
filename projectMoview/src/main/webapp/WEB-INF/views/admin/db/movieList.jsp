<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/header.jsp"%>
<%@include file="/WEB-INF/views/admin/db/dbSideMenu.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('#boxofficeDelete').on("click", function() {
			selectBox = $("select[name=selectBox] option:selected").val();
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataMovie = $(this).parent().parent().find("#movieNo").text();
				data[i] = dataMovie;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/movieDelete",
				data : {
					movieNo : data
				},
				success : function(data) {
					self.location.reload();

				}
			});
		});
	});
</script>

<div class="col-lg-10">
	<h3 class="pageTitle">영화 DB</h3>
	<table class="table table-hover">
		<tr class="active">
			<th><input type="checkbox" name="checkAll" id="checkAll"></th>
			<th>No.</th>
			<th>장르</th>
			<th>영화 제목</th>
			<th>상영시간</th>
			<th>개봉연도</th>
			<th>감독</th>
			<th>제작 국가</th>
		</tr>

		<c:forEach var="movie" items="${movieList}">
			<tr>
				<td><input type="checkbox" name="check" id="check"></td>
				<td id="movieNo"><c:out value="${movie.movieNo}" /></td>
				<td><c:out value="${movie.genreNm}" /></td>
				<td><a href="#"
					onclick="javascript:window.open('/admin/movieDBDetail?movieNo=${movie.movieNo}&type=1','popup movie${movie.movieNo}','scrollbars=no, resizable=no')"
				><c:out value="${movie.movieNm}" /></a></td>
				<td><c:out value="${movie.movieShowTm}" />분</td>
				<td><c:out value="${movie.movieOpenDt}" />년도</td>
				<td><a href="#"><c:out value="${movie.movieDirectorNo}" /></a></td>
				<td><c:out value="${movie.movieNation}" /></td>
			</tr>
		</c:forEach>
	</table>

	<div class="paging">
		<ul class="pagination pagination-sm">
			<c:if test="${pageMaker.prev }">
				<li><a href="movieDBList${pageMaker.makeSearch(pageMaker.startPage-1) }&type=${type}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>><a href="movieDBList${pageMaker.makeSearch(idx)}&type=${type}">${idx }</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="movieDBList${pageMaker.makeSearch(pageMaker.endPage+1) }&type=${type}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>

<div class="col-lg-6 form-inline controlPanel">
	<select name="SearchType" class="form-control">
		<option value="ti">제목</option>
		<option value="no">번호</option>
		<option value="tino">제목 & 번호</option>
	</select> <input type="text" class="form-control">
	<input type="button" class="btn btn-default" value="검색">
</div>
<div class="col-lg-6 form-inline">
	<div class="pull-right">
		<input type="button" class="btn btn-default" id="Manual Write" value="영화 추가" onclick="javascript:window.open('/admin/writeMovieForm','popup movieWriteFrom','scrollbars=no, resizable=no')">
		<input type="button" class="btn btn-danger" id="boxofficeDelete" value="삭제">
	</div>
</div>
</div>
</div>
</div>

</body>
</html>