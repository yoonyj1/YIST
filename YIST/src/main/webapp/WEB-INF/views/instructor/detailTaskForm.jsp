<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 상세 페이지</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div class="content-wrapper table-hover">
				<div class="content">
					<h3 align="center">자료형과 연산자</h3>
					<hr>
					<div class="row">
						<div class="col">
							<table class="table" style="text-align: center;">
								<thead style="background-color: lightgray;">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">이름</th>
										<th scope="col">완료여부</th>
										<th scope="col">확인여부</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="col">1</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">조진원</th>
										<th scope="col">완료</th>
										<th scope="col">확인</th>
									</tr>
									
									<tr>
										<th scope="col">2</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">김진원</th>
										<th scope="col">-</th>
										<th scope="col">-</th>
									</tr>
									
									<tr>
										<th scope="col">2</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">박진원</th>
										<th scope="col">완료</th>
										<th scope="col">-</th>
									</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>