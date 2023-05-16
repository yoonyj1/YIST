<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적관리</title>

<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/instructor/plugins/apexcharts/apexcharts.js"></script>

</head>
<body>
	
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			
			<!-- 성적관리 스크립트 시작 -->
			<script>
				$(function(){
					$(".apexcharts-legend-text").eq(0).html("1번");
					$(".apexcharts-legend-text").eq(1).html("2번");
				})
			</script>
			<!-- 성적관리 스크립트 끝 -->
			
			<div class="content-wrapper table-hover">

				<div class="content">
					<h4 align="center">성적관리</h4>
					<hr>

					<table class="table" style="text-align: center;">
						<thead style="background-color: lightgray;">
							<tr>
								<th scope="col">번호</th>
								<th scope="col">과목</th>
								<th scope="col">구분</th>
								<th scope="col">평가명</th>
								<th scope="col">평가일</th>
							</tr>
						</thead>
					</table>
					
					<br>
					<br>
					
					<h4 align="center">평균</h4>
					<hr>
					<div id="horizontal-bar-chart2"></div>
				</div>

			</div>

		</div>
	</div>

	<script src="${pageContext.request.contextPath}/resources/instructor/js/myChart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/custom.js"></script>
	
</body>
</html>