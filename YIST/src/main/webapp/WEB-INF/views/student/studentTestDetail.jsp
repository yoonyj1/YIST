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
	<jsp:include page="common/header.jsp"/>
	<div id="examTime" align="center" style="background-color:#eee; color: black; font-size: 25px; width: 250px; position: fixed;">
		
	</div>
	<div class="container">
    <form id="testInsert" action="" method="post">
	    <input type="hidden" name="testNo" value="${e.testNo}">
	    <input type="hidden" value="${ loginUser.id }" name="studentId">
	    <table style="margin-top: 40px;">
	        <caption>수강생 평가(${ e.testTitle })</caption>
	        <thead>
	            <tr>
	              <th width="80%" style="text-align: left;"></th>
	              <th width="20%" style="text-align: right;">5문항</th>
	            </tr>
	        </thead>
	        <tbody>
	            <tr>
	                <td colspan="2" style="text-align: left;">
	                	<img alt="" src="${pageContext.request.contextPath}/${e.q1}" width="70%">
	                    <textarea name="a1" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: left;">
	                	<img alt="" src="${pageContext.request.contextPath}/${e.q2}" width="70%">
	                    <textarea name="a2" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: left;">
	                	<img alt="" src="${pageContext.request.contextPath}/${e.q3}" width="70%">
	                    <textarea name="a3" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: left;">
	                	<img alt="" src="${pageContext.request.contextPath}/${e.q4}" width="70%">
	                    <textarea name="a4" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
	                </td>
	            </tr>
	            <tr>
	                <td colspan="2" style="text-align: left;">
	                	<img alt="" src="${pageContext.request.contextPath}/${e.q5}" width="70%">
	                    <textarea name="a5" id="" cols="100%" rows="5" style="margin: 10px"></textarea>
	                </td>
	            </tr>
	        </tbody>
	    </table>
	    <ul style="text-align: center; margin: 40px;">
	        <li>
	            <button type="button" id="examSubmit-btn" class="btn btn-gray btn-theme-colored btn-circled">제출하기</button>
	            <button type="button" class="btn btn-gray btn-theme-colored btn-circled" onclick="javascript:history.back();">뒤로가기</button>
	        </li>
	    </ul>
    </form>
  </div>
  
  <script type="text/javascript">
  		countdown('examTime', '${e.examTime}');
  		$(function(){
  			$("#examSubmit-btn").click(function(){
  				$("#testInsert").attr("action", "testInsert.st").submit();
  				
  				let type = '시험';
				let title = '자바시험3';
				let target = 'INSTRUCTOR01';
				let content = "평가 완료";
				let sender = '${loginUser.getId()}';

				sendAlarm(type, title, target, content, sender);
  			})
  		})
  </script>
  
  <jsp:include page="common/footer.jsp"/>
</body>
</html>