<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>Mono - Responsive Admin & Dashboard Template</title>


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
          <div class="content">
            <div class="row">
                <div class="col-xl-3 col-md-6">
                  <div class="card card-default">
                    <div class="d-flex p-5">
                      <div class="icon-md bg-secondary rounded-circle mr-3">
                        <i class="mdi mdi-account-plus-outline"></i>
                      </div>
                      <div class="text-left">
                        <span id="insertTeacher" class="h2 d-block my-3" data-toggle="modal" data-target="#exampleModalForm">강사배정</span>
                      </div>
                    </div>
                  </div>
                </div>
                
                <div class="col-xl-3 col-md-6">
                  <div class="card card-default">
                    <div class="d-flex p-5">
                      <div class="icon-md bg-primary rounded-circle mr-3">
                        <i class="mdi mdi-account-minus"></i>
                      </div>
                      <div class="text-left">
                        <button id="deleteTeacher" class="h2 d-block my-3">강사삭제</button>
                      </div>
                    </div>
                  </div>
                </div>
                
              </div>

              <!-- 모달 시작 -->
              <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalFormTitle">강사배정</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <form>
                          <div class="form-group">
                            <label for="exampleInputEmail1">강사 선택</label>
                            <br>
                            <select name="teacherList" id="teacherList" style="width: 300px;">
                                <option value="강사1">강사1</option>                            
                                <option value="강사2">강사2</option>                            
                                <option value="강사3">강사3</option>                            
                                <option value="강사4">강사4</option>                            
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="exampleInputPassword1">강의 선택</label>
                            <br>
                            <select name="lectureList" id="lectureList" style="width: 300px;">
                              <option value="강의1">강의1</option>                            
                              <option value="강의2">강의2</option>                            
                              <option value="강의3">강의3</option>                            
                              <option value="강의4">강의4</option>                            
                          </select>
                          </div>
                          
                          
                          </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn btn-primary btn-pill">저장</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>

              

            <!-- 강사 목록 테이블 -->
            <table class="table">
                <thead>
                  <tr>
                    <th class="selectTeacher" style="display: none;">선택</th>
                    <th scope="col">이름</th>
                    <th scope="col">전화번호</th>
                    <th scope="col">담당과목</th>
                    <th scope="col" style="text-align: center;">관리</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
                    <td>윤여진</td>
                    <td>010-1234-5678</td>
                    <td>자바</td>
                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="location.href='teacherDetail.do'">조회</button></td>
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

              <script>
                // function deleteTeacher(){
                //   $('.selectTeacher').removeAttr("style");
                //   $('.checkTeacher').removeAttr("style");

                //   $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
                //     $(location).attr('href', 'sign-up.html')
                //   });

                //   $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
                // }

                // $(function(){
                //   $("#deleteTeacher").click(function(){
                //     $('.selectTeacher').removeAttr("style");
                //     $('.checkTeacher').removeAttr("style");

                //     $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
                //     $(location).attr('href', 'sign-up.html')
                //     });

                //     $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
                //     })
                // })

                $(function(){
                  $("#deleteTeacher").one('click', function(){
                    $('.selectTeacher').removeAttr("style");
                    $('.checkTeacher').removeAttr("style");

                    $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
                    $(location).attr('href', 'sign-up.html')
                    });

                    $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
                  })
                })
              </script>
               
              </div>
            </div>
            <!-- Bordered Rounded -->
            <div class="card card-default align-items-center">
              <div class="card-header">
              </div>
              <div class="card-body">
            
                <nav aria-label="Page navigation example">
                  <ul class="pagination border-rounded">
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Previous">
                        <span aria-hidden="true" class="mdi mdi-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    <li class="page-item active">
                      <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item">
                      <a class="page-link" href="#" aria-label="Next">
                        <span aria-hidden="true" class="mdi mdi-chevron-right"></span>
                        <span class="sr-only">Next</span>
                      </a>
                    </li>
                  </ul>
                </nav>
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