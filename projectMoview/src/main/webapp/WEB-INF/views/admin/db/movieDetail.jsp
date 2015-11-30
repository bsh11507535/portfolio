<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${boxoffice.showRange }영화</title>
</head>
<body>
	<table id="movieStatus" border="1">
		<tr>
			<th colspan="2">영화 코드</th>
			<th colspan="2">영화명(국문)</th>
			<td colspan="5">${movieInfo.movieNm}</td>
		</tr>
		<tr>
			<td colspan="2">${movieInfo.movieNo}</td>
			<th colspan="2">영화명(원문)</th>
			<td colspan="5">${movieInfo.movieOg}</td>
		</tr>
		<tr>
			<th colspan="2">상영시간</th>
			<th colspan="2">제작 국가</th>
			<th colspan="2">개봉 연도</th>
			<th colspan="3">포스터</th>

		</tr>
		<tr>
			<td colspan="2">${movieInfo.movieShowTm}분</td>
			<td colspan="2">${movieInfo.movieNation}</td>
			<td colspan="2">${movieInfo.movieOpenDt}년도</td>
			<td colspan="3" rowspan="5"><img
				src="/displayPoster?fileName=${movieInfo.moviePoster}"></td>
		</tr>
		<tr>
			<th colspan="2">영화 감독</th>
			<th colspan="2">장르</th>
			<th colspan="2">등급</th>
		</tr>
		<tr>
			<td colspan="2">${movieInfo.movieDirectorNo}</td>
			<td colspan="2">${movieInfo.genreNm }</td>
			<td colspan="2">${movieInfo.movieWatch}</td>
		</tr>

		<tr>
			<th colspan="6">줄거리</th>
		</tr>
		<tr>
			<td colspan="6"><textarea cols="50" rows="6" name="story">${movieInfo.movieStory }</textarea></td>
		</tr>
		<tr>
			<th colspan="9">출연진</th>
		</tr>
		<tr>
			<th><input type="checkbox" id="checkAll" name="checkAll"></th>
			<th colspan="4">배우명</th>
			<th colspan="4">배역</th>
		</tr>
		<tr>
			<td><input type="checkbox" id="check" name="check"></td>
			<!-- 형태 보는용도, 실제로 쓰는거 아님 -->
			<td colspan="4"><input type="text" id="peopleNm" name="peopleNm"></td>
			<td colspan="4"><input type="text" id="castNm" name="castNm"></td>
			<!-- 실제로 쓰는거 아님! -->
		</tr>
		<tr>
			<td colspan="9" class="controlPanel"><input type="button"
				value="영화 수정" id="boxofficeEdit"></td>
		</tr>
	</table>

	<table id="movieEval" border="1">
		<tr>
			<th><input type="checkbox" name="checkAll" id="checkAll"></th>
			<th>번호</th>
			<th>평점</th>
			<th>답변 내용</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>신고수</th>
			<th>추천수</th>
			<th>블라인드</th>
		</tr>
		<c:forEach var="eval" items="${evalList }">
			<tr>
				<td><input type="checkbox" name="check" id="check"></td>
				<td><c:out value="${eval.evalNo }" /></td>
				<td><c:out value="${eval.evalRating }" /></td>
				<td><c:out value="${eval.evalContent }" /></td>
				<td><a href="#"
					onclick="javascript:window.open('/admin/userDetail?userNo=${eval.userNo}','popup user${eval.userNo}','scrollbars=no, resizable=no')"><c:out
							value="${eval.userName }" /></a></td>
				<td><fmt:formatDate value="${eval.evalDate }"
						pattern="yyyy/MM/dd  hh:mm:ss" />
				<td><c:out value="${eval.evalCall }" /></td>
				<td><c:out value="${eval.evalGood }" /></td>
				<td><c:out value="${eval.evalStatus }" /></td>
			</tr>
		</c:forEach>
		<tr class="pagecode">
			<td class="paging" colspan="9" height="40">
				<ul class="pagination">
					<c:choose>
						<c:when test="${pageMaker.totalCount==0}">
							작성된 글이 없습니다
							</c:when>
						<c:otherwise>
							<c:if test="${pageMaker.prev }">
								<li><a
									href="movieDBDetail${pageMaker.makeQuery(pageMaker.startPage-1) }&movieNo=${movieInfo.movieNo}">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>>
									<a
									href="movieDBDetail${pageMaker.makeQuery(idx)}&movieNo=${movieInfo.movieNo}">${idx }</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
								<li><a
									href="movieDBDetail${pageMaker.makeQuery(pageMaker.endPage+1) }&movieNo=${movieInfo.movieNo}">&raquo;</a></li>
							</c:if>
						</c:otherwise>
					</c:choose>

				</ul>
			</td>
		</tr>

		<tr>
			<td colspan="9" class="controlPanel">
			<input type="button" class="btn btn-default" id="blind" value="블라인드">
			<input type="button" class="btn btn-default" id="unblind" value="블라인드 해제">
			<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
				</td>
		</tr>
	</table>
	</div>
</body>
</html>