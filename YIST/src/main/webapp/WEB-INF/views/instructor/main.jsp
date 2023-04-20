<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>선생메인</title>
<style>


.mLeft .mtody {
    position: relative;
    width: 380px;
    height: 150px;
    padding: 30px 30px 0;
    border-width: 1px;
    border-color: #e8ebe9;
    border-radius: 3px;
    background: #a9a9a9;
	margin: 30px;
}

.btn_attend a {
    display: block;
    padding-left: 7px;
    background: url(/LMS/images/icon_td_check.png) no-repeat 18px 33px;
    color: #FFFFFF;
    font-size: 17px;
	font-weight: 500;
    text-decoration: none;
    line-height: 80px;
}

.btn_attend {
    position: absolute;
    top: 40px;
    right: 20px;
    width: 120px;
    height: 80px;
    border-width: 0px;
    border-color: #FFFFFF;
    border-radius: 5px;
    background-color: #02068D;
    font-size: 14px;
    text-align: center;
}

.mconBox1 {
	width: 380px;
    height: 150px;
    margin-bottom: 20px;
    padding: 20px;
    border-width: 1px;
    border-style: solid;
    border-color: #ebebeb;
    border-radius: 3px;
    background: #fff;
	margin-left: 30px;
}

.mconBox2 {
	width: 380px;
    height: 150px;
    margin-bottom: 20px;
    padding: 20px;
    border-width: 1px;
    border-style: solid;
    border-color: #ebebeb;
    border-radius: 3px;
    background: #fff;
	margin-left: 15px;
}

.all_member {
	margin-top: 10px;
    float: left;
    width: 120px;
    margin-left: 5px;
    padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1189/1189981.png) no-repeat right bottom;
	background-size: 45%;
	background-position: right bottom 8px;
	
}

.mNum1 {
    color: #02068D;
    font-size: 30px;
    font-family: 'Rubik', sans-serif;
    line-height: 30px;
    cursor: pointer;
	font-weight: 600;
}

.all_lesson {
	margin-top: 10px;
	margin-left: 50px;
    float: left;
    width: 150px;
    padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png) no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;

}

.all_check {
	margin-top: 10px;
	margin-left: 50px;
    float: left;
    width: 150px;
    padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png) no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;

}

.all_nocheck {
	margin-top: 10px;
	margin-left: 50px;
    float: left;
    width: 150px;
    padding: 0 0 62px 0;
	background: url(https://cdn-icons-png.flaticon.com/512/1903/1903990.png) no-repeat;
	background-size: 45%;
	background-position: right bottom 3px;
}

.st_attend {
    float: left;
    width: 185px;
    height: 120px;
    background: url(/LMS/images/bg_st_attend.png) no-repeat 104px 90px #fff;
    margin-left: 30px;
    border-radius: 10px;
    
}

.st_absence {
    float: left;
    width: 180px;
    height: 120px;
    background: url(/LMS/images/bg_st_absence.png) no-repeat 104px 90px #fff;
    border-radius: 10px;
}

</style>


</head>
<body>

	<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="instructor/common/header.jsp"></jsp:include>
	
	<div style="height:1000px; margin-left: 252px;">
		<br><br>
	<div class="mLeft" >
		<div class="mtody" style="border-radius: 10px;">
			<h1 style="font-weight: 600;">today</h1>
		<div class="mday_date" style="font-size: 23px; color: white;">2023.03.29</div>
		<div class="week" style="font-size: 15px; color: white;">Wendnesday</div>
		<div class="btn_attend">
			<a href=""><i class="mdi mdi-calendar-check"></i>출석체크</a>
		</div>
		</div>

		<div class="mconBox1" style="border-radius: 10px;">
			<div class="all_member">
				<h5 style="font-weight: 600;">전체수강생</h5>
				<div class="mNum1">1</div>
			</div>
			<div class="all_lesson">
				<h5 style="font-weight: 600;">개설학급</h5>
				<div class="mNum1">1</div>
			</div>
		</div>
		
		<div class="st_attend mconBox2">
			<h5 style="font-weight: 600;">출석생</h2>
			<div class="mNum1">0</div>
		</div>
		<div class="st_absence mconBox2">
			<h5 style="font-weight: 600;">결석생</h2>
			<div class="mNum1">0</div>
		</div>
		
	</div>















	</div>
</body>

<title>로그인</title>

<!-- GOOGLE FONTS -->
  <link href="https://fonts.googleapis.com/css?family=Karla:400,700|Roboto" rel="stylesheet">
  <link href="${pageContext.request.contextPath}/resources/instructor/plugins/material/css/materialdesignicons.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath}/resources/instructor/plugins/simplebar/simplebar.css" rel="stylesheet" />

  <!-- PLUGINS CSS STYLE -->
  <link href="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.css" rel="stylesheet" />
  
  <!-- MONO CSS -->
  <link id="main-css-href" rel="stylesheet" href="${pageContext.request.contextPath}/resources/instructor/css/instructor/style.css" />


  <!-- FAVICON -->
  <link href="${pageContext.request.contextPath}/resources/instructor/images/favicon.png" rel="shortcut icon" />

  <script src="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.js"></script>
</head>
<body class="bg-light-gray" id="body">
	<%-- <jsp:include page="instructor/common/header.jsp"></jsp:include> --%>
	
	<script type="text/javascript">
		$(function(){
		})
	</script>
	<div class="container d-flex align-items-center justify-content-center" style="min-height: 100vh">
          <div class="d-flex flex-column justify-content-between">
            <div class="row justify-content-center">
              <div class="col-lg-6 col-md-10">
                <div class="card card-default mb-0">
                  <div class="card-header pb-0">
                    <div class="app-brand w-100 d-flex justify-content-center border-bottom-0">
                      <a class="w-auto pl-0" href="/index.html">
                        <img src="${pageContext.request.contextPath}/resources/instructor/images/logo.png" alt="Mono">
                        <span class="brand-name text-dark">MONO</span>
                      </a>
                    </div>
                  </div>
                  <div class="card-body px-5 pb-5 pt-0">

                    <h4 class="text-dark mb-6 text-center">Sign in for free</h4>

                    <form action="login.me" method="post">
                      <div class="row">
                        <div class="form-group col-md-12 mb-4">
                          <input type="text" class="form-control input-lg" id="id" name="id" aria-describedby="emailHelp"
                            placeholder="아이디">
                        </div>
                        <div class="form-group col-md-12 ">
                          <input type="password" class="form-control input-lg" id="pwd" name="pwd" placeholder="비밀번호">
                        </div>
                        <div class="col-md-12">

                          <div class="d-flex justify-content-between mb-3">

                            <div class="custom-control custom-checkbox mr-3 mb-3">
                              <input type="checkbox" class="custom-control-input" id="customCheck2">
                              <label class="custom-control-label" for="customCheck2">Remember me</label>
                            </div>

                            <a class="text-color" href="#"> Forgot password? </a>

                          </div>

                          <button type="submit" class="btn btn-primary btn-pill mb-4">Sign In</button>

                          <p>Don't have an account yet ?
                            <a class="text-blue" href="sign-up.html">Sign Up</a>
                          </p>
                        </div>
                      </div>
                    </form>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
	
	

</body>
</html>