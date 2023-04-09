<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <link rel=" shortcut icon" href="${pageContext.request.contextPath}/resources/calendar/image/favicon.ico">

    <!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/vendor/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/vendor/css/fullcalendar.min.css" />
    <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/vendor/css/select2.min.css' />
    <%-- <link rel="stylesheet" href='${pageContext.request.contextPath}/resources/calendar/vendor/css/bootstrap-datetimepicker.min.css' /> --%>

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/main.css" />

</head>
<style>


.dropdown, .dropup {
	position: relative
}

.dropdown-toggle:focus {
	outline: 0
}

.dropdown-menu {
	position: absolute;
	top: 100%;
	left: 0;
	z-index: 1000;
	display: none;
	float: left;
	min-width: 160px;
	padding: 5px 0;
	margin: 2px 0 0;
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

.dropdown-menu.pull-right {
	right: 0;
	left: auto
}

.dropdown-menu .divider {
	height: 1px;
	margin: 9px 0;
	overflow: hidden;
	background-color: #e5e5e5
}

.dropdown-menu>li>a {
	display: block;
	padding: 3px 20px;
	clear: both;
	font-weight: 400;
	line-height: 1.42857143;
	color: #333;
	white-space: nowrap
}

.dropdown-menu>li>a:focus, .dropdown-menu>li>a:hover {
	color: #262626;
	text-decoration: none;
	background-color: #f5f5f5
}

.dropdown-menu>.active>a, .dropdown-menu>.active>a:focus, .dropdown-menu>.active>a:hover
	{
	color: #fff;
	text-decoration: none;
	background-color: #337ab7;
	outline: 0
}

.dropdown-menu>.disabled>a, .dropdown-menu>.disabled>a:focus,
	.dropdown-menu>.disabled>a:hover {
	color: #777
}

.dropdown-menu>.disabled>a:focus, .dropdown-menu>.disabled>a:hover {
	text-decoration: none;
	cursor: not-allowed;
	background-color: transparent;
	background-image: none;
	filter: progid:DXImageTransform.Microsoft.gradient(enabled=false)
}

.open>.dropdown-menu {
	display: block
}

.open>a {
	outline: 0
}

.dropdown-menu-right {
	right: 0;
	left: auto
}

.dropdown-menu-left {
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

.pull-right>.dropdown-menu {
	right: 0;
	left: auto
}

.dropup .caret, .navbar-fixed-bottom .dropdown .caret {
	content: "";
	border-top: 0;
	border-bottom: 4px dashed;
	border-bottom: 4px solid\9
}

.dropup .dropdown-menu, .navbar-fixed-bottom .dropdown .dropdown-menu {
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

#contextMenu .dropdown-menu {
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

.fc-time-grid .fc-bgevent,
.fc-time-grid .fc-event {
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

.fc-unthemed .fc-event .fc-content,
.fc-unthemed .fc-event-dot .fc-content {
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

.fc-unthemed .fc-content,
.fc-unthemed .fc-divider,
.fc-unthemed .fc-list-heading td,
.fc-unthemed .fc-list-view,
.fc-unthemed .fc-popover,
.fc-unthemed .fc-row,
.fc-unthemed tbody,
.fc-unthemed td,
.fc-unthemed th,
.fc-unthemed thead {
  border-color: #DADFEA;
}

.fc-ltr .fc-h-event .fc-end-resizer,
.fc-ltr .fc-h-event .fc-end-resizer:before,
.fc-ltr .fc-h-event .fc-end-resizer:after,
.fc-rtl .fc-h-event .fc-start-resizer,
.fc-rtl .fc-h-event .fc-start-resizer:before,
.fc-rtl .fc-h-event .fc-start-resizer:after {
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

#add-color,
#edit-color {
  color: #d25565;
}
</style>
<body>

<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			<div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu"
                style="display:block;position:static;margin-bottom:5px;">
                <li><a tabindex="-1" href="#">카테고리1</a></li>
                <li><a tabindex="-1" href="#">카테고리2</a></li>
                <li><a tabindex="-1" href="#">카테고리3</a></li>
                <li><a tabindex="-1" href="#">카테고리4</a></li>
                <li class="divider"></li>
                <li><a tabindex="-1" href="#" data-role="close">Close</a></li>
            </ul>
        </div>

        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>


        <!-- 일정 추가 MODAL -->
        <div class="modal fade" id="eventModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                        aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">상세일정</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">×</span>
				        </button>
                    </div>
                    <div class="modal-body">

                        <div class="row">
                            <div class="col">
                                <label class="col-xs-4" for="edit-allDay">하루종일</label>
                                <input class='allDayNewEvent' id="edit-allDay" type="checkbox"></label>
                            </div>
                        </div>
                        <div class="form-group">
						    <label for="edit-title">일정명</label>
						    <input class="form-control" type="text" name="edit-title" id="edit-title" required="required">
						 </div>
						 
						 <div class="form-group">
						    <label for="edit-start">시작</label>
						    <input class="form-control" type="datetime-local" name="edit-start" id="edit-start" />
						 </div> 
						  
						 <div class="form-group">
						    <label for="edit-end">끝</label>
						    <input class="form-control" type="datetime-local" name="edit-end" id="edit-end" />
						 </div> 
						
						  <div class="form-group">
						    <label for="edit-type">구분</label>
						    <select class="form-control" type="text" name="edit-type" id="edit-type">
						      <option class="test1" value="카테고리1">카테고리1</option>
                              <option value="카테고리2">카테고리2</option>
                              <option value="카테고리3">카테고리3</option>
                              <option value="카테고리4">카테고리4</option>
						    </select>
						  </div>
						  
						  <div class="form-group">
						    <label for="edit-color">색상</label>
						    <select class="form-control" name="color" id="edit-color">
						      <option value="#D25565" style="color:#D25565;">빨간색</option>
                              <option value="#9775fa" style="color:#9775fa;">보라색</option>
                              <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                              <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                              <option value="#f06595" style="color:#f06595;">핑크색</option>
                              <option value="#63e6be" style="color:#63e6be;">연두색</option>
                              <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                              <option value="#4d638c" style="color:#4d638c;">남색</option>
                              <option value="#495057" style="color:#495057;">검정색</option>
						    </select>
						  </div>
						
						  <div class="form-group">
						    <label for="edit-desc">설명</label>
						    <textarea class="form-control" name="edit-desc" id="edit-desc" rows="5" style="resize: none;"></textarea>
						  </div>
                        

                    </div>
                    <div class="modal-footer modalBtnContainer-addEvent">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                        <button type="button" class="btn btn-primary" id="save-event">저장</button>
                    </div>
                    <div class="modal-footer modalBtnContainer-modifyEvent">
                        <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                        <button type="button" class="btn btn-danger" id="deleteEvent">삭제</button>
                        <button type="button" class="btn btn-primary" id="updateEvent">저장</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->

        <div class="panel panel-default">

            <div class="panel-heading">
                <h3 class="panel-title">필터</h3>
            </div>

            <div class="panel-body">

                <div class="col-lg-6">
                    <label for="calendar_view">구분별</label>
                    <div class="input-group">
                        <select class="filter" id="type_filter" multiple="multiple">
                            <option value="카테고리1">카테고리1</option>
                            <option value="카테고리2">카테고리2</option>
                            <option value="카테고리3">카테고리3</option>
                            <option value="카테고리4">카테고리4</option>
                        </select>
                    </div>
                </div>

                <div class="col-lg-6">
                    <label for="calendar_view">등록자별</label>
                    <div class="input-group">
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="정연"
                                checked>정연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="다현"
                                checked>다현</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="사나"
                                checked>사나</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="나연"
                                checked>나연</label>
                        <label class="checkbox-inline"><input class='filter' type="checkbox" value="지효"
                                checked>지효</label>
                    </div>
                </div>

            </div>
        </div>
        <!-- /.filter panel -->
    </div>
    <!-- /.container -->
			
	</div>
</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			$(document).on("click","#edit-start" , function(){
				console.log($("#edit-start").val());
				console.log("dddd");
			})
		})
		
		$(function(){
			var eventId = 1 + Math.floor(Math.random() * 1000);
		})
	</script>	 

    <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/jquery.min.js"></script>
    <!-- <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/bootstrap.min.js"></script> -->
    <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/fullcalendar.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/ko.js"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/select2.min.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/resources/calendar/vendor/js/bootstrap-datetimepicker.min.js"></script> --%>
    <script src="${pageContext.request.contextPath}/resources/calendar/js/main.js?ver=1"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/js/addEvent.js?ver=1"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/js/editEvent.js?ver=1"></script>
    <script src="${pageContext.request.contextPath}/resources/calendar/js/etcSetting.js?ver=1"></script>
    
    <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>