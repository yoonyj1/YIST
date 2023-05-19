<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>




</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="common/header.jsp" />

	<div class="card card-default">
		<div class="card-header">
			<h2>출석관리</h2>
		</div>
		<div class="card-body">
			<h3>${ at.name }님의 출석부</h3>
			<select name="condition">
				<option value="Y">출석</option>
				<option value="N">결석</option>
			</select>
			<div class='tableWrapper'>
				<table class='table'>
					<tr>
						<th>출석날짜</th>
					</tr>
					<c:forEach var='m' items="${ m }">
						<tr>
							<td>${ m.attendanceDate }</td>
						</tr>
					</c:forEach>	
				</table>
			</div>
			
			<hr>
			
			
		</div>
	</div>

</body>
</html>