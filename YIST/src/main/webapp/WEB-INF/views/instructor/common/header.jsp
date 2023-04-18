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
<link href="${pageContext.request.contextPath}/resources/plugins/material/css/materialdesignicons.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

<!-- PLUGINS CSS STYLE -->
<link href="${pageContext.request.contextPath}/resources/plugins/nprogress/nprogress.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/plugins/prism/prism.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/plugins/jvectormap/jquery-jvectormap-2.0.3.css" rel="stylesheet" />

<link href="${pageContext.request.contextPath}/resources/plugins/daterangepicker/daterangepicker.css" rel="stylesheet" />

<link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">

<link href="${pageContext.request.contextPath}/resources/plugins/toaster/toastr.min.css" rel="stylesheet" />



<!-- FAVICON -->
<link href="${pageContext.request.contextPath}/resources/images/favicon.png" rel="shortcut icon" />


<script src="${pageContext.request.contextPath}/resources/plugins/nprogress/nprogress.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/instructor/style.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css.map" />

<!-- jquery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- 폴더트리 -->

<style type="text/css">

</style>

</head>


<body class="navbar-fixed sidebar-fixed" id="body">
	<script>
		NProgress.configure({
			showSpinner : false
		});
		NProgress.start();
	</script>
		<aside class="left-sidebar sidebar-light" id="left-sidebar">
			<div id="sidebar" class="sidebar sidebar-with-footer">

				<div class="app-brand">
					<a href="/index.html"> <img src="${pageContext.request.contextPath}/resources/images/yist_logo.png"
						alt="Mono"> <span class="brand-name"></span>
					</a>
				</div>
				<div class="sidebar-left" data-simplebar style="height: 100%;">
					<!-- 왼쪽메뉴창 -->
					<ul class="nav sidebar-inner" id="sidebar-menu">
						<li><a class="sidenav-item-link" href="index.html"> <i
								class="mdi mdi-briefcase-account-outline"></i> <span
								class="nav-text">학생</span>
						</a></li>

						<li class="sider"><a class="sidenav-item-link" href="team.html"> <i
								class="mdi mdi-account-group"></i> <span class="nav-text">학급</span>
						</a></li>

						<li><a class="sidenav-item-link" href="calendar.html"> <i
								class="mdi mdi-calendar-check"></i> <span class="nav-text">출석</span>
						</a></li>

						<li><a class="sidenav-item-link" href="taskForm.ins"> <i
								class="mdi mdi-file-document-box-multiple"></i> <span
								class="nav-text">과제</span>
						</a></li>

						<li><a class="sidenav-item-link" href="examForm.ins"> <i
								class="mdi mdi-pencil"></i> <span class="nav-text">시험</span>
						</a></li>

						<li><a class="sidenav-item-link" href="gradeForm.ins"> <i
								class="mdi mdi-file-account"></i> <span class="nav-text">성적</span>
						</a></li>

						<li><a class="sidenav-item-link" href="chat.html"> <i
								class="mdi mdi-wechat"></i> <span class="nav-text">상담</span>
						</a></li>

						<li><a class="sidenav-item-link" href="contacts.html"> <i
								class="mdi mdi-phone"></i> <span class="nav-text">강사</span>
						</a></li>


						<li><a class="sidenav-item-link" href="contacts.html"> <i
								class="mdi mdi-email"></i> <span class="nav-text">학습자료</span>
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
              <form action="index.html" method="get">
                <div class="input-group input-group-sm" id="input-group-search">
                  <input type="text" autocomplete="off" name="query" id="search-input" class="form-control"
                    placeholder="Search..." />
                  <div class="input-group-append">
                    <button class="btn" type="button">/</button>
                  </div>
                </div>
              </form>
              <ul class="dropdown-menu dropdown-menu-search">

                <li class="nav-item">
                  <a class="nav-link" href="index.html">Morbi leo risus</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="index.html">Dapibus ac facilisis in</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="index.html">Porta ac consectetur ac</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="index.html">Vestibulum at eros</a>
                </li>

              </ul>

            </div>

            <ul class="nav navbar-nav">
              <!-- Offcanvas -->
              <li class="custom-dropdown">
                <a class="offcanvas-toggler active custom-dropdown-toggler" data-offcanvas="contact-off"
                  href="javascript:">
                  <i class="mdi mdi-contacts icon"></i>
                </a>
              </li>
              <li class="custom-dropdown">
                <button class="notify-toggler custom-dropdown-toggler">
                  <i class="mdi mdi-bell-outline icon"></i>
                  <span class="badge badge-xs rounded-circle">21</span>
                </button>
                <div class="dropdown-notify">

                  <header>
                    <div class="nav nav-underline" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="all-tabs" data-toggle="tab" href="#all" role="tab"
                        aria-controls="nav-home" aria-selected="true">All (5)</a>
                      <a class="nav-item nav-link" id="message-tab" data-toggle="tab" href="#message" role="tab"
                        aria-controls="nav-profile" aria-selected="false">Msgs (4)</a>
                      <a class="nav-item nav-link" id="other-tab" data-toggle="tab" href="#other" role="tab"
                        aria-controls="nav-contact" aria-selected="false">Others (3)</a>
                    </div>
                  </header>

                  <div class="" data-simplebar style="height: 325px;">
                    <div class="tab-content" id="myTabContent">

                      <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tabs">

                        <div class="media media-sm bg-warning-10 p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-02.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">조진원 님</span>
                              <span class="discribe">Extremity sweetness difficult behaviour he of. On disposal of as
                                landlord horrible. Afraid at highly months do things on at.</span>
                              <span class="time">
                                <time>Just now</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 bg-light mb-0">
                          <div class="media-sm-wrapper bg-primary">
                            <a href="user-profile.html">
                              <i class="mdi mdi-calendar-check-outline"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">New event added</span>
                              <span class="discribe">1/3/2014 (1pm - 2pm)</span>
                              <span class="time">
                                <time>10 min ago...</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-03.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Sagge Hudson</span>
                              <span class="discribe">On disposal of as landlord Afraid at highly months do things on
                                at.</span>
                              <span class="time">
                                <time>1 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper bg-info-dark">
                            <a href="user-profile.html">
                              <i class="mdi mdi-account-multiple-check"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Add request</span>
                              <span class="discribe">Add Dany Jones as your contact.</span>
                              <div class="buttons">
                                <a href="#" class="btn btn-sm btn-success shadow-none text-white">accept</a>
                                <a href="#" class="btn btn-sm shadow-none">delete</a>
                              </div>
                              <span class="time">
                                <time>6 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper bg-info">
                            <a href="user-profile.html">
                              <i class="mdi mdi-playlist-check"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Task complete</span>
                              <span class="discribe">Afraid at highly months do things on at.</span>
                              <span class="time">
                                <time>1 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                      </div>

                      <div class="tab-pane fade" id="message" role="tabpanel" aria-labelledby="message-tab">

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-01.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Selena Wagner</span>
                              <span class="discribe">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</span>
                              <span class="time">
                                <time>15 min ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-03.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Sagge Hudson</span>
                              <span class="discribe">On disposal of as landlord Afraid at highly months do things on
                                at.</span>
                              <span class="time">
                                <time>1 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm bg-warning-10 p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-02.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">John Doe</span>
                              <span class="discribe">Extremity sweetness difficult behaviour he of. On disposal of as
                                landlord horrible. Afraid
                                at highly months do things on at.</span>
                              <span class="time">
                                <time>Just now</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper">
                            <a href="user-profile.html">
                              <img src="images/user/user-sm-04.jpg" alt="User Image">
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Albrecht Straub</span>
                              <span class="discribe"> Beatae quia natus assumenda laboriosam, nisi perferendis aliquid
                                consectetur expedita non tenetur.</span>
                              <span class="time">
                                <time>Just now</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                      </div>
                      <div class="tab-pane fade" id="other" role="tabpanel" aria-labelledby="contact-tab">

                        <div class="media media-sm p-4 bg-light mb-0">
                          <div class="media-sm-wrapper bg-primary">
                            <a href="user-profile.html">
                              <i class="mdi mdi-calendar-check-outline"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">New event added</span>
                              <span class="discribe">1/3/2014 (1pm - 2pm)</span>
                              <span class="time">
                                <time>10 min ago...</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper bg-info-dark">
                            <a href="user-profile.html">
                              <i class="mdi mdi-account-multiple-check"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Add request</span>
                              <span class="discribe">Add Dany Jones as your contact.</span>
                              <div class="buttons">
                                <a href="#" class="btn btn-sm btn-success shadow-none text-white">accept</a>
                                <a href="#" class="btn btn-sm shadow-none">delete</a>
                              </div>
                              <span class="time">
                                <time>6 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                        <div class="media media-sm p-4 mb-0">
                          <div class="media-sm-wrapper bg-info">
                            <a href="user-profile.html">
                              <i class="mdi mdi-playlist-check"></i>
                            </a>
                          </div>
                          <div class="media-body">
                            <a href="user-profile.html">
                              <span class="title mb-0">Task complete</span>
                              <span class="discribe">Afraid at highly months do things on at.</span>
                              <span class="time">
                                <time>1 hrs ago</time>...
                              </span>
                            </a>
                          </div>
                        </div>

                      </div>
                    </div>
                  </div>

                  <footer class="border-top dropdown-notify-footer">
                    <div class="d-flex justify-content-between align-items-center py-2 px-4">
                      <span>Last updated 3 min ago</span>
                      <a id="refress-button" href="javascript:" class="btn mdi mdi-cached btn-refress"></a>
                    </div>
                  </footer>
                </div>
              </li>
              <!-- User Account -->
              <li class="dropdown user-menu">
                <button class="dropdown-toggle nav-link" data-toggle="dropdown">
                  <img src="images/user/user-xs-01.jpg" class="user-image rounded-circle" alt="User Image" />
                  <span class="d-none d-lg-inline-block">조진원님</span>
                </button>
                <ul class="dropdown-menu dropdown-menu-right">
                  <li>
                    <a class="dropdown-link-item" href="user-profile.html">
                      <i class="mdi mdi-account-outline"></i>
                      <span class="nav-text">My Profile</span>
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-link-item" href="email-inbox.html">
                      <i class="mdi mdi-email-outline"></i>
                      <span class="nav-text">Message</span>
                      <span class="badge badge-pill badge-primary">24</span>
                    </a>
                  </li>
                  <li>
                    <a class="dropdown-link-item" href="user-activities.html">
                      <i class="mdi mdi-diamond-stone"></i>
                      <span class="nav-text">Activitise</span></a>
                  </li>
                  <li>
                    <a class="dropdown-link-item" href="user-account-settings.html">
                      <i class="mdi mdi-settings"></i>
                      <span class="nav-text">Account Setting</span>
                    </a>
                  </li>

                  <li class="dropdown-footer">
                    <a class="dropdown-link-item" href="sign-in.html"> <i class="mdi mdi-logout"></i> Log Out </a>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
	  <script src="${pageContext.request.contextPath}/resources/plugins/jquery/jquery.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/plugins/simplebar/simplebar.min.js"></script>
	  <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
	
	  <script src="${pageContext.request.contextPath}/resources/plugins/circle-progress/circle-progress.js"></script>
	
	  <script src="${pageContext.request.contextPath}/resources/js/mono.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/chart.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/map.js"></script>
	  <script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
</body>
</html>

























