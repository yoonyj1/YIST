<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<jsp:include page="common/header.jsp"/>
	<div class="card card-default">
	
   		<div class="card-header">
			<h2>학생관리</h2>
		</div>
		
		<div class="card-body">
			<ul class="nav nav-tabs mb-3" id="pills-tab" role="tablist">
  				<li class="nav-item">
   					<a class="nav-link active" id="pills-java-tab" data-toggle="pill" href="#nav-tabs-java" role="tab"
      				aria-controls="nav-tabs" aria-selected="true">JAVA</a>
 				</li>
				<li class="nav-item">
				  <a class="nav-link" id="nav-python-tab" data-toggle="pill" href="#nav-phython" role="tab"
				  aria-controls="nav-profile" aria-selected="false">Python</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link" id="nav-c-tab" data-toggle="pill" href="#nav-c" role="tab"
				  aria-controls="nav-profile" aria-selected="false">C</a>
				</li>
			</ul>
			
			<div class="tab-content mt-5" id="nav-tabContent">
			  <div class="tab-pane fade show active" id="nav-tabs-java" role="tabpanel" aria-labelledby="nav-java-tab">
			    <table class="table" style="text-align:center;">
				  <thead>
				    <tr>
				      <th scope="col">이름</th>
				      <th scope="col">수강과목</th>
				      <th scope="col">출석률</th>
				      <th scope="col" colspan='3'>관리</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach var="s" items="${ list }">
		  				<tr>
					      <c:choose>
					      	<c:when test="${s.status eq 'A'}">
					      		<td scope="row">${ s.name }</td>
						      	<td>${ s.subject }</td>
						     	<td>${ s.attendanceRate }</td>
						      	<td colspan='3' align='center'><button class="btn btn-sm btn-primary" onclick="return confirm('${ s.name } 학생의 수강을 취소하시겠습니까?')">중퇴승인</button></td>
					      	</c:when>
					      	<c:otherwise>
						      	<td scope="row">${ s.name }</td>
						     	<td>${ s.subject }</td>
						      	<td>${ s.attendanceRate }</td>
						      	<td align='right'><a href='studentDetail.do?id=${ s.id }' class="btn btn-sm btn-info" style='font-weight:bold'>조회</a></td>
							    <td align='left'><button class='btn btn-sm btn-warning'>출결관리</button></td>
					      	</c:otherwise>
				      	  </c:choose>
					    </tr>
				  	</c:forEach>
				  </tbody>
				</table>
			  </div>
			  <div class="tab-pane fade" id="nav-phython" role="tabpanel" aria-labelledby="nav-python-tab">
			  <table class="table" style="text-align:center;">
				  <thead>
				    <tr>
				      <th scope="col">이름</th>
				      <th scope="col">수강과목</th>
				      <th scope="col">출석률</th>
				      <th scope="col" colspan='3'>관리</th>
				    </tr>
				  </thead>
				  <tbody>
			    <c:forEach var="p" items="${ pList }">
	  				<tr>
				      <c:choose>
				      	<c:when test="${p.status eq 'A'}">
				      		<td scope="row">${ p.name }</td>
					      	<td>${ p.subject }</td>
					     	<td>${ p.attendanceRate }</td>
					      	<td colspan='3' align='center'><button class="btn btn-sm btn-primary" onclick="return confirm('${ p.name } 학생의 수강을 취소하시겠습니까?')">중퇴승인</button></td>
				      	</c:when>
				      	<c:otherwise>
					      	<td scope="row">${ p.name }</td>
					     	<td>${ p.subject }</td>
					      	<td>${ p.attendanceRate }</td>
					      	<td align='right'><a href='studentDetail.do?id=${ p.id }' class="btn btn-sm btn-info" style='font-weight:bold'>조회</a></td>
						    <td align='left'><button class='btn btn-sm btn-warning'>출결관리</button></td>
				      	</c:otherwise>
			      	  </c:choose>
				    </tr>
			  	</c:forEach>
			  	</tbody>
			  	</table>
			  </div>
		   	  <div class="tab-pane fade" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">
		   	  <table class="table" style="text-align:center;">
				  <thead>
				    <tr>
				      <th scope="col">이름</th>
				      <th scope="col">수강과목</th>
				      <th scope="col">출석률</th>
				      <th scope="col" colspan='3'>관리</th>
				    </tr>
				  </thead>
				  <tbody>
			   	<c:forEach var="c" items="${ cList }">
	  				<tr>
				      <c:choose>
				      	<c:when test="${c.status eq 'A'}">
				      		<td scope="row">${ c.name }</td>
					      	<td>${ c.subject }</td>
					     	<td>${ c.attendanceRate }</td>
					      	<td colspan='3' align='center'><button class="btn btn-sm btn-primary" onclick="return confirm('${ c.name } 학생의 수강을 취소하시겠습니까?')">중퇴승인</button></td>
				      	</c:when>
				      	<c:otherwise>
					      	<td scope="row">${ c.name }</td>
					     	<td>${ c.subject }</td>
					      	<td>${ c.attendanceRate }</td>
					      	<td align='right'><a href='studentDetail.do?id=${ c.id }' class="btn btn-sm btn-info" style='font-weight:bold'>조회</a></td>
						    <td align='left'><button class='btn btn-sm btn-warning'>출결관리</button></td>
				      	</c:otherwise>
			      	  </c:choose>
				    </tr>
			  	</c:forEach>
			  	</tbody>
			  	</table>
			  </div>
			</div>
		</div>
					
	</div>
</body>
</html>
