<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>성적관리</title>


</head>
<body>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/instructor/plugins/apexcharts/apexcharts.js"></script>
	
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			
			<div class="content-wrapper table-hover">

				<div class="content">
					<h4 align="center">성적관리</h4>
					<hr>
					<div align="right">
					  <div class="form-group" style="width: 300px">
					    <select class="form-control" id="examSelect">
					      <option value="none" selected="selected">시험선택</option>
					      <c:forEach var="e" items="${examList}">
					      	<option value="${e.testNo}">${e.testTitle}</option>		
					      </c:forEach>
					    </select>
					  </div>
					</div>
					
					<table class="table grade-table" style="text-align: center;">
						<thead style="background-color: lightgray;">
							<tr>
								<th scope="col">시험번호</th>
								<th scope="col">제목</th>
								<th scope="col">이름</th>
								<th scope="col">점수</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
					
					<br>
					<br>
					
					<div id="horizontal-bar-chart2"></div>
					
					<br>
					<br>
					<br>
					<br>
					<br>
				</div>

			</div>

		</div>
	</div>
	
	<script>
			$(document).ready(function(){
				$("#examSelect").on('change', function(){
					if ($(this).val() != "none"){
						$.ajax({
							url:'ajaxGradeForm.ins',
							async: false,
							data:{
								testNo:$(this).val()
							},
							success:function(list){
								let horBarChart2 = document.querySelector("#horizontal-bar-chart2");
				
								let students = [];
								let score = [];
								let sum = 0;
								let content = "";
								
								$(".grade-table>tbody").html('');
								console.log(list);
								
								if (list != null) {
									for (let i in list){
										if (list[i].score < 999){
											sum += list[i].score;
											students.push({
													name:list[i].name,
												})
											score.push(list[i].score);
											content += "<tr>"
											         + "<td scope=\"row\">" + list[i].testNo + "</td>"
											         + "<td>" + list[i].testTitle + "</td>"
											         + "<td>" + list[i].name + "</td>"
											         + "<td>" + list[i].score + "</td>"
											         + "</tr>";
										} else {
											content = "<tr><td colspan='4'>조회된 결과가 없습니다.</td></tr>";
										}
									}
								} else {
									alert("조회된 결과가 없습니다.");
								}
								
								$(".grade-table>tbody").append(content);
								
								
								if (horBarChart2 !== null) {
									  var options = {
									    chart: {
									      height: 350,
									      type: "bar",
									      toolbar: {
									        show: false,
									      },
									    },
									    colors: ["#9e6de0", "#faafca"],
									    plotOptions: {
									      bar: {
									        horizontal: true,
									        barHeight: "50%",
									        dataLabels: {
									          position: "top",
									        },
									      },
									    },
									    legend: {
									      show: true,
									      position: "top",
									      horizontalAlign: "right",
									      markers: {
									        width: 20,
									        height: 5,
									        radius: 0,
									      },
									    },
									    dataLabels: {
									      enabled: true,
									    },
									    stroke: {
									      show: true,
									      width: 1,
									      colors: ["#fff"],
									    },
									    series: [
									    	
									    ],
									    xaxis: {
									      categories: [],
									    },
									    tooltip: {
									      theme: "dark",
									      x: {
									        show: false,
									      },
									      y: {
									        title: {
									          formatter: (seriesName) => "점수",
									        },
									      },
									    },
									  };
									 
								
														
									for (let i in students){
										options.xaxis.categories.push(students[i].name);
									}
									
									options.series.push({data:score});
									let chart = new ApexCharts(horBarChart2, options);
								
									
									chart.render();
								}
								
							},
							error:function(){
								alert("성적조회 ajax통신 실패");
							}
						}) 
					}
					
				})
				
				
			})
	</script>
	
	
</body>

</html>