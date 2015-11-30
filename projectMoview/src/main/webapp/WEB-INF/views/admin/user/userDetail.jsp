<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${userInfo.userMail}님의상세페이지</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#boardBlind').on("click", function() {
			var data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
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
		$('#boardUnblind').on("click", function() {
			var data = [];
			$('input[name=check]:checked').each(function(i) {
				dataBoard = $(this).parent().parent().find("#boardNo").text();
				data[i] = dataBoard;
			});
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
	});
</script>
<script type="text/javascript">
	$(document).ready(function() {
		//제제 변경
		$('#statusChange').on("click", function() {
			var selectBox = $("select[name=selectBox] option:selected").val();
			if(selectBox != "none"){
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					method : "POST",
					url : "/admin/statusChange",
					data : {
						statusChange : selectBox,
						userNo : "${userInfo.userNo}"
					},
					success : function(data) {
						self.location.reload();
					}
				});
			} else {
				alert("다시 선택하세요.");
			}
		});
		//비번 변경
		$('#rePasswordCheck').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/userRePassword",
				data : {
					userNo : "${userInfo.userNo}"
				},
				success : function(data) {
					self.location.reload();

				}
			});
		});
		$('#userCheckMail').on("click", function() {
			$.ajax({
				method : "POST",
				url : "/admin/userCheckMail",
				data : {
					userNo : data
				},
				success : function(data) {
					self.location.reload();

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
				<tr class="active">
					<th>닉네임</th>
					<th>이메일</th>
					<th>등록일</th>
					<th>최종 접속일</th>
				</tr>
				<tr>
					<td><c:out value="${userInfo.userName}" /></td>
					<td><c:out value="${userInfo.userMail}" /></td>
					<td><fmt:formatDate value="${userInfo.userJoin}" pattern="yyyy-MM-dd" /></td>
					<td><fmt:formatDate value="${userInfo.userAcc}" pattern="yyyy-MM-dd" /></td>


				</tr>
				<tr class="active">
					<th>메일인증 여부</th>
					<th>제제 상태</th>
					<th>제제 시작일</th>
					<th>활동 여부</th>
				</tr>
				<tr>
					<td><c:choose>
							<c:when test="${userInfo.userCheck eq 0}">
								<span class="redAlert">미인증</span>
							</c:when>
							<c:when test="${userInfo.userCheck eq 1}">
							인증
						</c:when>
							<c:otherwise>
								<span class="error">ERROR.</span>
							</c:otherwise>
						</c:choose></td>
					<td><c:choose>
							<c:when test="${userInfo.userStatus eq 1}">
							정상
						</c:when>
							<c:when test="${userInfo.userStatus eq 2}">
								<span class="orangeAlert">7일 제제</span>
							</c:when>
							<c:when test="${userInfo.userStatus eq 3}">
								<span class="orangeAlert">30일 제제</span>
							</c:when>
							<c:when test="${userInfo.userStatus eq 4}">
								<span class="redAlert">영구정지</span>
							</c:when>
							<c:otherwise>
								<span class="error">ERROR.</span>
							</c:otherwise>
						</c:choose></td>
					<td><fmt:formatDate value="${userInfo.userBlind}" pattern="yyyy-MM-dd" /></td>
					<td><c:choose>
							<c:when test="${userInfo.userLevel == '0'}">
							활동
						</c:when>
							<c:when test="${userInfo.userLevel eq 1}">
								<span class="orangeAlert">장기 미접속자</span>
							</c:when>
							<c:when test="${userInfo.userLevel eq 9}">
								<span class="redAlert">관리자</span>
							</c:when>
							<c:otherwise>
								<span class="error">ERROR.</span>
							</c:otherwise>
						</c:choose></td>
				</tr>
			</table>
		</div>
		
		<div class="col-lg-12">
			<div class="pull-right form-inline">
				<select class="form-control" name="selectBox">
					<option value="none" selected="selected">---</option>
					<option value="activate">정상</option>
					<option value="week">7일</option>
					<option value="month">30일</option>
					<option value="deactivate">영구정지</option>
				</select> <input type="button" class="btn btn-danger" id="statusChange" value="제제 변경"> <input type="button" class="btn btn-primary"
					id="userCheckMail" value="인증메일 전송"
				> <input type="button" class="btn btn-warning" id="rePasswordCheck" value="체크 비밀번호 초기화">
			</div>
		</div>
		<hr>
		<div class="col-lg-12">
			<table class="table table-hover">
				<tr class="active">
					<th><input type="checkbox" name="checkAll" id="checkAll"></th>
					<th>번호</th>
					<th>카테고리</th>
					<th>제목</th>
					<th>작성일</th>
					<th>신고수</th>
					<th>블라인드여부</th>
				</tr>
				<c:forEach var="board" items="${boardList}">
					<tr class="boardList">
						<td><input type="checkbox" name="check" id="check"></td>
						<td id="boardNo"><c:out value="${board.boardNo}" /></td>
						<c:choose>
							<c:when test="${board.boardCategory==6}">
								<td>자유게시판</td>
							</c:when>
							<c:when test="${board.boardCategory==5}">
								<td>질문게시판</td>
							</c:when>
							<c:when test="${board.boardCategory==4}">
								<td>영화 리뷰게시판</td>
							</c:when>
							<c:when test="${board.boardCategory==3}">
								<td>Q&A</td>
							</c:when>
							<c:when test="${board.boardCategory==2}">
								<td>자주찾는 Q&A</td>
							</c:when>
							<c:when test="${board.boardCategory==1}">
								<td>공지사항</td>
							</c:when>
							<c:when test="${board.boardCategory==0}">
								<td>휴지통</td>
							</c:when>
						</c:choose>
						<td><a href="#"
							onclick="javascript:window.open('/admin/boardDetail?boardNo=${board.boardNo}&boardCategory=${board.boardCategory}','popup board${board.boardNo}','scrollbars=no, resizable=no')"
						><c:out value="${board.boardTitle}" /></a></td>
						<td><fmt:formatDate value="${board.boardDate}" pattern="yyyy-MM-dd" /></td>
						<td><c:out value="${board.boardCall}" /></td>
						<td><c:choose>
								<c:when test="${board.boardStatus eq 0}">
									<span>정상</span>
								</c:when>
								<c:when test="${board.boardStatus eq 1}">
									<span class="reaAlert">블라인드</span>
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
				<c:choose>
					<c:when test="${pageMaker.totalCount==0}">
							작성된 글이 없습니다
							</c:when>
					<c:otherwise>
						<c:if test="${pageMaker.prev }">
							<li><a href="userDetail${pageMaker.makeQuery(pageMaker.startPage-1) }&userNo=${userInfo.userNo}">&laquo;</a></li>
						</c:if>

						<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
							<li <c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>><a
								href="userDetail${pageMaker.makeQuery(idx)}&userNo=${userInfo.userNo}"
							>${idx }</a></li>
						</c:forEach>

						<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
							<li><a href="userDetail${pageMaker.makeQuery(pageMaker.endPage+1) }&userNo=${userInfo.userNo}">&raquo;</a></li>
						</c:if>
					</c:otherwise>
				</c:choose>

			</ul>
			</div>
			<div class="col-lg-12">
			<input type="button" class="btn btn-default" id="boardBlind" value="블라인드">
			<input type="button" class="btn btn-default" id="boardUnblind"
					value="블라인드 해제"
				> <input type="button" class="btn btn-default" id="toTrachBoard" value="휴지통으로">
			</div>
		</div>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
</body>
</html>