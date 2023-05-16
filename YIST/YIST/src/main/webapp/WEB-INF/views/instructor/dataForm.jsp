<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 자료 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div class="content-wrapper table-hover">
				<div class="content">
					<!-- For Components documentaion -->
					<h4 align="center">자료목록</h4>
					<hr>

					<div class="search-form">
						<!-- <form action="index.html" method="get"> -->
						<div class="input-group input-group-sm" id="input-group-search">
							<input type="text" autocomplete="off" name="query"
								id="search-input" class="form-control" placeholder="Search..." />
							<div class="input-group-append">
								<button class="send-msg" type="button">/</button>
							</div>
						</div>
					</div>

					<!-- 자료 테이블 시작 -->
					<table class="table">
						<thead style="background-color: lightgray;">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">과목</th>
								<th scope="col">평가명</th>
								<th scope="col">구분</th>
								<th scope="col">평가일</th>
								<th scope="col">평가</th>
							</tr>
						</thead>
					</table>

				</div>
			</div>

		</div>
	</div>
</body>
</html>