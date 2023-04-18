<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
    <!-- <link href="plugins/material/css/materialdesignicons.min.css" rel="stylesheet" /> -->
    <link href="./resources/admin/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
    <!-- <link href="plugins/simplebar/simplebar.css" rel="stylesheet" /> -->
    <link href="./resources/admin/plugins/simplebar/simplebar.css" rel="stylesheet" />
  
    <!-- PLUGINS CSS STYLE -->
    <link href="./resources/admin/plugins/nprogress/nprogress.css" rel="stylesheet" />
    <link href="./resources/admin/plugins/DataTables/DataTables-1.10.18/css/jquery.dataTables.min.css" rel="stylesheet" />
    <!-- MONO CSS -->
    <link id="main-css-href" rel="stylesheet" href="./resources/admin/css/style.css" />
    <!-- FAVICON -->
    <link href="images/favicon.png" rel="shortcut icon" />
    <script src="./resources/admin/plugins/nprogress/nprogress.js"></script>
</head>
<body>
	<aside class="left-sidebar sidebar-dark" id="left-sidebar">
    <div id="sidebar" class="sidebar sidebar-with-footer">
        <!-- Aplication Brand -->
        <div class="app-brand">
          <a href="index.html">
            <img src="./resources/admin/images/YIST.png" alt="Mono">
          </a>
        </div>
        <!-- begin sidebar scrollbar -->
        <div class="sidebar-left" data-simplebar style="height: 100%;">
          <!-- sidebar menu -->
          <ul class="nav sidebar-inner" id="sidebar-menu">
              <li  class="has-sub" >
                <a class="sidenav-item-link" href="teacherList.do">
                  <i class="mdi mdi-image-filter-none"></i>
                  <span class="nav-text">강사관리</span>
                </a>
              </li>
            
              <li  class="has-sub" >
                <a class="sidenav-item-link" href="studentList.do">
                  <i class="mdi mdi-account"></i>
                  <span class="nav-text">학생관리</span>
                </a>
              </li>
            
              <li  class="has-sub" >
                <a class="sidenav-item-link" href="gradeView.do">
                  <i class="mdi mdi-file-multiple"></i>
                  <span class="nav-text">성적관리</span>
                </a>
              </li>
          </ul>
        </div>
        
      </aside>
      <!-- 사이드바 끝 -->

        <script src="./resources/admin/plugins/jquery/jquery.min.js"></script>
        <script src="./resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="./resources/admin/plugins/simplebar/simplebar.min.js"></script>
        <script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>
        
        <script src="./resources/admin/plugins/DataTables/DataTables-1.10.18/js/jquery.dataTables.min.js"></script>
        
        <script src="./resources/admin/plugins/apexcharts/apexcharts.js"></script>
        
        <script src="./resources/admin/js/mono.js"></script>
        <script src="./resources/admin/js/chart.js"></script>
        <script src="./resources/admin/js/map.js"></script>
        <script src="./resources/admin/js/custom.js"></script>
</body>
</html>