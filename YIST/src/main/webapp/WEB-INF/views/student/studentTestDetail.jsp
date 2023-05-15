<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String eno = request.getParameter("eno");
%>

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
    border: 1px solid #dae0e9;
  }
  th {
    background-color: #eee;
    font-weight: bold;
  }
  
</style>
</head>
<body>
	<jsp:include page="common/header.jsp"/>
	
	<div class="container">
    <form action="testInsert.st" method="post">
    <input type="hidden" name="eno" value="${e.testNo}">
    <input type="hidden" value="${ loginUser.id }" name="studentId">
    <table style="margin-top: 40px;">
        <caption>수강생 평가</caption>
        <thead>
            <tr>
              <th width="80%" style="text-align: left;">${ e.testTitle }</th>
              <th width="20%" style="text-align: right;">서술형 | 5문항</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td colspan="2" style="text-align: left;">
                	<img alt="" src="${pageContext.request.contextPath}/${e.q1}.png" width="70%">
                    <textarea name="a1" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                	<img alt="" src="${pageContext.request.contextPath}/${e.q2}.png" width="70%">
                    <textarea name="a2" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                	<img alt="" src="${pageContext.request.contextPath}/${e.q3}.png" width="70%">
                    <textarea name="a3" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                	<img alt="" src="${pageContext.request.contextPath}/${e.q4}.png" width="70%">
                    <textarea name="a4" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left;">
                	<img alt="" src="${pageContext.request.contextPath}/${e.q5}.png" width="70%">
                    <textarea name="a5" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
                </td>
            </tr>
        </tbody>
    </table>
    <ul style="text-align: center; margin: 40px;">
        <li>
            <button type="submit" class="btn btn-gray btn-theme-colored btn-circled">제출하기</button>
            <button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="javascript:history.back();">뒤로가기</button>
        </li>
    </ul>
    </form>
  </div>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>