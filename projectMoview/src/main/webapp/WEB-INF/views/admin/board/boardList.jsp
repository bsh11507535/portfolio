<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
		//검색
		$('#searchBtn').on("click", function(event) {
			self.location = "boardList"
					+ '${pageMaker.makeQuery(1)}'
					+ "&searchType="
					+ $("select option:selected").val()
					+ "&keyword="
					+ $('#keywordInput').val()
					+ "&boardCategory="
					+ "${boardCategory}";
		});
		$('#boardWrite').on("click", function(event) {
			self.location = "/admin/noticeForm";
		});
				//카테고리 변경
		$('#changeCategory').on("click", function() {
			selectBox = $("select[name=selectBox] option:selected").val();
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/boardChange",
				data : {
					boardChange : selectBox,
					boardNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
		//블라인드
		$('#boardBlind').on("click", function() {
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/boardBlind",
				data : {
					boardNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
		//블라인드 해제
		$('#boardUnblind').on("click", function() {
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/boardUnBlind",
				data : {
					boardNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
		//휴지통으로
		$('#toTrachBoard').on("click", function() {
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/boardChange",
				data : {
					boardChange : "0",
					boardNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
		$('#selectReplace').on("click", function() {
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/boardReplace",
				data : {
					boardNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
	});
</script>
<%@ include file="/WEB-INF/views/admin/board/boardSideMenu.jsp"%>
<div class="col-lg-10">
	<c:choose>
		<c:when test="${boardCategory eq 6 }">
			<h3 class="pageTitle">
				<strong>자유게시판</strong>
			</h3>
		</c:when>
		<c:when test="${boardCategory eq 4 }">
			<h3 class="pageTitle">
				<strong>영화리뷰 게시판</strong>
			</h3>
		</c:when>
		<c:when test="${boardCategory eq 3 }">
			<h3 class="pageTitle">
				<strong>Q&A 게시판</strong>
			</h3>
		</c:when>
		<c:when test="${boardCategory eq 1 }">
			<h3 class="pageTitle">
				<strong>공지사항</strong>
			</h3>
		</c:when>
		<c:when test="${boardCategory eq 0 }">
			<h3 class="pageTitle">
				<strong>휴지통</strong>
			</h3>
		</c:when>
		<c:otherwise>
			<h3 class="pageTitle">
				<strong>전체</strong>
			</h3>
		</c:otherwise>
	</c:choose>
	<table class="table table-hover">
		<tr class="active">
			<th width="50"><input type="checkbox" name="checkAll" id="checkAll"></th>
			<th>번호</th>
			<c:choose>
				<c:when test="${boardCategory==''|| boardCategory==null}">
					<th>카테고리</th>
				</c:when>
				<c:when test="${boardCategory=='4'}">
					<th>영화명</th>
					<th>평점</th>
				</c:when>
				<c:when test="${boardCategory=='3'}">
					<th>비밀글 여부</th>
					<th>답변여부</th>
				</c:when>
				<c:when test="${boardCategory=='1'}">
				</c:when>
				<c:when test="${boardCategory=='0'}">
					<th>이전 게시판</th>
				</c:when>
			</c:choose>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
			<c:if test="${boardCategory=='4'||boardCategory=='6'}">
				<th>신고수</th>
				<th>추천수</th>
			</c:if>
			<th>블라인드 상태</th>
		</tr>
		<c:forEach var="board" items="${boardList}">
			<tr class="boardList">
				<td><c:choose>
						<c:when test="${ boardCategory!='0'&&board.boardCategory=='0'}">
						</c:when>
						<c:otherwise>
							<input type="checkbox" name="check" id="check">
						</c:otherwise>
					</c:choose></td>
				<td id="boardNo">${board.boardNo}</td>
				<c:choose>
					<c:when test="${boardCategory=='' || boardCategory==null}">
						<td><c:choose>
								<c:when test="${board.boardCategory eq 0}">
									<span class="redAlert">휴지통</span>
								</c:when>
								<c:when test="${board.boardCategory eq 1}">
									<span class="orangeAlert">공지사항</span>
								</c:when>
								<c:when test="${board.boardCategory eq 2}">
									<span class="orangeAlert">Q&A</span>
								</c:when>
								<c:when test="${board.boardCategory eq 3}">
									<span class="orangeAlert">FQA</span>
								</c:when>
								<c:when test="${board.boardCategory eq 4}">
									<span>영화리뷰</span>
								</c:when>
								<c:when test="${board.boardCategory eq 5}">
									<span>질문</span>
								</c:when>
								<c:when test="${board.boardCategory eq 6}">
									<span>자유</span>
								</c:when>
								<c:otherwise>
									<span class="error">ERROR.</span>
								</c:otherwise>
							</c:choose></td>
					</c:when>
					<c:when test="${boardCategory=='4'}">
						<td><a href=""
							onclick="javascript:window.open('/admin/movieDBDetail?movieNo=${board.movieNo}&type=1','popup movieDB${board.movieNo}','scrollbars=no, resizable=no')"
						><c:out value="${board.movieNm}" /></a></td>
						<td><c:out value="${board.boardRating}" /></td>
					</c:when>
					<c:when test="${boardCategory=='3'}">
						<td><c:choose>
								<c:when test="${board.boardSecret==0}">
									일반글
								</c:when>
								<c:when test="${board.boardSecret==1}">
									비밀글
								</c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${board.boardAnswer==0}">
									미답변
								</c:when>
								<c:when test="${board.boardAnswer==1}">
									답변완료
								</c:when>
							</c:choose></td>
					</c:when>
					<c:when test="${boardCategory=='1'}">
					</c:when>
					<c:when test="${boardCategory=='0'}">
						<td><c:choose>
								<c:when test="${board.boardBeforeCt eq 1}">
									<span class="orangeAlert">공지사항</span>
								</c:when>
								<c:when test="${board.boardBeforeCt eq 2}">
									<span class="orangeAlert">Q&A</span>
								</c:when>
								<c:when test="${board.boardBeforeCt eq 3}">
									<span class="orangeAlert">FQA</span>
								</c:when>
								<c:when test="${board.boardBeforeCt eq 4}">
									<span>영화리뷰</span>
								</c:when>
								<c:when test="${board.boardBeforeCt eq 5}">
									<span>질문</span>
								</c:when>
								<c:when test="${board.boardBeforeCt eq 6}">
									<span>자유</span>
								</c:when>
								<c:otherwise>
									<span class="error">ERROR.</span>
								</c:otherwise>
							</c:choose></td>
					</c:when>
				</c:choose>
				<td><a href="#"
					onclick="javascript:window.open('/admin/boardDetail?boardNo=${board.boardNo}&boardCategory=${board.boardCategory}','popup board${board.boardNo}','scrollbars=no, resizable=no')"
				>${board.boardTitle }</a></td>
				<td><a href="#"
					onclick="javascript:window.open('/admin/userDetail?userNo=${board.userNo}','popup user${board.userNo}','scrollbars=no, resizable=no')"
				>${board.userName}</a></td>
				<td><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd" /></td>
				<td>${board.boardHit}</td>
				<c:if test="${boardCategory=='4'||boardCategory=='6'}">
					<td>${board.boardCall}</td>
					<td>${board.boardGood}</td>
				</c:if>
				<td><c:choose>
						<c:when test="${board.boardStatus eq 0}">
							<span>정상</span>
						</c:when>
						<c:when test="${board.boardStatus eq 1}">
							<span class="redAlert">블라인드</span>
						</c:when>
						<c:otherwise>
							<span class="error">ERROR.</span>
						</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>

	<div class="paging">
		<ul class="pagination pagination-sm">
			<c:if test="${pageMaker.prev }">
				<li><a href="boardList${pageMaker.makeSearch(pageMaker.startPage-1) }&boardCategory=${boardCategory}">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>><a
					href="boardList${pageMaker.makeSearch(idx)}&boardCategory=${boardCategory}"
				>${idx }</a></li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
				<li><a href="boardList${pageMaker.makeSearch(pageMaker.endPage+1) }&boardCategory=${boardCategory}">&raquo;</a></li>
			</c:if>
		</ul>
	</div>

	<div class="col-lg-6 form-inline controlPanel">
		<c:choose>
			<c:when test="${boardCategory=='1' ||boardCategory=='2'}">
			</c:when>
			<c:otherwise>
				<select class="form-control" name="SearchType">
					<option value="notice" <c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
					<option value="na" <c:out value="${cri.searchType eq 'na'?'selected':'' }"/>>작성자</option>
					<option value="ti" <c:out value="${cri.searchType eq 'ti'?'selected':'' }"/>>제목</option>
					<option value="no" <c:out value="${cri.searchType eq 'no'?'selected':'' }"/>>번호</option>
					<option value="natino" <c:out value="${cri.searchType eq 'natino'?'selected':'' }"/>>작성자 & 제목 & 번호</option>
				</select>
				<input type="text" class="form-control" id="keywordInput" value='${cri.keyword }'>
				<input type="button" class="btn btn-default" id="searchBtn" value="검색">
			</c:otherwise>
		</c:choose>
	</div>
	<div class="col-lg-6 form-inline">
		<div class="pull-right">
			<c:choose>
				<c:when test="${boardCategory=='2' }">
					<input type="button" class="btn btn-default"
						onclick="javascript:window.open('/admin/writeForm?boardCategory=${boardCategory}','popup','scrollbars=no, resizable=no, height=700px, width=800px')"
						value="Q&A작성"
					>
					<input type="button" class="btn btn-default" id="toTrachBoard" value="휴지통으로">
				</c:when>
				<c:when test="${boardCategory=='1' }">
<!-- 										<option value="none" selected="selected">---</option> -->

<!-- 									<select name="classfication"> -->
<!-- 										<option value="free">자유 게시판</option> -->
<!-- 										<option value="question">질문 게시판</option> -->
<!-- 										<option value="review">리뷰 게시판</option> -->
<!-- 										<option value="qna">Q&A 게시판</option> -->
<!-- 									</select> -->
<!-- 									<input type="button" id="Change Category" value="상단공지 변경"> -->
					<input type="button" class="btn btn-default"
						onclick="javascript:window.open('/admin/writeForm?boardCategory=${boardCategory}','popup','scrollbars=no, resizable=no, height=700px, width=800px')"
						value="공지작성"
					>
					<input type="button" class="btn btn-default" id="toTrachBoard" value="휴지통으로">
				</c:when>
				<c:when test="${boardCategory=='0' }">
					<input type="button" class="btn btn-default" id="selectReplace" value="복구">
				</c:when>
				<c:otherwise>
<!-- 	<option value="none" selected="selected">---</option> -->
<%-- 									<c:if test="${boardCategory=='5'||boardCategory=='6' }"> --%>
<!-- 										<select name="selectBox"> -->
<!-- 											<option value="free">자유 게시판</option> -->
<!-- 											<option value="question">질문 게시판</option> -->
<!-- 										</select> -->
<!-- 										<input type="button" id="changeCategory" value="카테고리 변경"> -->
<%-- 									</c:if> --%>
					<input type="button" class="btn btn-default" id="boardBlind" value="블라인드">
					<input type="button" class="btn btn-default" id="boardUnblind" value="블라인드 해제">
					<input type="button" class="btn btn-default" id="toTrachBoard" value="휴지통으로">
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
</div>
</body>
</html>