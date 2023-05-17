<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>

<!-- Meta Tags -->
<meta name="viewport" content="width=device-width,initial-scale=1.0" />
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<meta name="description"
	content="LearnPress | Education & Courses HTML Template" />
<meta name="keywords"
	content="academy, course, education, education html theme, #, learning," />

<link href="${pageContext.request.contextPath}/resources/student/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/student/css/css-plugin-collections.css" rel="stylesheet" />
<link id="menuzord-menu-skins"
	href="${pageContext.request.contextPath}/resources/student/css/menuzord-skins/menuzord-rounded-boxed.css"
	rel="stylesheet" />
<!-- CSS | Main style file -->
<link
	href="${pageContext.request.contextPath}/resources/student/css/style-main.css"
	rel="stylesheet" type="text/css">
<!-- CSS | Theme Color -->
<link
	href="${pageContext.request.contextPath}/resources/student/css/colors/theme-skin-color-set-1.css"
	rel="stylesheet" type="text/css">
<!-- CSS | Custom Margin Padding Collection -->
<link
	href="${pageContext.request.contextPath}/resources/student/css/custom-bootstrap-margin-padding.css"
	rel="stylesheet" type="text/css">

<script src="${pageContext.request.contextPath}/resources/student/js/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/student/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/student/js/custom.js"></script>
<script src="${pageContext.request.contextPath}/resources/student/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/student/js/jquery-plugin-collection.js"></script>

<!-- 썸머노트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.css">
<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.js"></script>
<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/lang/summernote-ko-KR.js"></script>

<!-- 헤더 알람  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- 알림 -->
<script src="https://unpkg.com/intro.js/intro.js"></script>
<link rel="stylesheet" href="https://unpkg.com/intro.js/introjs.css">

<!-- 웹소켓 -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>

<!-- 알람 토스터 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style>
#notification {
	position: absolute;
	top: 30%;
	left: 80%;
	transform: translate(-50%, -50%);
	padding: 30px;
	background-color: white;
	border: 1px solid black;
	display: none;
}
#notification-button {
	border-radius: 25px;
}
#notification button {
  position: absolute;
  bottom: 15px;
  right: 15px;
}

</style>

</head>
<body class="">

	<!-- 알람(과제, 시험) -->
	<script type="text/javascript">
		// 알람창 목록 
		let notificationHTML; // 알림내용
		let loginUser = '${loginUser}'
		let socket  = null;
		
		$(document).ready(function(){
		    // 웹소켓 연결
		    sock = new SockJS("<c:url value="/echo-ws"/>");
		    socket = sock;
			
		    // 데이터를 전달 받았을때 
		    sock.onmessage = onMessage; // toast 생성
		    
		});
		
		
		// 전달 받은 데이터
		function onMessage(evt){
			let data = evt.data;
			
			toastr.info(data);	
			
			seletAlarmList();
		}
		
		function seletAlarmList(){
			let aList = [];
			let count = 0;
			notificationHTML = "";
			$.ajax({
				url:'alarm.st',
				success:function(alarmList){
					console.log(alarmList);
					console.log(alarmList.lenght);
					if(alarmList == null){
						count = 0;
					} else {
						notificationHTML = "<div><h2>알림</h2>";
						for (let i in alarmList){
							notificationHTML += "<p class=\"alarm\"><a href=\"alarmCheck.st?alarmNo=" + alarmList[i].alarmNo + "\">" + alarmList[i].alarmContent + "</a></p>";
							count++;
						}
						notificationHTML += "<br></div>";
						
						$("#alarm-badge").text(count);
					}
				},
				error:function(){
					alert("알람 조회 실패");
				}
			}) 
		}
		
	</script>
	
	
	<c:if test="${ not empty student_alertMsg }">
		<script type="text/javascript">
			alert("${student_alertMsg}");
		</script>
		<c:remove var="student_alertMsg" scope="session"/>
	</c:if>
	
	<!-- Header -->
	<header id="header" class="header">
		<div class="header-nav">
			<div class="header-nav-wrapper navbar-scrolltofixed bg-white">
				<div class="container">
					<nav id="menuzord-right" class="menuzord default">
						<a class="menuzord-brand pull-left flip" href="main.st">
							<img src="${pageContext.request.contextPath}/resources/student/images/yist/logo.png" alt="">
						</a>
						<ul class="menuzord-menu">
							<li><a href="testList.st">평가</a></li>
							<li><a href="certificate.st">수료증</a></li>
							<li><a href="noticeList.st">공지사항</a></li>
							<li><a href="videoList.st">학습동영상</a></li>
							<li><a href="boardList.st">우리반게시판</a></li>
							<li><a href="">마이페이지</a>
								<ul class="dropdown">
									<li><a href="myPage.st">내정보</a></li>
									<li><a href="myTask.st">과제</a></li>
									<li><a href="myTest.st">평가</a></li>
									<li><a href="myAttendance.st">출결</a></li>
								</ul>
							</li>
							<li>
								 <button id="notification-button" class="btn btn-dark btn-theme-colored" style="position: relative;">
								  &nbsp;알림&nbsp;&nbsp;<span class="badge" id="alarm-badge" style="position: absolute; top: -5px; right: -5px; color: white; background-color: black;"></span>
								</button> 
							</li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>
	<!-- 알림창 -->
	<script>
 		$(function(){
 			seletAlarmList();
		}) 
		
  		/* notificationHTML = `
			<div>
				<h2>알림</h2>
				<hr>
				<p class="alarm" id="1"><a href="#">공지사항이 등록되었습니다.</a></p>
				<hr>
				<p class="alarm" id="2"><a href="#">공지사항이 등록되었습니다.</a></p>
				<hr>
				<p class="alarm" id="3"><a href="#">등록하신 게시글에 댓글이ddd.</a></p>
				<hr>
				<p class="alarm" id="4"><a href="#">등록하신 게시글에 댓글이 달렸습니다.</a></p>
				<br>
			</div>
		`;   */
		
		document.getElementById('notification-button').addEventListener('click', function() {
			// 팝업창 생성
			var notification = document.createElement('div');
			notification.id = 'notification';
			notification.innerHTML = notificationHTML;
			document.body.appendChild(notification);
	
			// 팝업창 닫기 버튼 
			var closeButton = document.createElement('button');
			closeButton.textContent = '닫기';
			closeButton.addEventListener('click', function() {
				document.body.removeChild(notification);
			});
			notification.appendChild(closeButton);
	
			notification.style.display = 'block';
			
			console.log(notificationHTML);
		});
	</script>
	
</body>
</html>