<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/admin/header.jsp"%>
<script src="/resources/js/admin.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		
		//검색
		$('#searchBtn').on("click", function(event) {
			self.location = "userList"
				+ '${pageMaker.makeQuery(1)}'
				+ "&searchType="
				+ $("select option:selected").val()
				+ "&keyword="
				+ $('#keywordInput').val()
				+ "&type="
				+ "${type}";
		});
		
		//제제변경
		$('#statusChange').on("click",function() {
			var selectBox = $("select[name=selectBox] option:selected").val();
			if(selectBox != "none"){
				data = [];
				$('input[name=check]:checked').each(function(i) {
					dataUser = $(this).parent().parent().find("#userNo").text();
					data[i] = dataUser;
				});
				console.log(data);
				jQuery.ajaxSettings.traditional = true;
				$.ajax({
					method : "POST",
					url : "/admin/statusChange",
					data : {
						statusChange : selectBox,
						userNo : data
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
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataUser = $(this).parent().parent().find("#userNo").text();
				data[i] = dataUser;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "POST",
				url : "/admin/userRePassword",
				data : {
					userNo : data
				},
				success : function(data) {
					self.location.reload();
				}
			});
		});
		$('#userCheckMail').on("click", function() {
			data = [];
			$('input[name=check]:checked').each(function(i) {
				dataUser = $(this).parent().parent().find("#userNo").text();
				data[i] = dataUser;
			});
			console.log(data);
			jQuery.ajaxSettings.traditional = true;
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
<body>
	<div class="container">
		<div class="col-lg-2 ">
			<div class="panel panel-default sideMenu">
				<div class="panel-heading">
					<h3 class="panel-title"><strong>유저 관리</strong></h3>
				</div>
				<div class="panel-body">
					<ul class="sideList">
						<li><a href="/admin/userList">전체 사용자</a></li>
						<li><a href="/admin/userList?type=0">메일 미인증</a></li>
					</ul>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">제제 상태</h3>
				</div>
				<div class="panel-body">
					<ul class="sideList">
						<li><a href="/admin/userList?type=2">7일</a></li>
						<li><a href="/admin/userList?type=3">30일</a></li>
						<li><a href="/admin/userList?type=4">영구</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="col-lg-10">
			<c:choose>
				<c:when test="${type == '0' }">
					<h3 class="pageTitle"><strong>메일 미인증</strong></h3>
				</c:when>
				<c:when test="${type eq 2 }">
					<h3 class="pageTitle"><strong>제제 - 7일</strong></h3>
				</c:when>
				<c:when test="${type eq 3 }">
					<h3 class="pageTitle"><strong>제제 - 30일</strong></h3>
				</c:when>
				<c:when test="${type eq 4 }">
					<h3 class="pageTitle"><strong>제제 - 영구 제한</strong></h3>
				</c:when>
				<c:otherwise>
					<h3 class="pageTitle"><strong>전체 사용자</strong></h3>
				</c:otherwise>
			</c:choose>
			
			<table class="table table-hover">
				<tr class="active">
					<th><input type="checkbox" name="checkAll" id="checkAll"></th>
					<th>번호</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>메일인증</th>
					<th>제제 상태</th>
					<th>활동 여부</th>
				</tr>
				<c:forEach var="user" items="${userList}">
					<tr class="userList">
						<td>
							<c:choose>
								<c:when test="${user.userLevel eq 0}">
									<input type="checkbox" name="check">
								</c:when>
								<c:when test="${user.userLevel eq 9}">
								</c:when>
							</c:choose>
						</td>
						<td id="userNo">
							<c:out value="${user.userNo}" />
						</td>
						<td>
							<c:out value="${user.userName}" />
						</td>
						<td>
							<c:choose>
								<c:when test="${user.userLevel eq 0}">
									<a href="#" onclick="javascript:window.open('/admin/userDetail?userNo=${user.userNo}','popup user${user.userNo}','scrollbars=no, resizable=no')"><c:out value="${user.userMail}" /></a>
								</c:when>
								<c:when test="${user.userLevel eq 9}">
									<a href="#" onclick="javascript:window.open('/admin/userDetail?userNo=${user.userNo}','popup user${user.userNo}','scrollbars=no, resizable=no')"><c:out value="${user.userMail}" /></a> (<span class="redAlert">관리자</span>)
								</c:when>
								<c:otherwise>
									<span class="error">ERROR.</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${user.userCheck eq 0}">
									<span class="redAlert">미인증</span>
								</c:when>
								<c:when test="${user.userCheck eq 1}">
									인증
								</c:when>
								<c:otherwise>
									<span class="error">ERROR.</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<c:choose>
								<c:when test="${user.userStatus eq 1}">
									활동
								</c:when>
								<c:when test="${user.userStatus eq 2}">
									<span class="orangeAlert">7일 제제</span>
								</c:when>
								<c:when test="${user.userStatus eq 3}">
									<span class="orangeAlert">30일 제제</span>
								</c:when>
								<c:when test="${user.userStatus eq 4}">
									<span class="redAlert">영구정지</span>
								</c:when>
								<c:otherwise>
									<span class="error">ERROR.</span>
								</c:otherwise>
							</c:choose>
						</td>
						<td>
							<%@page import="java.util.*"%>
							<%
								Date date = new Date();
								date.setDate(date.getDate() - 8);
							%>
							<fmt:formatDate var="setDate" value="<%=date%>" pattern="yyyy/MM/dd  hh:mm:ss" />
							<fmt:formatDate var="accDate" value="${user.userAcc}" pattern="yyyy/MM/dd  hh:mm:ss" />
							<c:choose>
								<c:when test="${setDate>accDate}">
									<span class="orangeAlert">장기 미접속</span>
								</c:when>
								<c:otherwise>
									활동
								</c:otherwise>
							</c:choose>
						</td>
					</tr>
				</c:forEach>
			</table>
			
			<div class="paging">
				<ul class="pagination pagination-sm">
					<c:if test="${pageMaker.prev }">
						<li><a href="userList${pageMaker.makeSearch(pageMaker.startPage-1) }&type=${type}">&laquo;</a></li>
					</c:if>
	
					<c:forEach begin="${pageMaker.startPage }" end="${pageMaker.endPage }" var="idx">
						<li <c:out value="${pageMaker.cri.page==idx?'class=active':' '}"/>><a href="userList${pageMaker.makeSearch(idx)}&type=${type}">${idx }</a>
						</li>
					</c:forEach>
	
					<c:if test="${pageMaker.next && pageMaker.endPage > 0 }">
						<li><a href="userList${pageMaker.makeSearch(pageMaker.endPage+1) }&type=${type}">&raquo;</a></li>
					</c:if>
				</ul>
			</div>
			
			<div class="col-lg-5 form-inline controlPanel">
				<select class="form-control" name="SearchType">
					<option value="notice" <c:out value="${cri.searchType == null?'selected':'' }"/>>---</option>
					<option value="na" <c:out value="${cri.searchType eq 'na'?'selected':'' }"/>>닉네임</option>
					<option value="em" <c:out value="${cri.searchType eq 'em'?'selected':'' }"/>>이메일</option>
					<option value="no" <c:out value="${cri.searchType eq 'no'?'selected':'' }"/>>번호</option>
					<option value="naemno" <c:out value="${cri.searchType eq 'naemno'?'selected':'' }"/>>전체</option>
				</select>
				<input type="text" class="form-control" id="keywordInput" value='${cri.keyword }'>
				<input type="button" class="btn btn-default" id="searchBtn" value="검색">
			</div>
			<div class="col-lg-7 form-inline">
				<div class= "pull-right">
					<select class="form-control" name="selectBox">
						<option value="none" selected="selected">---</option>
						<option value="activate">정상</option>
						<option value="week">7일</option>
						<option value="month">30일</option>
						<option value="deactivate">영구정지</option>
					</select>
					<input type="button" class="btn btn-default" id="statusChange" value="제제 변경">
					<input type="button" class="btn btn-default" id="userCheckMail" value="인증메일 전송">
					<input type="button" class="btn btn-default" id="rePasswordCheck" value="체크 비밀번호 초기화">
				</div>
			</div>
		</div>
	</div>
</body>
</html>