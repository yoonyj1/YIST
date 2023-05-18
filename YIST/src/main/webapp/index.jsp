<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
div.title h6 {
	font-size: 50px;
	color: #02068D;
	font-weight: 600;
	background: url() no-repeat 50% 100%;
	line-height: 1.3;
}

div.title .titleP {
	font-size: 13.5px;
	color: #02068D;
	line-height: 1.5;
	margin-top: 30px;
	font-weight: 300;
}

.logincell {
	margin-left: 220px;
	margin-top: 40px;
}

.logincell ul {
	overflow: hidden;
	margin: 0 auto;
	width: 1084px;
	list-style: none;
}

.logincell ul li {
	float: left;
	margin: 0 15px;
	width: 241px;
	border-top: 3px solid #02068D;
	border-bottom: 2px solid #cdd0d1;
	height: 193px;
	text-align: center;
}

.logincell ul li p {
	margin-top: 28px;
	height: 95px;
	font-size: 21px;
	font-weight: 600;
	color: #636363;
}

.sbtn {
	height: 35px;
	line-height: 15px;
	color: #ffffff;
	background-color: #79baff;
	border-color: #79baff;
	padding: 0.36rem 2rem;
	border-radius: 5px;
	font-weight: 400;
}

.gbtn {
	height: 35px;
	line-height: 15px;
	color: #ffffff;
	background-color: #02068D;
	border-color: #02068D;
	padding: 0.36rem 2rem;
	border-radius: 5px;
	font-weight: 400;
}

.tbtn {
	height: 35px;
	line-height: 15px;
	color: #ffffff;
	background-color: #0000FF;
	border-color: #0000FF;
	padding: 0.36rem 2rem;
	border-radius: 5px;
	font-weight: 400;
}
</style>
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alert('${alertMsg}');
		</script>
		<c:remove var="alertMsg" scope="session" />
	</c:if>

  	<div class="contents">
        <div class="title">
            <h6 align="center">YIST</h6>
            <p class="titlep" align="center">
            
                YIST 에서는 수강생들을 위해 다양한 할인혜택과 정부 지원 서비를 연계하여<br>
                온-오프라인의 수강료 절감 등 다양한 혜택과 부가 서비스를 제공하고 있습니다.
            </p>
        </div>
        <div class="logincell">
            <ul>
                <li>
                    <p>학생 로그인</p>
                    <a href="login.ins?sort=3" class="next_join" title="다음단계"><button class="sbtn">로그인</button></a>
                </li>
                <li>
                    <p>강사 로그인</p>
                    <a href="login.ins?sort=2" class="next_join" title="다음단계"><button class="tbtn">로그인</button></a>
                </li>
                <li>
                    <p>관리자 로그인</p>
                    <a href="login.ins?sort=1" class="next_join" title="다음단계"><button class="gbtn">로그인</button></a>
                </li>
            </ul>
        </div>   

    </div> 

</body>
</html>

