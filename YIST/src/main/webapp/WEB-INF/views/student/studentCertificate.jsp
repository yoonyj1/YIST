<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px;">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">수료증 발급</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
        <li class="title"><h3 class="text-uppercase mt-15" style="font-size: 25px; font-weight: bold; margin-top: 40px; margin-bottom: 35px;">이수현황</h3></li>
      </ul>
      <div class="progressbar-container">
		 	  <div class="progress-item">
	    <div class="progress" style="height: 20px;">
	      <div class="progress-bar" data-percent=""></div>
	    </div>
	  </div>
	</div>
	
	<!-- 수료 현황 계산 -->
	<script>
		  var startDate = new Date('${ loginUser.startDate }');
		  var endDate = new Date('${ loginUser.endDate }');
		  
		  var currentDate = new Date();
		  
		  var totalDays = Math.round((endDate - startDate) / (1000 * 60 * 60 * 24));
		  
		  var completedDays = Math.round((currentDate - startDate) / (1000 * 60 * 60 * 24));
		  var completionRate = Math.round((completedDays / totalDays) * 100);
		  
		  $('.progress-bar').attr('data-percent', completionRate);
	</script>
    
    <table style="margin-bottom: 40px">
        <thead>
            <tr higth="20px">
              <th width="15%">번호</th>
              <th width="70%">능력단위명</th>
              <th width="15%">발급</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>1</td>
                <td>프로그래밍 언어 활용</td>
                <td>
                    <button type="button" class="btn btn-gray btn-theme-colored btn-circled">발급</button>
                </td>
            </tr>
        </tbody>
    </table>    
        <%-- <div><img alt="" src="${pageContext.request.contextPath}/resources/student/images/yist/certificate.jpg">  </div> --%>
    <div style="position: relative;">
	  <img src="${pageContext.request.contextPath}/resources/student/images/yist/certificate.jpg" alt="">
	  <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
	    <span>바꿀 텍스트</span>
	  </div>
	</div>
  </div>
  </div>

	<jsp:include page="common/footer.jsp"/>
</body>
</html>