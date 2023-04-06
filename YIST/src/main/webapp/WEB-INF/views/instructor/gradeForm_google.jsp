<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <%-- <link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/main.js'></script> --%>

    <link href='${pageContext.request.contextPath}/resources/fullcalendar/lib/fullcalendar.main.min.css' rel='stylesheet' />
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/fullcalendar.main.min.js'></script>
    
    <script src='${pageContext.request.contextPath}/resources/fullcalendar/lib/locales/ko.js'></script>
    
    

    <script>
		document.addEventListener('DOMContentLoaded', function() {
			var calendarEl = document.getElementById('calendar');
			var calendar = new FullCalendar.Calendar(calendarEl, {
				  locale: "ko",
				  initialView: 'dayGridMonth',
				  headerToolbar: {
					left: 'prev,next today',
					center: 'title',
					right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
				  },
				  googleCalendarApiKey: 'AIzaSyCKiBKo1QBNpdZwBkOdqHTbi5FD-Y0-zpQ',
				  events: {
				  googleCalendarId: 'jinwon960328@gmail.com',
				  className: 'gcal-event' // an option!
				  },
				  selectable: true,
				  select: function(selectionInfo) {
					  console.log("셀 클릭");
				      calendar.addEvent({
				          title: 'dynamic event',
				          start: selectionInfo.start,
				          end: selectionInfo.end 
				        });
				        calendar.unselect();
				  },
				  eventClick: function(info) {
					  let start_year = info.event.start.getUTCFullYear();
					  let start_month = info.event.start.getMonth() + 1;
					  let start_date = info.event.start.getUTCDate();
					  let start_hour = info.event.start.getHours();
					  let start_minute = info.event.start.getMinutes();
					  let start_second = info.event.start.getSeconds();
					  let end_hour = info.event.end.getHours();

					  let start = start_year + "-" + start_month + "-" + start_date + " " + start_hour + "시 ~ " + end_hour + "시";

					  let attends = "";
					  info.event.extendedProps.attachments.forEach(function(item) {
						  attends += "<div><a href='"+item.fileUrl+"' target='_blank'>[첨부파일]</a></div>"
					  });

					  if(!info.event.extendedProps.description) {
						  info.event.extendedProps.description = "";
					  }
					  let contents = "<div style=\"font-weight:bold; font-size:20px; margin-bottom:30px; text-align:center\">" + start + "</div><div style=\"font-size:18px; margin-bottom:20px\">제목: " + info.event.title + "</div><div style=\"width:500px\">" + info.event.extendedProps.description + attends + "</div>";
					  
					  console.log(start);
					  $("#popup").html(contents);
					  $("#popup").bPopup({
						speed: 650,
						transition: 'slideIn',
						transitionClose: 'slideBack',
						position: [($(document).width()-500)/2, 30] //x, y
					  });
					  info.jsEvent.stopPropagation();
					  info.jsEvent.preventDefault();
				  }
			});
			calendar.render();
		});
    </script>
</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div class="content-wrapper table-hover">
				<div class="content">
					<!-- For Components documentaion -->
					<div id="calendar"></div>
					<div id='popup' style="width:500px; height:600px; display:none; background-color:white; padding:20px; border-radius:14px; border:2px solid #eeeeee"></div>
					<!-- 여기서부터  -->
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js"></script>
</body>
</html>