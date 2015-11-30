<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>영화 작성</title>
<script type="text/javascript">
	
</script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#movieWrite").click(function() {
			$("#frm").submit();
		});
		
		$("#uploadPoster").click(function() {

		});
		
		$(".fileDrop").on("dragenter dragover",
			function(event) {
				event.preventDefault();
			});

		$(".fileDrop").on("drop",function(event) {
			event.preventDefault();

			var files = event.originalEvent.dataTransfer.files;

			var file = files[0];
			var formData = new FormData();

			formData.append("file", file);

			$.ajax({
				url : '/uploadPoster',
				data : formData,
				dataType : 'text',
				processData : false,
				contentType : false,
				type : 'POST',
				success : function(data) {
					console.log(data);
	
					// 					var fileInfo = getFileInfo(data);
					var html = '<img src="/displayPoster?fileName=';
					html += data + '">';
					html += '<input type="hidden" name="moviePoster" value="'+data+'">';
					// 					var html = template(fileInfo);
					$(".fileDrop").remove();
					$("#poster").append(html);
				}
			});
		});
		$('#movieNobtn').on("click", function() {
			data = $("#movieNo").val();
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "post",
				url : "/admin/movieWrite",
				data : {
					movieCd : data
				},
				success : function(data) {
					jsonObject = JSON.parse(data);
					$('input[name=movieNm]').attr('value',jsonObject.movieNm); 
					if(jsonObject.movieNmOg!=""){
						$('input[name=movieOg]').attr('value',jsonObject.movieNmOg); 
					}else{
						$('input[name=movieOg]').attr('value',jsonObject.movieNm); 	
					}
					$('input[name=movieDirectorNo]').attr('value',jsonObject.directors[0].peopleNm); 
					$('input[name=movieNation]').attr('value',jsonObject.nations[0].nationNm); 
					$('input[name=movieOpenDt]').attr('value',jsonObject.openDt); 
					$('input[name=movieShowTm]').attr('value',jsonObject.showTm); 
					$('input[name=genreNm]').attr('value',jsonObject.genres[0].genreNm); 
					$('input[name=movieWatch]').attr('value',jsonObject.audits[0].watchGradeNm); 
					var html;
					jQuery.each(jsonObject.actors, function(entryIndex, entry) {
						html+='<tr>';
						html+='<td><input type="checkbox" id="check" name="check"></td>';
						html+='<td colspan="2"><input type="text" name="peopleNm'+entryIndex+'" value="'+entry.peopleNm +'"></td>';
						html+='<td colspan="2"><input type="text" name="cast'+ entryIndex+'" value="'+entry.cast +'"></td>';
						html+='</tr>';
					});
					$("#actorsField").after(html);
				}
			});
		});
	});
</script>
</head>
<body>
	<div class="container">
		<form id='frm' action="/admin/writeMovieForm" method="post">
			<table class="table table-hover" id="movieWriteForm">
				<tr>
					<th>영화 코드</th>
					<td colspan="3">
						<input type='text' name="movieNo" id="movieNo">
					</td>
					<td>
						<input type="button" class="btn btn-default" id="movieNobtn" value="영화 정보 조회">
					</td>
				</tr>
				<tr class="active">
					<th>영화명(국문)</th>
					<th>영화명(원문)</th>
					<th>제작 국가</th>
					<th>개봉 연도</th>
					<th>포스터 <a href="">취소</a></th>
				</tr>
				<tr>
					<td><input type="text" name="movieNm"></td>
					<td><input type="text" name="movieOg"></td>
					<td><input type="text" name="movieNation"></td>
					<td><input type="text" name="movieOpenDt"></td>
					<td rowspan="5" id="poster"><div class="fileDrop">포스터를 올리시오</div></td>
				</tr>
				<tr class="active">
					<th>상영시간</th>
					<th>영화 감독</th>
					<th>장르</th>
					<th>등급</th>
				</tr>
				<tr>
					<td><input type="text" name="movieShowTm"></td>
					<td><input type="text" name="movieDirectorNo"></td>
					<td><input type="text" name="genreNm"></td>
					<td><input type="text" name="movieWatch"></td>
				</tr>
				<tr class="active">
					<th colspan="4">줄거리</th>
				</tr>
				<tr>
					<td colspan="4"><textarea rows="5" cols="30" name="movieStory"></textarea></td>
				</tr>
				<tr class="active">
					<th colspan="5">출연진</th>
				</tr>
				<tr class="active" id="actorsField">
					<th>
						<input type="checkbox" id="checkAll" name="checkAll">
					</th>
					<th colspan="2">배우명</th>
					<th colspan="2">배역</th>
				</tr>
			</table>
		</form>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="movieWrite" value="영화 작성">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
</body>
</html>