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

              <span class="page-title">강사관리</span>

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
          <div class="content"><!-- Card Profile -->
    <div class="card card-default card-profile">

      <div class="card-header-bg" style="background-image:url(assets/img/user/user-bg-01.jpg)"></div>

      <div class="card-body card-profile-body">

        <div class="profile-avata">
          <img class="rounded-circle" src="images/user/user-md-01.jpg" alt="Avata Image">
          <span class="h5 d-block mt-3 mb-2">Albrecht Straub</span>
        </div>

        
        

      </div>

      <div class="card-footer card-profile-footer">
        <ul class="nav nav-border-top justify-content-center">
          <li class="nav-item">
            <a class="nav-link active" href="teacherDetail.do">프로필</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="teacherDetail-lecture.do">강의</a>
          </li>
        </ul>
      </div>

      <div>
        <!-- 프로필 들어갈 부분 -->
            <form action="" method="post">
                <div class="profile-container">
                    <div class="row">
                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </div>
                            <input type="text" class="form-control" placeholder="UserId" aria-label="Username" aria-describedby="basic-addon1" value="강사아이디" readonly>
                        </div>
                    </div>
                 </div>

                    <div class="row">
                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;이름&nbsp;&nbsp;&nbsp;&nbsp;</span>
                            </div>
                            <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1" required>
                        </div>

                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">전화번호</span>
                            </div>
                            <input type="text" class="form-control" placeholder="phone" aria-label="Username" aria-describedby="basic-addon1" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">입사일자</span>
                            </div>
                            <input type="date" class="form-control" aria-label="Username" aria-describedby="basic-addon1" required>
                        </div>

                        <div class="input-group mb-3 col-6">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;이메일&nbsp;&nbsp;</span>
                            </div>
                            <input type="email" class="form-control" aria-label="email" aria-describedby="basic-addon1" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="input-group mb-3 col">
                            <div class="input-group-prepend">
                            <span class="input-group-text" id="basic-addon1">담당과목</span>
                            </div>
                            <select name="subject" id="subjectList">
                                <option value="NULL" selected>선택안함</option>
                                <option value="java">자바</option>
                                <option value="C">C</option>
                                <option value="phython">Phython</option>
                            </select>
                        </div>
                    </div>

                    <div class="row">
                      <div class="input-group mb-3 col-10">
                          <div class="input-group-prepend">
                          <span class="input-group-text" id="basic-addon1">&nbsp;&nbsp;&nbsp;&nbsp;주소&nbsp;&nbsp;&nbsp;&nbsp;</span>
                          </div>
                          <input type="text" class="form-control" aria-label="email" aria-describedby="basic-addon1">
                      </div>
                  </div>

                    <div class="row">
                        <div class="col-12" align="right">
                            <button type="submit" class="btn btn-sm btn-primary" style="margin-right: 15px;">수정</button>
                        </div>
                    </div>
                <br>
            </form>
            </div>
        </div>  
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

</body>
</html>