<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
<script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
</script>

<div class="wrapper">
	<jsp:include page="adminSidebar.jsp"/>
	
	<div class="page-wrapper">
        
          <!-- Header -->
          <header class="main-header" id="header">
            <nav class="navbar navbar-expand-lg navbar-light" id="navbar">
              <!-- Sidebar toggle button -->
              <button id="sidebar-toggler" class="sidebar-toggle">
                <span class="sr-only">Toggle navigation</span>
              </button>

              <span class="page-title">학생관리</span>

              <div class="navbar-right ">

                

                <ul class="nav navbar-nav">
                  
                  <!-- User Account -->
                  <li class="dropdown user-menu">
                    <button class="dropdown-toggle nav-link" data-toggle="dropdown">
                      <img src="images/user/user-xs-01.jpg" class="user-image rounded-circle" alt="User Image" />
                      <span class="d-none d-lg-inline-block">John Doe</span>
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

        <!-- ====================================
        ——— CONTENT WRAPPER
        ===================================== -->
        <div class="content-wrapper">
          <div class="content">

            <!-- 탭 메뉴 -->
            <ul class="nav nav-tabs mb-3" id="pills-tab" role="tablist">
                <li class="nav-item">
                  <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#nav-tabs-home" role="tab"
                    aria-controls="nav-tabs" aria-selected="true">JAVA</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" id="nav-profile-tab" data-toggle="pill" href="#nav-profile" role="tab"
                    aria-controls="nav-profile" aria-selected="false">PHYTHON</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="nav-profile-tab" data-toggle="pill" href="#nav-profile2" role="tab"
                      aria-controls="nav-profile" aria-selected="false">C</a>
                </li>
                
              </ul>
              <div class="tab-content mt-5" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-tabs-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    <table class="table">
                        <thead>
                          <tr>
                            <th class="selectTeacher" style="display: none;">선택</th>
                            <th scope="col">이름</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">수강과목</th>
                            <th scope="col" style="text-align: center;">관리</th>
                          </tr>
                        </thead>
                        <tbody>
                          
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Catrin</td>
                            <td>Seidl</td>
                            <td>자바1반</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="return confirm('xxx 학생의 수강을 취소하시겠습니까?')">중퇴승인</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Lilli</td>
                            <td>Kirsh</td>
                            <td>자바2반</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">중퇴승인</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Else</td>
                            <td>Voigt</td>
                            <td>자바3반</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">중퇴승인</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Ursel</td>
                            <td>Harms</td>
                            <td colspan="2">-</td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td colspan="2">@Anke</td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td colspan="2">-</td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td colspan="2">-</td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td colspan="2">-</td>
                          </tr>
                          
                        </tbody>
                      </table>
                </div>

                <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <table class="table">
                        <thead>
                          <tr>
                            <th class="selectTeacher" style="display: none;">선택</th>
                            <th scope="col">이름</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">수강과목</th>
                            <th scope="col" style="text-align: center;">관리</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>윤여진</td>
                            <td>010-1234-5678</td>
                            <td>자바</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="location.href='studentDetail.do'">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Catrin</td>
                            <td>Seidl</td>
                            <td>C</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Lilli</td>
                            <td>Kirsh</td>
                            <td>파이썬</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Else</td>
                            <td>Voigt</td>
                            <td>@voigt</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Ursel</td>
                            <td>Harms</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>@Anke</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          
                        </tbody>
                      </table>
                </div>
                <div class="tab-pane fade" id="nav-profile2" role="tabpanel" aria-labelledby="nav-profile-tab">
                    <table class="table">
                        <thead>
                          <tr>
                            <th class="selectTeacher" style="display: none;">선택</th>
                            <th scope="col">이름</th>
                            <th scope="col">전화번호</th>
                            <th scope="col">수강과목</th>
                            <th scope="col" style="text-align: center;">관리</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>윤여진</td>
                            <td>010-1234-5678</td>
                            <td>자바</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="location.href='teacherInfo.html'">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Catrin</td>
                            <td>Seidl</td>
                            <td>C</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Lilli</td>
                            <td>Kirsh</td>
                            <td>파이썬</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Else</td>
                            <td>Voigt</td>
                            <td>@voigt</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Ursel</td>
                            <td>Harms</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>@Anke</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          <tr>
                            <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                            <td>Anke</td>
                            <td>Sauter</td>
                            <td>-</td>
                            <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton">조회</button></td>
                          </tr>
                          
                        </tbody>
                      </table>
                </div>
              </div>

              </div>
            </div>
            

          
          <!-- Footer -->
          <footer class="footer mt-auto">
            <div class="copyright bg-white">
              <p>
                &copy; <span id="copy-year"></span> Copyright Mono Dashboard Bootstrap Template by <a class="text-primary" href="http://www.iamabdus.com/" target="_blank" >Abdus</a>.
              </p>
            </div>
            <script>
                var d = new Date();
                var year = d.getFullYear();
                document.getElementById("copy-year").innerHTML = year;
            </script>
          </footer>

      </div>
    </div>
    
                    

  </body>
</html>
