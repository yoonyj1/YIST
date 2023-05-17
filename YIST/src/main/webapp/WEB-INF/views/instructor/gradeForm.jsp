<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<div align="right">
					  <div class="form-group" style="width: 300px">
					    <select class="form-control" id="exampleFormControlSelect12">
					      <option id="examSelect" selected="selected">시험선택</option>
					      <c:forEach var="e" items="${examList}">
					      	<option value="${e.testNo}">${e.testTitle}</option>		
					      </c:forEach>
					    </select>
					  </div>
					</div>
					
					<table class="table" style="text-align: center;">
						<thead style="background-color: lightgray;">
							<tr>
								<th scope="col">시험번호</th>
								<th scope="col">제목</th>
								<th scope="col">이름</th>
								<th scope="col">점수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="g" items="${gradeList}">
								<c:if test="${g.score < 999}">
									<tr>
										<td scope="row">${g.testNo}</td>
										<td>${g.testTitle}</td>
										<td>${g.name}</td>
										<td>${g.score}</td>
									</tr>
								</c:if>
							</c:forEach>
						</tbody>
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
	
	<script>
		$(function(){
			$("#examSelect").on('change', function(){
				$.ajax({
					url:'ajaxGradeForm.ins',
					data:$(this).val(),
					success:function(){
						
					},
					error:function(){
						
					}
				})
			})
		})
	</script>
	
	<script src="${pageContext.request.contextPath}/resources/instructor/js/myChart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/custom.js"></script>
	
</body>
</html>