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
   	<jsp:include page="common/header.jsp"/>
    <div class="card card-default">
		<div class="card-header">
			<h2>강사 정보(강의)</h2>
		</div>
		
		<div class="card-body" align="center">
	    	<div class="card card-profile" style='border:none;'>
	    		<div align='center'>
		    		<div class="card-header-bg" style="background-image:url(assets/img/user/user-bg-01.jpg)"></div>
		    			<div class="card-body card-profile-body">
		    				<div class="profile-avata">
					          <img class="rounded-circle" src="${ td.image }" width=30% height=30%>
					          <span class="h5 d-block mt-3 mb-2">${ td.name }</span>
					        </div>
	    			</div>
    			</div>
   			</div>
		</div>
		
		<div class="card-footer card-profile-footer">
	        <ul class="nav nav-border-top justify-content-center">
	          <li class="nav-item">
	            <a class="nav-link" href="teacherDetail.do?id=${ td.id }">프로필</a>
	          </li>
	          <li class="nav-item">
	            <a class="nav-link active" href="teacherDetail-lecture.do?id=${ td.id }">강의</a>
	          </li>
	        </ul>
  		</div>
      		
      		<br>
      		
    <div class="card">
      <div class="card-header">
        <h1>${ td.subject }</h1>
      </div>
      <div class="card-body">
        <h5>학생목록</h5>
        <br>
        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-01.jpg" alt="User Image">
            </a>
          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Selena Wagner</span>
              <span class="discribe">Designer</span>
            </a>
          </div>
        </div>

        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-02.jpg" alt="User Image">
            </a>
          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Walter Reuter</span>
              <span>Developer</span>
            </a>
          </div>
        </div>

        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-03.jpg" alt="User Image">
            </a>
          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Larissa Gebhardt</span>
              <span>Cyber Punk</span>
            </a>
          </div>
        </div>

        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-04.jpg" alt="User Image">
            </a>

          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Albrecht Straub</span>
              <span>Photographer</span>
            </a>
          </div>
        </div>

        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-05.jpg" alt="User Image">
            </a>
          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Leopold Ebert</span>
              <span>Fashion Designer</span>
            </a>
          </div>
        </div>

        <div class="media media-sm">
          <div class="media-sm-wrapper">
            <a href="user-profile.html">
              <img src="images/user/user-sm-06.jpg" alt="User Image">
            </a>
          </div>
          <div class="media-body">
            <a href="user-profile.html">
              <span class="title">Selena Wagner</span>
              <span>Photographer</span>
            </a>
          </div>
        </div>

      </div>
    </div>
  </div>
    
</body>
</html>