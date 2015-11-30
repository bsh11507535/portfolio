<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>게시물 수정</title>
<script type="text/javascript" src="/resources/smartEditor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.9.0/jquery.js"></script>
<script type="text/javascript">
	var oEditors = [];
	// 추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	$(function() {
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "/resources/smartEditor/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true, // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseVerticalResizer : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
				bUseModeChanger : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
				//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
				fOnBeforeUnload : function() {
					// 					alert("완료!");
				}
			}, //boolean
			fOnAppLoad : function() {
				//예제 코드
				oEditors.getById["ir1"].exec("PASTE_HTML",
						[ '${boardInfo.boardContent}' ]);
			},
			fCreator : "createSEditor2"
		});
	});
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["ir1"].exec("PASTE_HTML", [ sHTML ]);
	}
	function showHTML() {
		var sHTML = oEditors.getById["ir1"].getIR();
		alert(sHTML);
	}
	function submitContents(elClickedObj) {
		oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []); // 에디터의 내용이 textarea에 적용됩니다.
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		try {
			elClickedObj.form.submit();
		} catch (e) {
		}
	}
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["ir1"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#noticeWrite").click(function() {
			oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();

		});
	});
</script>
</head>
<body>
	<div class="container">
		<form id='frm' action="/admin/updateForm" method="post">
			<input type="hidden" name="boardNo" value="${boardInfo.boardNo}">
			<table class="table table-hover">
				<tr>
					<th colspan="1">공지사항</th>
					<td colspan="3"><input type="text" name="title" id="title" value="${boardInfo.boardTitle}"></td>
				</tr>
				<tr>
					<td colspan="4">
						<textarea name="content" id="ir1" rows="10" cols="100"></textarea>
					</td>
				</tr>
				<tr class="active">
					<th><input type="checkbox" name="checkAll" id="checkAll"></th>
					<th>파일명</th>
					<th>저장시간</th>
					<th>파일 용량</th>
				</tr>
				<c:forEach var="file" items="${fileList }">
					<tr>
						<td><input type="checkbox" name="check" id="check"></td>
						<td><c:out value="${file.fileName }" /></td>
						<td><c:out value="${file.fileDate }" /></td>
						<td><c:out value="${file.fileSize }" /></td>
					</tr>
				</c:forEach>
			</table>
<!-- 				<tr> -->
<!-- 					<td>첨부 파일</td> -->
<!-- 					<td><input type="file" multiple name="uploadName"></td> -->
<!-- 				</tr> -->
			<div class="col-lg-12">
<!-- 					<select name="classfication"> -->
<!-- 							<option value="alert">중요</option> -->
<!-- 							<option value="event">이벤트</option> -->
<!-- 					</select>
						<input type="button" id="Change Category" value="분류 변경">  -->
<!-- 					<input type="button" value="파일업로드" id="fileUpload"> -->
				<div class="pull-right">
					<input type="button" class="btn btn-default" id="noticeWrite" value="내용 작성">
					<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
				</div>
			</div>
		</form>
	</div>
</body>
</html>