<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel=" shortcut icon"
	href="${pageContext.request.contextPath}/resources/instructor/calendar/image/favicon.ico">

<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/vendor/css/bootstrap.min.css"> -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/css/fullcalendar.min.css" />
<link rel="stylesheet"
	href='${pageContext.request.contextPath}/resources/instructor/calendar/vendor/css/select2.min.css' />
<%-- <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/vendor/css/bootstrap-datetimepicker.min.css' /> --%>

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/instructor/calendar/css/main.css" />

<style>
.dropdown1, .dropup {
	position: relative
}

.dropdown-toggle:focus {
	outline: 0
}

.dropdown-menu1 {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 160px;
	padding: 5px 0;
	margin: -130px -250px;
	font-size: 14px;
	text-align: left;
	list-style: none;
	background-color: #fff;
	-webkit-background-clip: padding-box;
	background-clip: padding-box;
	border: 1px solid #ccc;
	border: 1px solid rgba(0, 0, 0, .15);
	border-radius: 4px;
	-webkit-box-shadow: 0 6px 12px rgba(0, 0, 0, .175);
	box-shadow: 0 6px 12px rgba(0, 0, 0, .175)
}

.dropdown-menu1.pull-right {
	right: 0;
	left: auto
}

.dropdown-menu1 .divider {
	height: 1px;
	margin: 9px 0;
	overflow: hidden;
	background-color: #e5e5e5
}

.dropdown-menu1>li>a {
	display: block;
	padding: 3px 20px;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #333;
	white-space: nowrap
}

.dropdown-menu1>li>a:focus, .dropdown-menu1>li>a:hover {
	color: #262626;
	text-decoration: none;
	background-color: #f5f5f5
}

.dropdown-menu1>.active>a, .dropdown-menu1>.active>a:focus, .dropdown-menu1>.active>a:hover
	{
	color: #fff;
	text-decoration: none;
	background-color: #337ab7;
	outline: 0
}

.dropdown-menu1>.disabled>a, .dropdown-menu1>.disabled>a:focus,
	.dropdown-menu1>.disabled>a:hover {
	color: #777
}

.dropdown-menu1>.disabled>a:focus, .dropdown-menu1>.disabled>a:hover {
	text-decoration: none;
	cursor: not-allowed;
	background-color: transparent;
	background-image: none;
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false)
}

.open>.dropdown-menu1 {
	display: block
}

.open>a {
	outline: 0
}

.dropdown-menu1-right {
	right: 0;
	left: auto
}

.dropdown-menu1-left {
	right: auto;
	left: 0
}

.dropdown-header {
	display: block;
	padding: 3px 20px;
	font-size: 12px;
	line-height: 1.42857143;
	color: #777;
	white-space: nowrap
}

.dropdown-backdrop {
	position: fixed;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	z-index: 990
}

.pull-right>.dropdown-menu1 {
	right: 0;
	left: auto
}

.dropup .caret, .navbar-fixed-bottom .dropdown1 .caret {
	content: "";
	border-top: 0;
	border-bottom: 4px dashed;
	border-bottom: 4px solid\9

}

.dropup .dropdown-menu1, .navbar-fixed-bottom .dropdown1 .dropdown-menu1 {
	top: auto;
	bottom: 100%;
	margin-bottom: 2px
}

/* popover */
.dropNewEvent {
	font-size: 13px;
}

.popoverTitleCalendar {
	width: 100%;
	height: 100%;
	padding: 15px 15px;
	font-size: 13px;
	border-radius: 5px 5px 0 0;
}

.popoverInfoCalendar i {
	font-size: 14px;
	margin-right: 10px;
	line-height: inherit;
	color: #d3d4da;
}

.popoverInfoCalendar p {
	margin-bottom: 1px;
}

.popoverDescCalendar {
	margin-top: 12px;
	padding-top: 12px;
	border-top: 1px solid #E3E3E3;
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

.popover-title {
	background: transparent;
	font-weight: 600;
	padding: 0 !important;
	border: none;
}

.popover-content {
	padding: 15px 15px;
	font-size: 13px;
}

.inputModal {
	width: 65%;
	margin-bottom: 10px;
}

#contextMenu {
	position: absolute;
	display: none;
	z-index: 2;
}

#contextMenu .dropdown-menu1 {
	border: none;
}

.opacityWeekend {
	background-color: #f4f4fb !important;
}

.fc-avatar-image {
	top: 4px;
	left: 20px;
	height: 28px;
	width: 28px;
	border-radius: 50%;
	position: absolute;
	z-index: 2;
}

.fc-avatar-image img {
	height: 28px;
	width: 28px;
	border-radius: 50%;
}

.fc-avatar-image:before {
	content: none !important;
}

.fc-day-header {
	text-transform: uppercase;
	font-size: 13px;
	font-weight: 500;
	color: #505363;
	background-color: #FAFAFA;
	padding: 11px 0px !important;
	text-decoration: none;
}

.fc-day-header a {
	text-decoration: none !important;
	color: #505363;
}

.fc-center h2 {
	text-transform: uppercase;
	font-size: 18px;
	font-weight: 600;
	color: #505363;
	line-height: 32px;
}

.fc-toolbar.fc-header-toolbar {
	margin-bottom: 22px;
	padding-top: 22px;
}

.fc-agenda-view .fc-day-grid .fc-row .fc-content-skeleton {
	padding-bottom: 1em;
	padding-top: 1em;
}

.fc-day {
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.fc-day:hover {
	background: #EEF7FF;
	cursor: pointer;
	-webkit-transition: all 0.2s linear;
	-o-transition: all 0.2s linear;
	transition: all 0.2s linear;
}

.fc-highlight {
	background: #EEF7FF;
	opacity: 0.7;
}

.fc-time-grid-event.fc-short .fc-time:before {
	content: attr(data-start);
	display: none;
}

.fc-time-grid-event.fc-short .fc-time span {
	display: inline-block;
}

.fc-time-grid-event.fc-short .fc-avatar-image {
	display: none;
	-webkit-transition: all 0.3s linear;
	-o-transition: all 0.3s linear;
	transition: all 0.3s linear;
}

.fc-time-grid .fc-bgevent, .fc-time-grid .fc-event {
	border: 1px solid #fff !important;
}

.fc-time-grid-event.fc-short .fc-content {
	padding: 4px 20px 10px 22px !important;
}

.fc-time-grid-event .fc-avatar-image {
	top: 9px;
}

.fc-event-vert {
	min-height: 22px;
}

.fc .fc-axis {
	vertical-align: middle;
	padding: 0 4px;
	white-space: nowrap;
	font-size: 10px;
	color: #505362;
	text-transform: uppercase;
	text-align: center !important;
	background-color: #fafafa;
}

.fc-unthemed .fc-event .fc-content, .fc-unthemed .fc-event-dot .fc-content
	{
	padding: 5px 10px 5px 10px;
	font-family: 'Roboto', sans-serif;
	margin-left: -1px;
	height: 100%;
}

.fc-event {
	border: none !important;
}

.fc-day-grid-event .fc-time {
	font-weight: 700;
	text-transform: uppercase;
}

.fc-unthemed .fc-day-grid td:not(.fc-axis).fc-event-container {
	/* padding: 0.2rem 0.5rem; */
	
}

.fc-unthemed .fc-content, .fc-unthemed .fc-divider, .fc-unthemed .fc-list-heading td,
	.fc-unthemed .fc-list-view, .fc-unthemed .fc-popover, .fc-unthemed .fc-row,
	.fc-unthemed tbody, .fc-unthemed td, .fc-unthemed th, .fc-unthemed thead
	{
	border-color: #DADFEA;
}

.fc-ltr .fc-h-event .fc-end-resizer, .fc-ltr .fc-h-event .fc-end-resizer:before,
	.fc-ltr .fc-h-event .fc-end-resizer:after, .fc-rtl .fc-h-event .fc-start-resizer,
	.fc-rtl .fc-h-event .fc-start-resizer:before, .fc-rtl .fc-h-event .fc-start-resizer:after
	{
	left: auto;
	cursor: e-resize;
	background: none;
}

select.filter {
	width: 500px !important;
}

.popover {
	background: #fff !important;
	color: #2E2F34;
	border: none;
	margin-bottom: 10px;
}

/*popover header*/
.popover-title {
	background: #F7F7FC;
	font-weight: 600;
	padding: 15px 15px 11px;
	border: none;
}

/*popover arrows*/
.popover.top .arrow:after {
	border-top-color: #fff;
}

.popover.right .arrow:after {
	border-right-color: #fff;
}

.popover.bottom .arrow:after {
	border-bottom-color: #fff;
}

.popover.left .arrow:after {
	border-left-color: #fff;
}

.popover.bottom .arrow:after {
	border-bottom-color: #fff;
}

.material-icons {
	font-family: 'Material Icons';
	font-weight: normal;
	font-style: normal;
	font-size: 24px;
	/* Preferred icon size */
	display: inline-block;
	line-height: 1;
	text-transform: none;
	letter-spacing: normal;
	word-wrap: normal;
	white-space: nowrap;
	direction: ltr;
	/* Support for all WebKit browsers. */
	-webkit-font-smoothing: antialiased;
	/* Support for Safari and Chrome. */
	text-rendering: optimizeLegibility;
	/* Support for Firefox. */
	-moz-osx-font-smoothing: grayscale;
	/* Support for IE. */
	-webkit-font-feature-settings: 'liga';
	font-feature-settings: 'liga';
}

#add-color, #edit-color {
	color: #d25565;
}

</style>

</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="common/header.jsp" />

	<div class="card card-default">
		<div class="card-header">
			<h2>출석관리</h2>
		</div>
		<div class="card-body">

				<!-- 
				<div id="contextMenu" class="dropdown1 clearfix">
					<ul class="dropdown-menu1" role="menu"
						aria-labelledby="dropdownMenu"
						style="display: block; position: static;">
						<li><a tabindex="-1" href="#">전체</a></li>
						<li><a tabindex="-1" href="#">강사</a></li>
						<li><a tabindex="-1" href="#">학생</a></li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
					</ul>
				</div> -->
				<div id="contextMenu" class="dropdown1 clearfix" style="margin-bottom:60px; margin-right:60px;">
					<ul class="dropdown-menu1" role="menu"
						aria-labelledby="dropdownMenu"
						style="display: block;/*  position: static; */">
						<%-- <c:if test=""></c:if> --%>
						<li><a tabindex="-1" href="#">출석처리</a></li>
						
						<li><a tabindex="-1" href="#" data-role="close">Close</a></li>
					</ul>
				</div>

				<div id="wrapper">
					<div id="loading"></div>
					<div id="calendar"></div>
				</div>



				<div class="panel panel-default" style="display:none">

					<div class="panel-heading">
						<h3 class="panel-title">필터</h3>
					</div>

					<div class="panel-body">

						<div class="col-lg-6">
							<label for="calendar_view">구분별</label>
							<div class="input-group">
								<select class="filter" id="type_filter" multiple="multiple">
									<option value="카테고리1">전체</option>
									<option value="카테고리2">강사</option>
									<option value="카테고리3">학생</option>
								</select>
							</div>
						</div>

						<div class="col-lg-6" style="display: none">
							<label for="calendar_view">등록자별</label>
							<div class="input-group">
								<label class="checkbox-inline"><input class='filter'
									type="checkbox" value="강사1" checked>강사1</label> <label
									class="checkbox-inline"><input class='filter'
									type="checkbox" value="다현" checked>다현</label> <label
									class="checkbox-inline"><input class='filter'
									type="checkbox" value="사나" checked>사나</label> <label
									class="checkbox-inline"><input class='filter'
									type="checkbox" value="나연" checked>나연</label> <label
									class="checkbox-inline"><input class='filter'
									type="checkbox" value="지효" checked>지효</label>
							</div>
						</div>

					</div>
				</div>
				<!-- /.filter panel -->
			</div>
			<!-- /.container -->

		
		<br><br>

	<script type="text/javascript">
		$(document).ready(function() {
			$(document).on("click", "#edit-start", function() {
				console.log($("#edit-start").val());
				console.log("dddd");
			})
		})

		$(function() {
			var eventId = 1 + Math.floor(Math.random() * 1000);
			console.log("이름 : " + '${loginUser.name}');
			console.log("아이디 : " + '${loginUser.id}');
		})
	</script>

	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/js/jquery.min.js"></script>
	<!-- <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/bootstrap.min.js"></script> -->
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/js/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/js/fullcalendar.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/js/ko.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/vendor/js/select2.min.js"></script>
	<%-- <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/bootstrap-datetimepicker.min.js"></script> --%>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/js/main2.js?ver=1"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/js/addEvent2.js?ver=1"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/js/editEvent.js?ver=1"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/calendar/js/etcSetting.js?ver=1"></script>

	<script
		src="${pageContext.request.contextPath}/resources/instructor/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
		</div>

</body>
</html>