<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    table {
    border-collapse: collapse;
    width: 100%;
    margin: 13px 0 37px 0;
    text-align: center;
  }
  
  caption {
    font-size: 24px;
    font-weight: bold;
    margin-bottom: 10px;
    text-align: center;
  }
  
  th,
  td {
    height: 50px;
    padding: 10px;
    text-align: center;
    border: 1px solid #dae0e9;
  }

  th {
    background-color: #eee;
    font-weight: bold;
  }
  
#search-area {
  width: 100%;
  margin-bottom: 30px;
}

form {
  display: flex;
  justify-content: center;
}

select, input{
  text-align: center;
  padding: 5px;
  border: 1px solid #ccc;
  border-radius: 5px;
}

button {
  background-color: #9cd3f4;
  border: none;
  border-radius: 5px;
  cursor: pointer;
}

</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <div class="sub08_title">
      <ul style="text-align: center; margin-top: 40px;">
        <li class="title"><h2 class="text-uppercase mt-15" style="font-size: 30px; font-weight: bold;">평가현황</h2></li>
        <li class="class"><p class="lead" style="margin-bottom: 0%;">자바(JAVA)기반 공공데이터 융합 개발자 양성과정A</p></li>
        <li class="classroom"><p class="mb-15">2022. 10. 18 ~ 2023. 05. 19 09:00~15:30 (김시연 강사)</p></li>
      </ul>
    </div> 
    <div>
      <table style="margin-top: 50px;">
        <thead>
            <tr higth="20px">
              <th colspan="5" style="background-color: #2a4d93; color: white;">성취수준 표시기준</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <th>90 ~ 100</th>
                <th>80 ~ 89</th>
                <th>70 ~ 79</th>
                <th>60 ~ 69</th>
                <th>60 미만</th>
            </tr>
            <tr>
                <td>매우 우수</td>
                <td>우수</td>
                <td>보통</td>
                <td>미흡</td>
                <td>매우 미흡</td>
            </tr>
        </tbody>    
    </div>
    <div class="entry-content">
      <table style="margin-bottom: 40px;">
        <thead>
            <tr higth="20px">
              <th width="10%">번호</th>
              <th width="35%">구분</th>
              <th width="15%">점수</th>
              <th width="25%">성취수준</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="e" items="${list}">
        		<c:if test="${e.score < 999}">
		            <tr>
		                <td>${e.testNo}</td>
		                <td>${e.testTitle}</td>
		                <td>${e.score}</td>
		                <c:choose>
		                	<c:when test="${e.score > 89}">
				                <td>매우우수</td>
		                	</c:when>
		                	<c:when test="${e.score > 79}">
		                		<td>우수</td>
		                	</c:when>
		                	<c:when test="${e.score > 69}">
		                		 <td>보통</td>
		                	</c:when>
		                	<c:when test="${e.score > 59}">
		                		<td>미흡</td>
		                	</c:when>
		                	<c:otherwise>
		                		<td>매우 미흡</td>
		                	</c:otherwise>
		                </c:choose>
		            </tr>
        		</c:if>
        	</c:forEach>
        </tbody>
      </table>
    </div>    
       
  </div>
	
	<jsp:include page="common/footer.jsp"/>
</body>
</html>