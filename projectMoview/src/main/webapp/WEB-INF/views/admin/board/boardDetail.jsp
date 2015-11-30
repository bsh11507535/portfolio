<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${boardInfo.boardNo }번글</title>
<script type="text/javascript">
	$(document).ready(function() {
		//블라인드
		$('#boardBlind').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/boardBlind",
				data : {
					boardNo : "${boardInfo.boardNo }"
				},
				success : function(data) {
					self.location.reload();
					opener.parent.location.reload();
				}
			});
		});
		//블라인드 해제
		$('#boardUnblind').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/boardUnBlind",
				data : {
					boardNo : "${boardInfo.boardNo }"
				},
				success : function(data) {
					self.location.reload();
					opener.parent.location.reload();
				}
			});
		});
		//휴지통으로
		$('#toTrachBoard').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/boardChange",
				data : {
					boardChange : "0",
					boardNo : "${boardInfo.boardNo }"
				},
				success : function(data) {
					self.location.reload();
					opener.parent.location.reload();
				}
			});
		});
		$('#selectReplace').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/boardReplace",
				data : {
					boardNo : "${boardInfo.boardNo }"
				},
				success : function(data) {
					self.location.reload();
					opener.parent.location.reload();
				}
			});
		});
		//답글 작성
		$('#replyQA').on("click", function() {
			replyContent = $("#replyContent").val();
			console.log(replyContent);
			$.ajax({
				method : "POST",
				url : "/admin/replyQA",
				data : {
					boardNo : "${boardInfo.boardNo }",
					replyContent : replyContent
				},
				success : function(data) {
					self.location.reload();
					opener.parent.location.reload();
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="col-lg-12">
			<table class="table table-hover">
				<tr>
					<c:choose>
						<c:when test="${boardCategory=='6' }">
							<th colspan="2" class="active">자유게시판</th>
						</c:when>
						<c:when test="${boardCategory=='5' }">
							<th colspan="2" class="active">질문게시판</th>
						</c:when>
						<c:when test="${boardCategory=='4' }">
							<th colspan="2" class="active">영화 리뷰게시판</th>
						</c:when>
						<c:when test="${boardCategory=='3' }">
							<th colspan="2" class="active">Q&A</th>
						</c:when>
						<c:when test="${boardCategory=='2' }">
							<th colspan="2" class="active">자주찾는 Q&A</th>
						</c:when>
						<c:when test="${boardCategory=='1' }">
							<th class="active">공지사항</th>
						</c:when>
						<c:when test="${boardCategory=='0' }">
							<th colspan="2" class="active">휴지통</th>
						</c:when>
					</c:choose>
					<td colspan="6">${boardInfo.boardTitle }</td>
				</tr>
				<tr class="active">
					<th colspan="2">번호</th>
					<th>작성자</th>
					<th>작성시간</th>
					<th>조회수</th>
					<c:if test="${boardCategory=='4'||boardCategory=='6'}">
						<th>신고수</th>
						<th>추천수</th>
					</c:if>
					<th>블라인드여부</th>
					<c:if test="${boardCategory=='3'}">
						<th>비밀글여부</th>
						<th>답변상태</th>
					</c:if>
	
				</tr>
				<tr>
					<td colspan="2">${boardInfo.boardNo }</td>
					<td><a href="#"
						onclick="javascript:window.open('/admin/userDetail?userNo=${boardInfo.userNo}','popup user${boardInfo.userNo}','scrollbars=no, resizable=no')">${boardInfo.userName}</a></td>
					<td><fmt:formatDate value="${boardInfo.boardDate }"
							pattern="yyyy-MM-dd" /></td>
					<td>${boardInfo.boardHit }</td>
					<c:if test="${boardCategory=='4'||boardCategory=='6' }">
						<td>${boardInfo.boardCall }</td>
						<td>${boardInfo.boardGood }</td>
					</c:if>
					<td><c:choose>
							<c:when test="${boardInfo.boardStatus eq 0}">
								<span>정상</span>
							</c:when>
							<c:when test="${boardInfo.boardStatus eq 1}">
								<span class="reaAlert">블라인드</span>
							</c:when>
							<c:otherwise>
								<span class="error">ERROR.</span>
							</c:otherwise>
						</c:choose></td>
	
					<c:if test="${boardCategory=='3'}">
						<td><c:choose>
								<c:when test="${boardInfo.boardSecret==0}">
										일반글
									</c:when>
								<c:when test="${boardInfo.boardSecret==1}">
										비밀글
									</c:when>
							</c:choose></td>
						<td><c:choose>
								<c:when test="${boardInfo.boardAnswer==0 }">
											미답변
										</c:when>
								<c:when test="${boardInfo.boardAnswer==1 }">
											답변완료
										</c:when>
							</c:choose></td>
					</c:if>
				</tr>
				<c:if test="${boardCategory=='4'}">
					<tr>
						<th colspan="2">선택 영화</th>
						<td colspan="3"><a href=""
							onclick="javascript:window.open('/admin/movieDBDetail?movieNo=${boardInfo.movieNo}','popup movieDB${boardInfo.movieNo}','scrollbars=no, resizable=no')">${boardInfo.movieNm }</a></td>
						<th>평점</th>
						<td colspan="2">${boardInfo.boardRating }</td>
					</tr>
				</c:if>
				<tr>
					<td id="boardContent" colspan="8">${boardInfo.boardContent }</td>
				</tr>
				<!-- 			여기부터는 글내용과 댓글 -->
				<c:choose>
					<c:when test="${boardCategory=='6'||boardCategory=='4'}">
						<tr>
							<th><input type="checkbox" name="checkAll" id="checkAll"></th>
							<th>번호</th>
							<th>댓글내용</th>
							<th>작성자</th>
							<th>작성시간</th>
							<th>신고수</th>
							<th>추천수</th>
							<th>블라인드</th>
						</tr>
						<!-- 					댓글 -->
						<c:forEach var="reply" items="${replyList }">
							<tr>
								<td><input type="checkbox" name="check" id="check"></td>
								<td><c:out value="${reply.commentNo }" /></td>
								<td><c:out value="${reply.commentContent }" /></td>
								<td><a href="#"
									onclick="javascript:window.open('/admin/userDetail?userNo=${reply.userNo}','popup ${reply.userNo}','scrollbars=no, resizable=no')"><c:out
											value="${reply.userName }" /></a></td>
								<td><fmt:formatDate value="${reply.commentDate }"
										pattern="yyyy-MM-dd" /></td>
								<td><c:out value="${reply.commentCall }" /></td>
								<td><c:out value="${reply.commentGood }" /></td>
								<td><c:out value="${reply.commentStatus }" /></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:when test="${boardCategory=='3'}">
	
						<c:choose>
							<c:when test="${answer!=null}">
								<tr>
									<th>번호</th>
									<th colspan="4">답변 내용</th>
									<th>작성자</th>
									<th colspan="2">작성시간</th>
								</tr>
								<tr>
									<td><c:out value="${answer.commentNo }" /></td>
									<td colspan="4"><c:out value="${answer.commentContent }" /></td>
									<td><a href="#"><c:out value="${answer.userName }" /></a></td>
									<td colspan="2"><fmt:formatDate
											value="${answer.commentDate }" pattern="yyyy-MM-dd" /></td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<th colspan="8">답변 입력</th>
								</tr>
								<tr>
									<td colspan="6"><textarea id="replyContent"></textarea></td>
									<td colspan="2">
										<input type="button" class="btn btn-default" value="작성" id="replyQA">
									</td>
								</tr>
							</c:otherwise>
						</c:choose>
	
					</c:when>
					<c:when test="${boardCategory=='1'}">
						<tr class="active">
							<th><input type="checkbox" name="checkAll" id="checkAll"></th>
							<th colspan="2">파일명</th>
							<th colspan="2">저장시간</th>
							<th>파일 용량</th>
						</tr>
						<c:forEach var="file" items="${fileList }">
							<tr>
								<td><input type="checkbox" name="check" id="check"></td>
								<td colspan="2"><c:out value="${file.fileName }" /></td>
								<td colspan="2"><c:out value="${file.fileDate }" /></td>
								<td><c:out value="${file.fileSize }" /></td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${boardCategory=='1'}">
						<tr>
							<td colspan="8" class="controlPanel">
	<!-- 						<select name="classfication"> -->
	<!-- 								<option value="alert">중요</option> -->
	<!-- 								<option value="event">이벤트</option> -->
	<!-- 						</select>
	<!-- 						<input type="button" id="Change Category" value="분류 변경"> -->
								<input type="button" class="btn btn-default" value="내용 수정" id="boardRewrite"
								onclick="javascript:window.open('/admin/updateForm?boardNo=${boardInfo.boardNo }','popup','scrollbars=no, resizable=no, height=700px, width=800px')">
	<!-- 							<input type="button" value="파일업로드" id="fileUpload">
	<!-- 							<input type="button" value="파일삭제" id="fileDelete">  -->
								<input type="button" class="btn btn-default" value="휴지통으로" id="toTrachBoard">
							</td>
						</tr>
					</c:when>
					<c:when test="${boardCategory=='0'}">
						<tr>
							<td colspan="8" class="controlPanel">
							<input type="button" id="selectReplace" value="복구"></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="8" class="controlPanel">
	<!-- 								<select name="blind"> -->
	<!-- 										<option value="free">자유 게시판</option> -->
	<!-- 										<option value="question">질문 게시판</option> -->
	<!-- 										<option value="review">리뷰 게시판</option> -->
	<!-- 										<option value="qna">Q&A 게시판</option> -->
	<!-- 								</select> <input type="button" value="카테고리 변경" id="change"> -->
								<input type="button" class="btn btn-default" value="블라인드" id="boardBlind">
								<input type="button" class="btn btn-default" value="블라인드 해제" id="boardUnblind">
								<input type="button" class="btn btn-default" value="휴지통으로" id="toTrachBoard">
							</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</table>
			<div class="col-lg-12">
				<div class ="pull-right">
					<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
				</div>
			</div>
	</div>
	</div>
</body>
</html>