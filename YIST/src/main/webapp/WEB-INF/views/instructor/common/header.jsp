<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<!--
 // WEBSITE: https://themefisher.com
 // TWITTER: https://twitter.com/themefisher
 // FACEBOOK: https://www.facebook.com/themefisher
 // GITHUB: https://github.com/themefisher/
-->

<html lang="en" dir="ltr">
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

<title>Mono - Responsive Admin & Dashboard Template</title>

<!-- GOOGLE FONTS -->
<link
	href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto"
	rel="stylesheet">
<!-- 얘가 목록 아이콘임 -->
<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/material/css/materialdesignicons.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/simplebar/simplebar.css"
	rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/prism/prism.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/jvectormap/jquery-jvectormap-2.0.3.css"
	rel="stylesheet" />

<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/daterangepicker/daterangepicker.css"
	rel="stylesheet" />

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css"
	rel="stylesheet">

<link
	href="${pageContext.request.contextPath}/resources/instructor/plugins/toaster/toastr.min.css"
	rel="stylesheet" />



<!-- FAVICON -->
<link
	href="${pageContext.request.contextPath}/resources/instructor/images/favicon.png"
	rel="shortcut icon" />


<script
	src="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/instructor/css/instructor/style.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/instructor/css/style.css.map" />

<!-- jquery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 웹소켓 -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>


<!-- 알람 토스터 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<style type="text/css">
</style>

</head>

<body class="navbar-fixed sidebar-fixed" id="body">
	
	<c:if test="${ not empty alertMsg }">
		<script type="text/javascript">
			alert("${alertMsg}");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>
	
	
	<script>
		let examModalId = "";
	
		NProgress.configure({
			showSpinner : false
		});
		NProgress.start();
		
		function sendAlarm(type, title, target, content, sender){
			
			let msg = "[" + title + "] " + content + " 알람이 도착했습니다.";
			
			socket.send(type + "," + target + "," + msg + "," + sender);
		}
		
		// 웹소켓
		// 전역변수 설정
		let socket  = null;
		
		$(function(){
			seletInsAlarmList();
		})
		
		$(document).ready(function(){
		    // 웹소켓 연결
		    sock = new SockJS("<c:url value="/echo-ws"/>");
		    socket = sock;
		
		    // 데이터를 전달 받았을때 
		    sock.onmessage = onMessage; // toast 생성
		    
		    sock.onclose = function() {
		        setTimeout(socketInit, 300); // 웹소켓을 재연결하는 코드 삽입
		    };
		    
		});
		
		// 전달 받은 데이터
		function onMessage(evt){
			let data = evt.data;
				
			toastr.info(data); 

			setTimeout(seletInsAlarmList, 300); // 웹소켓을 재연결하는 코드 삽입
		}
		
		// 알람 조회
		function seletInsAlarmList(){
			let aList = [];
			// 과제
			let taskCount = 0;
			// 시험
			let examCount = 0;
			
			$.ajax({
				url:'insAlarm.ins',
				success:function(alarmList){
					console.log(alarmList);
					if(alarmList == null){
						taskCount = 0;
						examCount = 0;
					} else {
						let allMsg, taskMsg, examMsg = "";
						
						for (let i in alarmList){
							
							if (alarmList[i].alarmType == '과제'){
								// 과제
								taskMsg += "<div class=\"media media-sm p-4 mb-0\">";
								taskMsg += "<div class=\"media-sm-wrapper bg-info\">";
								taskMsg += "<a href=\"insAlarmCheck.ins?alarmNo=" + alarmList[i].alarmNo + "&type=" + alarmList[i].alarmType + "\">"; 
								taskMsg += "<i class=\"mdi mdi-playlist-check\"></i>";
								taskMsg += "</a>";
								taskMsg += "</div>";
								taskMsg += "<div class=\"media-body\">";
								taskMsg += "<a href=\"insAlarmCheck.ins?alarmNo=" + alarmList[i].alarmNo + "&type=" + alarmList[i].alarmType + "\">"; 
								taskMsg += "<span style=\"font-size:14px\" class=\"title mb-0\">과제완료</span>";
								taskMsg += "<span style=\"font-size:13px\" class=\"discribe\">" + alarmList[i].alarmContent + "</span>";
								taskMsg += "</a>";
								taskMsg += "</div>";
								taskMsg += "</div>";
								
								taskCount++;
								
								allMsg += taskMsg;
							} else {
								// 시험
								examMsg += "<div class=\"media media-sm p-4 bg-light mb-0\">";
								examMsg += "<div class=\"media-sm-wrapper bg-primary\">"
								examMsg += "<a href=\"insAlarmCheck.ins?alarmNo=" + alarmList[i].alarmNo + "&type=" + alarmList[i].alarmType + "\">";  
								examMsg += "<i class=\"mdi mdi-calendar-check-outline\"></i>"
								examMsg += "</a>";
								examMsg += "</div>"
								examMsg += "<div class=\"media-body\">"
								examMsg += "<a href=\"insAlarmCheck.ins?alarmNo=" + alarmList[i].alarmNo + "&type=" + alarmList[i].alarmType + "\">";  
								examMsg += "<span style=\"font-size:14px\" class=\"title mb-0\">시험완료</span>" 
								examMsg += "<span style=\"font-size:13px\" class=\"discribe\">" + alarmList[i].alarmContent + "</span>" 
								examMsg += "</a>"
								examMsg += "</div>"
								examMsg += "</div>"
								
								examCount++;
								
								allMsg += examMsg;
								
								
							}
							
						}
						
						
						$("#all-tab").append(allMsg);
						$("#task-panel").append(taskMsg);
						$("#exam-panel").append(examMsg);
						
						// 전체 알림수
						$("#other-tab").html("알림(" + (taskCount + examCount) + ")");
						
						// 과제 알림수
						$("#task-tab").html("과제(" + taskCount + ")");
						
						// 시험 알림수
						$("#exam-tab").html("시험(" + examCount + ")");
						
						$(".alarm-badge").html(taskCount + examCount);
						
					}
					
				},
				
				error:function(){
					alert("알람 조회 실패");
				}
			}) 
		}
		
		// (시험, 과제 알림)
		$(document).ready(function(){
			// 시험 시작 알람
			$(".test-start").on("click", function(){
				
				console.log("지금 눌린 번호 : " +$(this).next().val());
				
				examModalId= "#examStart" + $(this).next().val();
				
				if(confirm('평가를 시작하시겠습니까?')){
					$(examModalId).modal('show');
				}
			})
			
			// 시험 점수 등록
			$(".task-insert").on("click", function(){
				console.log("눌림~~~~");
				let type = '시험';
				let title = $(this).next().next().val();
				let target = $(this).next().val();
				let content = "채점 완료";
				let sender = '${loginUser.getId()}';
				
				sendAlarm(type, title,  target, content, sender);
			})
			
			
			// 과제 확인 알람
			$(".taskCheck-btn").on("click", function(){
				let type = '과제';
				let title = $(this).next().next().next().val();
				let target = $(this).next().next().val();
				let content = "과제 확인";
				let sender = '${loginUser.getId()}';
				
				console.log(title);
				console.log(target);
				
				sendAlarm(type, title,  target, content, sender); 
			})
								
		})
	</script>
	<aside class="left-sidebar sidebar-light" id="left-sidebar">
		<div id="sidebar" class="sidebar sidebar-with-footer">

			<div class="app-brand">
				<a href="${pageContext.request.contextPath}/resources/instructor/main.jsp"> <img
					src="${pageContext.request.contextPath}/resources/instructor/images/yist_logo.png"
					alt="Mono"> <span class="brand-name"></span>
				</a>
			</div>
			<div class="sidebar-left" data-simplebar style="height: 100%;">
				<!-- 왼쪽메뉴창 -->
				<ul class="nav sidebar-inner" id="sidebar-menu">
                    <li><a class="sidenav-item-link" href="studentForm.ins"> <i
								class="mdi mdi-briefcase-account-outline"></i> <span
								class="nav-text">학생</span>
					</a></li>

					<li class="sider"><a class="sidenav-item-link" href="teacher.ins"> <i
								class="mdi mdi-account-group"></i> <span class="nav-text">강사</span>
					</a></li>
					
					<li><a class="sidenav-item-link" href="yistcheck.ins"> <i
								class="mdi mdi-calendar-check"></i> <span class="nav-text">출석</span>
					</a></li>
					
					<li><a class="sidenav-item-link" href="calendar.ins"> <i
							class="mdi mdi-calendar-multiselect"></i> <span class="nav-text">일정</span>
					</a></li>
					
					<li><a class="sidenav-item-link" href="taskForm.ins"> <i
							class="mdi mdi-file-document-box-multiple"></i> <span
							class="nav-text">과제</span>
					</a></li>

					<li><a class="sidenav-item-link" href="examForm.ins"> <i
							class="mdi mdi-pencil"></i> <span class="nav-text">시험</span>
					</a></li>

					<li><a class="sidenav-item-link" href="gradeForm.ins"> <i
							class="mdi mdi-format-annotation-plus"></i> <span class="nav-text">성적</span>
					</a></li>
					
				</ul>
				
			</div>
		</div>
	</aside>

	<!-- Header -->
	<header class="main-header" id="header">
		<nav class="navbar navbar-expand-lg navbar-light" id="navbar">
			<!-- Sidebar toggle button -->
			<button id="sidebar-toggler" class="sidebar-toggle">
				<span class="sr-only">Toggle navigation</span>
			</button>

			<!-- 헤더 타이틀 -->
			<span class="page-title"></span>

			<div class="navbar-right ">

				<!-- search form -->
				<div class="search-form">
					<!-- <form action="index.html" method="get"> -->
						<div class="input-group input-group-sm" id="input-group-search">
							<input type="text" id="timeDisplay" class="form-control" readonly="readonly" style="color: blue" />
						</div>
					<!-- </form> -->
					<ul class="dropdown-menu dropdown-menu-search">

						<li class="nav-item"><a class="nav-link" href="index.html">Morbi
								leo risus</a></li>
						<li class="nav-item"><a class="nav-link" href="index.html">Dapibus
								ac facilisis in</a></li>
						<li class="nav-item"><a class="nav-link" href="index.html">Porta
								ac consectetur ac</a></li>
						<li class="nav-item"><a class="nav-link" href="index.html">Vestibulum
								at eros</a></li>

					</ul>

				</div>
				
				<!-- 테스트 메세지 전송 -->
				<script type="text/javascript">

				</script>
				
				<ul class="nav navbar-nav">
					<li class="custom-dropdown">
						<button class="notify-toggler custom-dropdown-toggler" >
							<i class="mdi mdi-bell-outline icon"></i> <span
								class="alarm-badge badge badge-xs rounded-circle">0</span>
						</button>
						<div class="dropdown-notify">

							<header>
								<div class="nav nav-underline" id="nav-tab" role="tablist">
									<!-- <a class="nav-item nav-link active" id="all-tabs" data-toggle="tab" href="#all" role="tab"aria-controls="nav-home" aria-selected="true">전체(5)</a> 
									<a class="msg-count nav-item nav-link" id="message-tab" data-toggle="tab" href="#message" role="tab" aria-controls="nav-profile" aria-selected="false">메세지(3)</a> --> 
									<a class="nav-item nav-link" id="other-tab" data-toggle="tab" href="#other" role="tab" aria-controls="nav-contact" aria-selected="false">알람(0)</a>
								</div>
							</header>

							<div class="" data-simplebar style="height: 325px;">
								<div class="tab-content" id="myTabContent">

									<div class="msg-pane tab-pane fade show active" id="all-tab" role="tabpanel" aria-labelledby="all-tabs">
										
										
										
									</div>

								</div>
							</div>

							<footer class="border-top dropdown-notify-footer">
								<div
									class="d-flex justify-content-between align-items-center py-2 px-4">
									<span>Last updated 3 min ago</span> <a id="refress-button"
										href="javascript:" class="btn mdi mdi-cached btn-refress"></a>
								</div>
							</footer>
						</div>
					</li>
					<!-- User Account -->
					<li class="dropdown user-menu">
						<button class="dropdown-toggle nav-link" data-toggle="dropdown">
							<!-- <img src="images/user/user-xs-01.jpg" class="user-image rounded-circle" alt="User Image" /> -->
							<span class="d-none d-lg-inline-block">${loginUser.name}</span>
						</button>
						<ul class="dropdown-menu dropdown-menu-right">
							<li><a class="dropdown-link-item" href="user-profile.html">
									<i class="mdi mdi-account-outline"></i> <span class="nav-text">My
										Profile</span>
							</a></li>
							<li><a class="dropdown-link-item" href="email-inbox.html">
									<i class="mdi mdi-email-outline"></i> <span class="nav-text">Message</span>
									<span class="badge badge-pill badge-primary">24</span>
							</a></li>
							<li><a class="dropdown-link-item"
								href="user-activities.html"> <i
									class="mdi mdi-diamond-stone"></i> <span class="nav-text">Activitise</span></a>
							</li>
							<li><a class="dropdown-link-item"
								href="user-account-settings.html"> <i
									class="mdi mdi-settings"></i> <span class="nav-text">Account
										Setting</span>
							</a></li>

							<li class="dropdown-footer"><a class="dropdown-link-item"
								href="logout.me"> <i class="mdi mdi-logout"></i>로그아웃
							</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</nav>
	</header>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/plugins/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/instructor/plugins/simplebar/simplebar.min.js"></script>
	<script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/resources/instructor/plugins/circle-progress/circle-progress.js"></script>

	<script src="${pageContext.request.contextPath}/resources/instructor/js/mono.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/instructor/js/custom.js"></script>
</body>
</html>

























