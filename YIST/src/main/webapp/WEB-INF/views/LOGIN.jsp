<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 선택창</title>
<style>
div.title h6 {
	font-size: 50px;
	color: #02068D;
	font-weight: 600;
	line-height: 1.3;
	margin-bottom: 50px;
}

div.title .titleP {
	font-size: 13.5px;
	color: #02068D;
	line-height: 1.5;
	margin-top: 30px;
	font-weight: 300;
}

.gbtn {
	height: 35px;
	line-height: 15px;
	color: #ffffff;
	background-color: #02068D;
	border-color: #02068D;
	padding: 0.4rem 4rem;
	border-radius: 5px;
	font-weight: 400;
	margin-top: 25px;
	margin-left: 70px;
}

.logincell {
	border: 2px solid #02068D;
	width: 700px;
	border-radius: 10px;
}

.logincell ul {
	overflow: hidden;
	width: 700px;
	list-style: none;
}

.logincell ul li {
	float: left;
	width: 200px;
	border-bottom: 2px solid #02068D;
	height: 30px;
	margin-left: 15px;
	margin-top: 30px;
	color: black;
}

.logincell ul li a {
	color: black;
}

.id_password input {
	margin-top: 10px;
	width: 200px;
	height: 35px;
}
</style>
<!-- jqeury -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

<!-- alert -->
<script
	src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
<!-- Default theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
<!-- Semantic UI theme -->
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />

</head>
<body>
	<c:if test="${not empty alertMsg}">
		<script type="text/javascript">
			alertify.alert("${alertMsg}");
		//<c:remove var="alertMsg" scope="session"/>
		</script>
	</c:if>
	<script type="text/javascript">
		$(function(){
			console.log("dd");
		})
	</script>
	<div class="contents" align="center">
		<div class="title">
			<h6 align="center">YIST</h6>
			<p class="titlep" align="center">
				YIST 에서는 수강생들을 위해 다양한 할인혜택과 정부 지원 서비를 연계하여<br> 온-오프라인의 수강료 절감 등
				다양한 혜택과 부가 서비스를 제공하고 있습니다.
			</p>
		</div>
		<div class="logincell" align="center">
			<form action="login.me" method="post">
				<div class="id_password" align="center">
					<br> <br> 아이디&nbsp;&nbsp;&nbsp;&nbsp;<input type="text"
						id="id" name="id" onkeypress="f_login();"
						placeholder="아이디 (*이메일 형식 입력불가)" autofocus=""> <br>
					비밀번호 <input type="password" id="pwd" name="pwd"
						onkeypress="f_login();" placeholder="비밀번호"
						style="margin-top: 8px;"> <br> <a href="">
						<button class="btn btn-primary" type="submit">로그인</button>
					</a>
				</div>
				<br>
				<ul align="center">
					<li><a href="" style="text-decoration-line: none;">아이디찾기</a></li>
					<li><a href="" style="text-decoration-line: none;">비밀번호찾기</a></li>
					<li><a href="" style="text-decoration-line: none;">회원가입</a></li>
				</ul>
			</form>
		</div>

	</div>

	<!-- <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script> -->
</body>
</html>

