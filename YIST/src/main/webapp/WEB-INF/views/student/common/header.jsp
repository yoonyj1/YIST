<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body class="">

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
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<script type="text/javascript">
		$(function(){
			console.log('${pageContext.request.contextPath}');
		})
	</script>

</body>
</html>