<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.5/index.global.min.js'></script>
<script type='text/javascript'>

document.addEventListener('DOMContentLoaded', function() {
  var calendarEl = document.getElementById('calendar');

  var calendar = new FullCalendar.Calendar(calendarEl, {
    googleCalendarApiKey: 'AIzaSyCKiBKo1QBNpdZwBkOdqHTbi5FD-Y0-zpQ',
    eventSources: [
    {
          googleCalendarId: 'jinwon960328@gmail.com',
          className: '웹디자인기능사',
          color: '#be5683', //rgb,#ffffff 등의 형식으로 할 수 있어요.
          //textColor: 'black' 
        },
      {
          googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
          className: '정보처리기능사',
            color: '#204051',
            //textColor: 'black' 
        },
      {
          googleCalendarId: 'ko.south_korea#holiday@group.v.calendar.google.com',
          className: '정보처리기사',
            color: '#3b6978',
            //textColor: 'black' 
        }
    ]
  });
  calendar.render();
});
</script>
<style>
#calendar{
   width:60%;
   margin:20px auto;
}
</style>

</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div class="content-wrapper table-hover">
				<div class="content">
					<!-- For Components documentaion -->
					<div id='calendar'></div>
					<!-- 여기서부터  -->
				</div>
			</div>
		</div>
	</div>
</body>
</html>