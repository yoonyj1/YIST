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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/calendar/css/main.css">

</head>
<body>

<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			<div class="container">

        <!-- 일자 클릭시 메뉴오픈 -->
        <div id="contextMenu" class="dropdown clearfix">
            <ul class="dropdown-menu dropNewEvent" role="menu" aria-labelledby="dropdownMenu"
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