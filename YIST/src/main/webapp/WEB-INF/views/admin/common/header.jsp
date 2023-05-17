<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>YIST</title>

    <!-- script  -->
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/jquery/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/simplebar/simplebar.min.js"></script>
	<script src="https://unpkg.com/hotkeys-js/dist/hotkeys.min.js"></script>

    <!-- GOOGLE FONTS -->
    <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/admin/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/resources/admin/plugins/simplebar/simplebar.css" rel="stylesheet" />

    <!-- PLUGINS CSS STYLE -->
    <link href="${pageContext.request.contextPath}/resources/admin/plugins/nprogress/nprogress.css" rel="stylesheet" />
    
    
    <link href="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.css" rel="stylesheet" />
    
    
    <!-- MONO CSS -->
    <link id="main-css-href" rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/css/style.css" />

    <!--FontAwesome-->
    <script src="https://kit.fontawesome.com/9824677df6.js" crossorigin="anonymous"></script>

    <!-- FAVICON -->
    <link href="${pageContext.request.contextPath}/resources/admin/images/favicon.png" rel="shortcut icon" />

    <!--
        HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries
    -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="${pageContext.request.contextPath}/resources/admin/plugins/nprogress/nprogress.js"></script>
    
	<!-- 썸머노트 -->

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.css">
	
<style>
	@font-face {
		font-family: 'LINESeedKR-Bd';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Bd.woff2') format('woff2');
		font-weight: 700;
		font-style: normal;            
	}

	@font-face {
		font-family: 'LINESeedKR-Rg';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Rg.woff2') format('woff2');
		font-weight: 400;
		font-style: normal;            
	}

	@font-face {
		font-family: 'LINESeedKR-Th';
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/LINESeedKR-Th.woff2') format('woff2');
		font-weight: 100;
		font-style: normal;            
	}

	*{
		font-family: 'LINESeedKR-Rg';
	}
	
	.card-header h2{
		font-family: 'LINESeedKR-Bd';
	}

	aside.left-sidebar *{
		color: white;
	}
	
	aside.left-sidebar a, aside.left-sidebar span{
        font-family: 'LINESeedKR-Bd';
	}
        
	div.sub-menu span.nav-text:hover{
		color: #99da87;
	}

	.btn-outline-primary:hover{
		background-color: #93cf82;
		border-color: #99da87;
	}

	.btn-outline-primary{
		border-color: #99da87;
		color: #99da87;
	}

	button{
		font-family: 'LINESeedKR-Bd';
		font-weight: 700;
	}
        
	.btn-center{
		width: 100%;
		margin: 40px auto;
		text-align: center;
	}

	.btn-center button.btn-primary{
		background-color: #99da87;
		border-color: #99da87;
	}

	.btn-center button.btn-danger{
	    color: #ffffff;
	    background-color: #fe5461;
	    border-color: #fe5461;	
	}

	.btn-center button.btn-danger:hover{
		color: #ffffff;
		background-color: #fb3a49;
		border-color: #fb3a49;
	}
	
	.btn-center>button.btn-primary:hover{
		background-color: #8eca7d;
		border-color: #8eca7d;
	}
	
	
	.btn-right>button.btn-primary{
		background-color: #99da87;
		border-color: #99da87;
	}

	.btn-right>button.btn-primary:hover{
		background-color: #8eca7d;
		border-color: #8eca7d;
	}
	
	div.card-default{
		margin-left:250px;
	}
	

</style>

</head>

<body class="navbar-fixed sidebar-fixed" id="body">
  
    <script>
        NProgress.configure({ showSpinner: false });
        NProgress.start();
    </script>


	<!-- ====================================
            ——— LEFT SIDEBAR WITH OUT FOOTER
          ===================================== -->
	<aside class="left-sidebar sidebar-dark" id="left-sidebar">
		<div id="sidebar" class="sidebar sidebar-with-footer">
			<!-- Aplication Brand -->
			<div class="app-brand">
				<a href="#" style="cursor: default;"> 
					<img src="${pageContext.request.contextPath}/resources/admin/images/logoBrick.png" alt="YIST 로고" style="width: 50px; height: 50px;"> 
					<span class="brand-name">YIST</span>
				</a>
			</div>
			
			<!-- begin sidebar scrollbar -->
			<div class="sidebar-left" data-simplebar style="height:100%;">
			
				<!-- sidebar menu -->
				<ul class="nav sidebar-inner" id="sidebar-menu">

					<li class="has-sub">
						<a class="sidenav-item-link" href="javascript:void(0)" data-toggle="collapse" data-target="#class-admin" aria-expanded="false" aria-controls="class-admin">
							<i class="fa-solid fa-chalkboard-user" style="color: #ffffff;"></i>
							<span class="nav-text">강의관리</span> <b class="caret"></b>
						</a>
						<ul class="collapse" id="class-admin" data-parent="#sidebar-menu">
							<div class="sub-menu">
								<li>
									<a class="sidenav-item-link" href="classAdminList.ad">
										<span class="nav-text">강의관리</span>
									</a>
								</li>

								<li>
									<a class="sidenav-item-link" href="classMaterialAdminList.ad">
										<span class="nav-text">수업 자료 관리</span>
									</a>
								</li>

								<li>
									<a class="sidenav-item-link" href="examMaterialAdminList.ad"> 
										<span class="nav-text">시험 자료 관리</span>
									</a>
								</li>


							</div>
						</ul>
					</li>


					<li class="has-sub">
						<a class="sidenav-item-link"  href="javascript:void(0)" data-toggle="collapse" data-target="#notice-admin" aria-expanded="false" aria-controls="notice-admin">
							<i class="fa-solid fa-quote-left"></i> 
							<span class="nav-text">공지사항</span>
							<b class="caret"></b>
						</a>
						<ul class="collapse" id="notice-admin" data-parent="#sidebar-menu">
							<div class="sub-menu">

								<li>
									<a class="sidenav-item-link" href="insertForm.no"> 
										<span class="nav-text">공지사항 작성</span>
									</a>
								</li>

								<li>
									<a class="sidenav-item-link" href="noticeAdminList.ad"> 
										<span class="nav-text">공지사항 관리</span>
									</a>
								</li>
								
							</div>
						</ul>
					</li>
					
					<li class="has-sub">
						<a class="sidenav-item-link" href="teacherList.do" >
							<i class="fa-solid fa-person-chalkboard"></i>
							<span class="nav-text">강사관리</span>
						</a>
					</li>

					<li class="has-sub">
						<a class="sidenav-item-link"  href="studentList.do">
							<i class="fa-solid fa-user"></i>
							<span class="nav-text">학생관리</span>
						</a>
					</li>
					
					<li class="has-sub">
						<a class="sidenav-item-link"  href="gradeView.do">
							<i class="fa-solid fa-pen-fancy"></i> 
							<span class="nav-text">성적관리</span>
						</a>
					</li>
					
				</ul>

			</div>


		</div>
	</aside>

	<div class="page-wrapper">
		<header class="main-header" id="header">
			<nav class="navbar navbar-expand-lg navbar-light" id="navbar">
				<!-- Sidebar toggle button -->
				<button id="sidebar-toggler" class="sidebar-toggle">
					<span class="sr-only">Toggle navigation</span>
				</button>

				<span class="page-title"></span>

				<div class="navbar-right ">


					<ul class="nav navbar-nav">
						<!-- Offcanvas -->

						<li class="custom-dropdown">
							
							<div class="dropdown-notify">


								<div class="" data-simplebar style="height: 325px;">
									<div class="tab-content" id="myTabContent">

										<div class="tab-pane fade show active" id="all"
											role="tabpanel" aria-labelledby="all-tabs">

											<div class="media media-sm bg-warning-10 p-4 mb-0">
												<div class="media-sm-wrapper">
													<a href="user-profile.html"> <img
														src="${pageContext.request.contextPath}/resources/admin/images/user/user-sm-02.jpg"
														alt="User Image">
													</a>
												</div>
											</div>


										</div>

									</div>
								</div>

							</div>
						</li>
						<!-- User Account -->
						<li class="dropdown user-menu" >
							<b style="font-weight:900; color:black; margin-right:20px">
								<img src="${loginUser.image}"
									class="user-image rounded-circle" alt="User Image" /> <span
									class="d-none d-lg-inline-block">&nbsp;${ loginUser.name }</span>
							</b>
							<button id="logoutBtn" class="btn btn-sm btn-outline-success" style="margin-right:30px;">로그아웃</button>
						</li>
					</ul>
				</div>
			</nav>

			<script>
				$(function(){
					$('#logoutBtn').click(function(){
						location.href = 'adminLogout.do';
					})
				})
			</script>

		</header>

	</div>






	<script src="${pageContext.request.contextPath}/resources/admin/plugins/prism/prism.js"></script>


	<script src="${pageContext.request.contextPath}/resources/admin/js/mono.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/chart.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/map.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/js/custom.js"></script>
	
	<!-- 썸머노트 -->
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/lang/summernote-ko-KR.js"></script>
</body>
</html>