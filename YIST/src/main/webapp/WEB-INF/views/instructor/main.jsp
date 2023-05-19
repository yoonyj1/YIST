<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>강사메인페이지</title>
<style>
.mLeft .mtody {
	position: relative;
	width: 380px;
	height: 150px;
	padding: 30px 30px 0;
	border-width: 1px;
	border-color: #e8ebe9;
	border-radius: 3px;
	background: #a9a9a9;
	margin: 30px;
}

.btn_attend a {
	display: block;
	padding-left: 7px;
	background: url(/LMS/images/icon_td_check.png) no-repeat 18px 33px;
	color: #FFFFFF;
	font-size: 17px;
	font-weight: 500;
	text-decoration: none;
	line-height: 80px;
}

.btn_attend {
	position: absolute;
	top: 40px;
	right: 20px;
	width: 120px;
	height: 80px;
	border-width: 0px;
	border-color: #FFFFFF;
	border-radius: 5px;
	background-color: #02068D;
	font-size: 14px;
	text-align: center;
}

.mconBox1 {
	width: 380px;
	height: 150px;
	margin-bottom: 20px;
	padding: 20px;
	border-width: 1px;
	border-style: solid;
	border-color: #ebebeb;
	border-radius: 3px;
	background: #fff;
	margin-left: 30px;
}

.mconBox2 {
	width: 380px;
	height: 150px;
	margin-bottom: 20px;
	padding: 20px;
	border-width: 1px;
	border-style: solid;
	border-color: #ebebeb;
	border-radius: 3px;
	background: #fff;
	margin-left: 15px;
}
.mconBox3 {
	width: 500px;
	height: 150px;
	margin-bottom: 20px;
	padding: 20px;
	border-width: 1px;
	border-style: solid;
	border-color: #ebebeb;
	border-radius: 3px;
	background: #fff;
	margin-left: 15px;
}

.all_member {
	margin-top: 10px;
	float: left;
	width: 120px;
	margin-left: 5px;
	padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1189/1189981.png)
		no-repeat right bottom;
	background-size: 45%;
	background-position: right bottom 8px;
}

.mNum1 {
	color: #02068D;
	font-size: 30px;
	font-family: 'Rubik', sans-serif;
	line-height: 30px;
	cursor: pointer;
	font-weight: 600;
}

.all_lesson {
	margin-top: 10px;
	margin-left: 50px;
	float: left;
	width: 150px;
	padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png)
		no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;
}

.all_check {
	margin-top: 10px;
	margin-left: 50px;
	float: left;
	width: 150px;
	padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png)
		no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;
}

.all_nocheck {
	margin-top: 10px;
	margin-left: 50px;
	float: left;
	width: 150px;
	padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png)
		no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;
}

.st_attend {
	float: left;
	width: 185px;
	height: 120px;
	background: url(/LMS/images/bg_st_attend.png) no-repeat 104px 90px #fff;
	margin-left: 30px;
	border-radius: 10px;
}

.st_absence {
	float: left;
	width: 180px;
	height: 120px;
	background: url(/LMS/images/bg_st_absence.png) no-repeat 104px 90px #fff;
	border-radius: 10px;
}
.st_absence2 {
	float: left;
	width: 380px;
	height: 120px;
	background: url(/LMS/images/bg_st_absence.png) no-repeat 104px 90px #fff;
	border-radius: 10px;
	margin-left: 30px;
}
</style>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/instructor/plugins/apexcharts/apexcharts.js"></script>


</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div style="height: 1000px;">
				<br>
				<br>
				<div class="mLeft">
					<div class="mtody" style="border-radius: 10px;">
						<h1 style="font-weight: 600;">today</h1>
						<div class="mday_date" style="font-size: 23px; color: white;">2023.05.19</div>
						<div class="week" style="font-size: 15px; color: white;">Friday</div>
						<div class="btn_attend">
							<a href="http://localhost:8848/yist/yistcheck.ins"><i class="mdi mdi-calendar-check"></i>출석체크</a>
						</div>
					</div>

					<div class="mconBox1" style="border-radius: 10px;">
						<div class="all_member">
							<h5 style="font-weight: 600;">전체수강생</h5>
							<div class="mNum1"><a href="http://localhost:8848/yist/studentForm.ins">26</a></div>
						</div>
						<div class="all_lesson">
							<h5 style="font-weight: 600;">개설학급</h5>
							<div class="mNum1">6</div>
						</div>
					</div>

					<div class="st_attend mconBox2">
						<h5 style="font-weight: 600;">
							출석생
							</h2>
							<div class="mNum1">4</div>
					</div>
					<div class="st_absence mconBox2">
						<h5 style="font-weight: 600;">
							결석생
							</h2>
							<div class="mNum1">0</div>
					</div>
					<div class="st_absence2 mconBox3">
						<h2 style="font-weight: 600;">
						<a href="http://localhost:8848/yist/calendar.ins">calender</a>
						</h5>
							</h2>
							
					</div>
				</div>

		</div>
				<div class="content-wrapper table-hover" style="margin-right: 150PX;">

				<div class="content">
					<h4 align="center">우리반 성적</h4>
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
					
					<h4 align="center">average</h4>
					<hr>
					<div id="horizontal-bar-chart2"></div>
				</div>

			</div>
	</div>
			</div>
		</div>
	</div>
</body>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/myChart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/custom.js"></script>
</html>