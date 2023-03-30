<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <!-- 얘가 목록 아이콘임 -->
  <link href="resources/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="resources/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="resources/plugins/nprogress/nprogress.css" rel="stylesheet" />
  <link href="resources/plugins/prism/prism.css" rel="stylesheet" />
  
  

  <!-- FAVICON -->
  <link href="resources/images/favicon.png" rel="shortcut icon" />
  
  
  <script src="resources/plugins/nprogress/nprogress.js"></script>
  <link rel="stylesheet" href="resources/css/style.css"/>
  <link rel="stylesheet" href="resources/css/style.css.map"/>
 
</head>


  <body class="navbar-fixed sidebar-fixed" id="body">
    <script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>

        <aside class="left-sidebar sidebar-dark" id="left-sidebar">
          <div id="sidebar" class="sidebar sidebar-with-footer">

            <div class="app-brand">
              <a href="/index.html">
                <img src="resources/images/logo.png" alt="Mono">
                <span class="brand-name">강사입니다</span>
              </a>
            </div>
            <div class="sidebar-left" data-simplebar style="height: 100%;">
              <!-- 왼쪽메뉴창 -->
              <ul class="nav sidebar-inner" id="sidebar-menu">
                <li>
                    <a class="sidenav-item-link" href="index.html">
                      <i class="mdi mdi-briefcase-account-outline"></i>
                      <span class="nav-text">학생</span>
                    </a>
                  </li>

                  <li>
                    <a class="sidenav-item-link" href="team.html">
                      <i class="mdi mdi-account-group"></i>
                      <span class="nav-text">학급</span>
                    </a>
                  </li>

                  <li>
                    <a class="sidenav-item-link" href="calendar.html">
                      <i class="mdi mdi-calendar-check"></i>
                      <span class="nav-text">출석</span>
                    </a>
                  </li>

                  <li>
                    <a class="sidenav-item-link" href="analytics.html">
                      <i class="mdi mdi-chart-line"></i>
                      <span class="nav-text">과제</span>
                    </a>
                  </li>
                
                  <li>
                    <a class="sidenav-item-link" href="chat.html">
                      <i class="mdi mdi-wechat"></i>
                      <span class="nav-text">상담</span>
                    </a>
                  </li>

                  <li>
                    <a class="sidenav-item-link" href="contacts.html">
                      <i class="mdi mdi-phone"></i>
                      <span class="nav-text">강사</span>
                    </a>
                  </li>


                  <li>
                    <a class="sidenav-item-link" href="contacts.html">
                      <i class="mdi mdi-email"></i>
                      <span class="nav-text">학습자료</span>
                    </a>
                  </li>
                  </ul>
                      </div>
                      </div>
</aside>
  </body>
</html>