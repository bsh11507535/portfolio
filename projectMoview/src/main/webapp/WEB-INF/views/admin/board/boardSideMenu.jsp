<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<body>
	<div class="container">
		<div class="col-lg-2 ">
			<div class="panel panel-default sideMenu">
				<div class="panel-heading">
					<h3 class="panel-title">
						<strong>게시판 관리</strong>
					</h3>
				</div>
				<div class="panel-body">
					<ul class="sideList">
						<li><a href="/admin/boardList">전체</a></li>
					</ul>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">
						사용자 관련
					</h3>
				</div>
				<div class="panel-body">
					<ul class="sideList">
						<li><a href="/admin/boardList?boardCategory=6">자유 게시판</a></li>
						<!-- 				<li><a href="/admin/boardList?boardCategory=5">질문 게시판</a></li> -->
						<li><a href="/admin/boardList?boardCategory=4">영화리뷰 게시판</a></li>
					</ul>
				</div>
				<div class="panel-heading">
					<h3 class="panel-title">
						관리자 관련
					</h3>
				</div>
				<div class="panel-body">
					<ul class="sideList">
						<li><a href="/admin/boardList?boardCategory=3">Q&A 게시판</a></li>
						<!-- 				<li><a href="/admin/boardList?boardCategory=2">자주찾는 Q&A 게시판</a></li> -->
						<li><a href="/admin/boardList?boardCategory=1">공지사항</a></li>
						<li><a href="/admin/boardList?boardCategory=0">휴지통</a></li>
					</ul>
				</div>
			</div>
		</div>