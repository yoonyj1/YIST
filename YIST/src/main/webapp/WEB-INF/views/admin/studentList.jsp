<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			    자바
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
				    <tr>
				      <td scope="row">학생1</td>
				      <td>자바1반</td>
				      <td>30.4%</td>
				      <td align='right'><a href='studentDetail.do' class="btn btn-sm btn-info" style='font-weight:bold'>조회</a></td>
				      <td align='center'><button class="btn btn-sm btn-primary" onclick="return confirm('xxx 학생의 수강을 취소하시겠습니까?')">중퇴승인</button></td>
				      <td align='left'><button class='btn btn-sm btn-warning'>출결관리</button></td>
				    </tr>
				    <tr>
				      <td scope="row">2</td>
				      <td>Catrin</td>
				      <td>Seidl</td>
				      <td>@catrin</td>
				      <td>@catrin</td>
				      <td>@catrin</td>
				    </tr>
				    <tr>
				      <td scope="row">3</td>
				      <td>Lilli</td>
				      <td>Kirsh</td>
				      <td>@lilli</td>
				      <td>@lilli</td>
				      <td>@lilli</td>
				    </tr>
				    <tr>
				      <td scope="row">4</td>
				      <td>Else</td>
				      <td>Voigt</td>
				      <td>@voigt</td>
				      <td>@voigt</td>
				      <td>@voigt</td>
				    </tr>
				    <tr>
				      <td scope="row">5</td>
				      <td>Ursel</td>
				      <td>Harms</td>
				      <td>@ursel</td>
				      <td>@ursel</td>
				      <td>@ursel</td>
				    </tr>
				  </tbody>
				</table>
			  </div>
			  <div class="tab-pane fade" id="nav-phython" role="tabpanel" aria-labelledby="nav-python-tab">
			    파이썬
			  </div>
		   	  <div class="tab-pane fade" id="nav-c" role="tabpanel" aria-labelledby="nav-c-tab">
			    C
			  </div>
			</div>
		</div>
					
	</div>
</body>
</html>
