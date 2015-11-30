<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${boxoffice.showRange }박스오피스</title>
<script type="text/javascript">
	$(document).ready(function() {
		$('#datebtn').on("click", function() {
			data = $("#datevo").val();
			jQuery.ajaxSettings.traditional = true;
			$.ajax({
				method : "GET",
				url : "/admin/refresh",
				data : {
					targetDt : data
				},
				success : function(data) {
					var count = 1;
					var html;
					jsonList = JSON.parse(data);
					jQuery.each(jsonList, function(entryIndex, entry) {
						$('input[name=rnum' + count + ']').attr('value', entry.rnum);
						$('input[name=movieCd' + count + ']').attr('value', entry.movieCd);
						$('input[name=movieNm' + count + ']').attr('value', entry.movieNm);
						$('input[name=rank' + count + ']').attr('value', entry.rank);
						$('input[name=rankInten' + count + ']').attr('value', entry.rankInten);
						$('input[name=salesAcc' + count + ']').attr('value', entry.salesAcc);
						$('input[name=audiAcc' + count + ']').attr('value', entry.audiAcc);
						$('input[name=openDt' + count + ']').attr('value', entry.openDt);
						count += 1;
					});
				}
			});
		});
	$('#sendBoxoffice').on("click", function() {
		$('#frm').submit();
		opener.parent.location.reload();
	});
});
</script>
</head>
<body>
	<div class="container">
		<form id="frm" action="/admin/boxofficeWrite" method="post">
			<table class="table table-hover" id="boxOfficeWrite">
				<tr id="searchBoxoffice">
					<td colspan="3">데이터 전송받는 부분</td>
					<td colspan="4"><input type='text' class="form-control" name="datevo" id="datevo"></td>
					<td><input type="button" class="btn btn-primary" id="datebtn" value="날짜 조회"></td>
				</tr>
				<tr class="active">
					<th width="50">순번</th>
					<th width="90">영화코드</th>
					<th>영화명</th>
					<th width="50">순위</th>
					<th width="100">순위 변동</th>
					<th width="120">누적매출액</th>
					<th width="120">누적관객수</th>
					<th width="90">개봉일</th>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum1" id="rnum1" value="1"></td>
					<td><input type='text' class="form-control" disabled name="movieCd1" id="movieCd1"></td>
					<td><input type='text' class="form-control" disabled name="movieNm1" id="movieNm1"></td>
					<td><input type='text' class="form-control" disabled name="rank1" id="rank1"></td>
					<td><input type='text' class="form-control" disabled name="rankInten1" id="rankInten1"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc1" id="salesAcc1"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc1" id="audiAcc1"></td>
					<td><input type='text' class="form-control" disabled name="openDt1" id="openDt1"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum2" id="rnum2" value="2"></td>
					<td><input type='text' class="form-control" disabled name="movieCd2" id="movieCd2"></td>
					<td><input type='text' class="form-control" disabled name="movieNm2" id="movieNm2"></td>
					<td><input type='text' class="form-control" disabled name="rank2" id="rank2"></td>
					<td><input type='text' class="form-control" disabled name="rankInten2" id="rankInten2"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc2" id="salesAcc2"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc2" id="audiAcc2"></td>
					<td><input type='text' class="form-control" disabled name="openDt2" id="openDt2"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum3" id="rnum3" value="3"></td>
					<td><input type='text' class="form-control" disabled name="movieCd3" id="movieCd3"></td>
					<td><input type='text' class="form-control" disabled name="movieNm3" id="movieNm3"></td>
					<td><input type='text' class="form-control" disabled name="rank3" id="rank3"></td>
					<td><input type='text' class="form-control" disabled name="rankInten3" id="rankInten3"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc3" id="salesAcc3"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc3" id="audiAcc3"></td>
					<td><input type='text' class="form-control" disabled name="openDt3" id="openDt3"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum4" id="rnum4" value="4"></td>
					<td><input type='text' class="form-control" disabled name="movieCd4" id="movieCd4"></td>
					<td><input type='text' class="form-control" disabled name="movieNm4" id="movieNm4"></td>
					<td><input type='text' class="form-control" disabled name="rank4" id="rank4"></td>
					<td><input type='text' class="form-control" disabled name="rankInten4" id="rankInten4"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc4" id="salesAcc4"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc4" id="audiAcc4"></td>
					<td><input type='text' class="form-control" disabled name="openDt4" id="openDt4"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum5" id="rnum5" value="5"></td>
					<td><input type='text' class="form-control" disabled name="movieCd5" id="movieCd5"></td>
					<td><input type='text' class="form-control" disabled name="movieNm5" id="movieNm5"></td>
					<td><input type='text' class="form-control" disabled name="rank5" id="rank5"></td>
					<td><input type='text' class="form-control" disabled name="rankInten5" id="rankInten5"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc5" id="salesAcc5"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc5" id="audiAcc5"></td>
					<td><input type='text' class="form-control" disabled name="openDt5" id="openDt5"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum6" id="rnum6" value="6"></td>
					<td><input type='text' class="form-control" disabled name="movieCd6" id="movieCd6"></td>
					<td><input type='text' class="form-control" disabled name="movieNm6" id="movieNm6"></td>
					<td><input type='text' class="form-control" disabled name="rank6" id="rank6"></td>
					<td><input type='text' class="form-control" disabled name="rankInten6" id="rankInten6"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc6" id="salesAcc6"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc6" id="audiAcc6"></td>
					<td><input type='text' class="form-control" disabled name="openDt6" id="openDt6"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum7" id="rnum7" value="7"></td>
					<td><input type='text' class="form-control" disabled name="movieCd7" id="movieCd7"></td>
					<td><input type='text' class="form-control" disabled name="movieNm7" id="movieNm7"></td>
					<td><input type='text' class="form-control" disabled name="rank7" id="rank7"></td>
					<td><input type='text' class="form-control" disabled name="rankInten7" id="rankInten7"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc7" id="salesAcc7"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc7" id="audiAcc7"></td>
					<td><input type='text' class="form-control" disabled name="openDt7" id="openDt7"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum8" id="rnum8" value="8"></td>
					<td><input type='text' class="form-control" disabled name="movieCd8" id="movieCd8"></td>
					<td><input type='text' class="form-control" disabled name="movieNm8" id="movieNm8"></td>
					<td><input type='text' class="form-control" disabled name="rank8" id="rank8"></td>
					<td><input type='text' class="form-control" disabled name="rankInten8" id="rankInten8"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc8" id="salesAcc8"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc8" id="audiAcc8"></td>
					<td><input type='text' class="form-control" disabled name="openDt8" id="openDt8"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum9" id="rnum9" value="9"></td>
					<td><input type='text' class="form-control" disabled name="movieCd9" id="movieCd9"></td>
					<td><input type='text' class="form-control" disabled name="movieNm9" id="movieNm9"></td>
					<td><input type='text' class="form-control" disabled name="rank9" id="rank9"></td>
					<td><input type='text' class="form-control" disabled name="rankInten9" id="rankInten9"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc9" id="salesAcc9"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc9" id="audiAcc9"></td>
					<td><input type='text' class="form-control" disabled name="openDt9" id="openDt9"></td>
				</tr>
				<tr>
					<td><input type='text' class="form-control" disabled name="rnum10" id="rnum10" value="10"></td>
					<td><input type='text' class="form-control" disabled name="movieCd10" id="movieCd10"></td>
					<td><input type='text' class="form-control" disabled name="movieNm10" id="movieNm10"></td>
					<td><input type='text' class="form-control" disabled name="rank10" id="rank10"></td>
					<td><input type='text' class="form-control" disabled name="rankInten10" id="rankInten10"></td>
					<td><input type='text' class="form-control" disabled name="salesAcc10" id="salesAcc10"></td>
					<td><input type='text' class="form-control" disabled name="audiAcc10" id="audiAcc10"></td>
					<td><input type='text' class="form-control" disabled name="openDt10" id="openDt10"></td>
				</tr>
				<tr>
					<td colspan="8">
						<input type="button" class="btn btn-default btn-block" id="sendBoxoffice" value="박스오피스 작성">
					</td>
				</tr>
			</table>
		</form>
		<div class="col-lg-12">
			<div class="pull-right">
				<input type="button" class="btn btn-default" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
</body>
</html>