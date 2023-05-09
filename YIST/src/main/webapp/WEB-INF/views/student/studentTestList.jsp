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
    margin-top: 40px;
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
  
  @font-face {
    font-family: 'Pretendard-Regular';
    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
    font-weight: 400;
    font-style: normal;
  }
  
  body * {
  	font-family: 'Pretendard-Regular';
  }
  
</style>
</head>
<body>

	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <table style="margin-bottom: 80px">
        <caption>수강생 평가</caption>
        <thead>
            <tr higth="20px">
              <th width="10%">번호</th>
              <th width="35%">구분</th>
              <th width="15%">평가일</th>
              <th width="15%">점수</th>
              <th width="25%">확인</th>
            </tr>
        </thead>
        <tbody>
        	<c:forEach var="e" items="${ list }">
	            <tr>
	                <td>${ e.testNo }</td>
	                <td>${ e.testTitle }</td>
	                <td>${ e.examDate }</td>
	                <td>96.00</td>
	                <td>
	                    <a href="#" class="btn btn-gray btn-circled">평가준비중</a>
	                    <a href="#" class="btn btn-gray btn-circled">결과확인</a>
	                </td>
	            </tr>
        	</c:forEach>
            
        </tbody>
    </table>
  </div>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>