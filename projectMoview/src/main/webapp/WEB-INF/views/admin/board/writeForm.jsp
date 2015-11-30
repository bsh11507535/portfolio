<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>게시물 작성</title>
<script type="text/javascript">
	$(document).ready(function() {
		$("#noticeWrite").click(function() {
			$("#frm").submit();

		});
	});
</script>
</head>
<body>
	<div class="container">
		<form id='frm' action="/admin/writeForm" method="post" enctype="multipart/form-data">
			<table class="table table-hover">
				<tr>
					<th colspan="1">Q&A</th>
					<td colspan="3"><input type="text" class="form-control" name="title" id="title"></td>
				</tr>
				<tr>
					<th>질문</th>
					<td><textarea></textarea></td>
				</tr>
				<tr>
					<th>답변</th>
					<td><textarea></textarea></td>
				</tr>
			</table>
			<div class="col-lg-12">
				<div class="pull-right">
					<input type="button" class="btn btn-default" id="noticeWrite" value="내용 작성">
					<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>