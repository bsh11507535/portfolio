<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/admin/headerDetail.jsp"%>
<title>${theater.theaterNm }상세정보</title>
</head>
<body>
	<div class="container">
		<table id="companyStatus">
			<tr >
				<th>번호</th>
				<th>상영관 명</th>
				<th>소속상영사</th>
				<th>상영지역</th>
				<th>상영관 URL</th>
			</tr>
			<tr>
				<td><input type="text" id="theaterNo" name="theaterNo"></td>
				<td><input type="text" id="theaterNm" name="theaterNm"></td>
				<td><input type="text" id="theaterClub" name="theaterClub"></td>
				<td><input type="text" id="theaterArea" name="theaterArea"></td>
				<td><input type="text" id="theaterURL" name="theaterURL"></td>
			</tr>
			<tr>
				<th><input type="checkbox" name="checkAll" id="checkAll"></th>
				<th>일자</th>
				<th colspan="2">상영영화</th>
				<th>상영시간</th>
			</tr>
			<tr>
				<td><input type="checkbox" name="check" id="check"></td>
				<td><input type="text" id="showRange" name="showRange"></td>
				<td colspan="2"><input type="text" id="movieNm" name="movieNm"></td>
				<td><input type="text" id="showTime" name="showTime"></td>
			</tr>
			<tr>
				<th colspan="2">추가</th>
				<td colspan="3"><input type="button" id="addMovie" name="addMovie" value="상영영화란 추가"></td>
			</tr>
			<tr>
				<td colspan="5" class="controlPanel">
				<input type="button"  class = "send" value="영화관 입력" id="theaterWrite">
				</td>
			</tr>
		</table>
		<div class="con-lg-12">
			<div class="pull-right">
				<input type="button" id="Window Close" value="창 닫기" onclick="javascript:window.open('about:blank', '_self').close()">
			</div>
		</div>
	</div>
	<script type="text/javascript"></script>
</body>
</html>