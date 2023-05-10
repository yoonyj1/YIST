<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1" />

  <title>ADMIN-강사관리</title>


</head>
<body class="navbar-fixed sidebar-fixed" id="body">
	<script>
      NProgress.configure({ showSpinner: false });
      NProgress.start();
    </script>

	<jsp:include page="common/header.jsp" />

	<div class="card card-default">
		<div class="card-header">
			<h2>강사관리</h2>
		</div>

		<div class="card-body">
			<button type="button" id="deleteTeacher"
				class="btn btn-outline-danger">강사삭제</button>
		</div>
		
		<ul class="nav nav-tabs" id="pills-tab" role="tablist">
		  <li class="nav-item">
		    <a class="nav-link active" id="pills-home-tab" data-toggle="pill" href="#nav-tabs-home" role="tab"
		      aria-controls="nav-tabs" aria-selected="true">강의배정</a>
		  </li>
		  <li class="nav-item">
		    <a class="nav-link" id="nav-profile-tab" data-toggle="pill" href="#nav-profile" role="tab"
		      aria-controls="nav-profile" aria-selected="false">미배정</a>
		  </li>
		</ul>
		<div class="tab-content mt-5" id="nav-tabContent">
		  <div class="tab-pane fade show active" id="nav-tabs-home" role="tabpanel" aria-labelledby="nav-home-tab">
		    <!-- 강사 목록 테이블 -->
			<div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th class="selectTeacher" style="display: none;">선택</th>
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col">담당과목</th>
							<th scope="col" style="text-align: center;">관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="i" items="${ list }">
							<tr>
								<td style="display: none;">
									<input type="checkbox" name="deleteCheck" value=${ i.id }>
								</td>
								<td>${ i.name }</td>
								<c:choose>
									<c:when test="${ not empty i.phone }">
										<td>${ i.phone }</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${ not empty i.subject }">
										<td>${ i.subject }</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<td align="center"><button
										class="btn btn-sm btn-primary selectTeacherButton"
										onclick="location.href='teacherDetail.do?id=${i.id}'">조회</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<div class="card card-default align-items-center"
			style="margin-left: 0px;">
			<div class="card-body">

				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:choose>
							<c:when test="${ pi.currentPage eq 1 }">
								<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="teacherList.do?cpage=${ pi.currentPage - 1 }">Previous</a></li>
							</c:otherwise>
						</c:choose>
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
							<li class="page-item"><a class="page-link"
								href="teacherList.do?cpage=${ p }">${ p }</a></li>
						</c:forEach>
						<c:choose>
							<c:when test="${ pi.currentPage eq pi.maxPage }">
								<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
							</c:when>
							<c:otherwise>
								<li class="page-item"><a class="page-link"
									href="teacherList.do?cpage=${ pi.currentPage + 1 }">Next</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
			</div>
			  </div>
			  <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
			   <div class="card-body">
				<table class="table">
					<thead>
						<tr>
							<th class="selectTeacher" style="display: none;">선택</th>
							<th scope="col">이름</th>
							<th scope="col">전화번호</th>
							<th scope="col" style="text-align: center;">관리</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="n" items="${ nList }">
							<tr>
								<td style="display: none;">
									<input type="checkbox" name="deleteCheck" value=${ n.id }>
								</td>
								<td>${ n.name }</td>
								<c:choose>
									<c:when test="${ not empty n.phone }">
										<td>${ n.phone }</td>
									</c:when>
									<c:otherwise>
										<td>-</td>
									</c:otherwise>
								</c:choose>
								<td align="center"><button
										class="btn btn-sm btn-primary selectTeacherButton"
										onclick="location.href='teacherDetail.do?id=${n.id}'">조회</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
				
			  </div>
			</div>
		
		
		

		
		<script>
       $(function(){
         $("#deleteTeacher").one('click', function(){
           $('.selectTeacher').removeAttr("style");
           $('tbody>tr>td').removeAttr("style");
		   var $deleteButton = $('thead').prepend('<td colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
			
		   	$deleteButton.on('click', function(){
				var valueArr = new Array();
	               
               	let deleteArr = $("input[name='deleteCheck']");
               
               	console.log(deleteArr.val());
               	
	               for(var i = 0; i < deleteArr.length; i++) {
	            	   if(deleteArr[i].checked) {
	            		   valueArr.push(deleteArr[i].value);
	            	   }
	               }
	               
	               
	               if(valueArr.length == 0) {
	            	   alert("선택된 강사가 없습니다.");
	               } else {
	            	   var check = confirm("선택된 강사님을 삭제하시겠습니까?");
	            	   $.ajax({
	            		   url:"checkDelete.ins",
	            		   type:'POST',
	            		   data:{valueArr: valueArr},
	            		   traditional: true,
	            		   success:function(result){
	            			   if(result > 0) {
	            				   console.log(result)
	    							alert("선택 된 강사님을 삭제했습니다.");
	            				   location.reload();
	            			   }
	            		   },
	            		   error: function(){
	            			   /* console.log(valueArr); */
	            			   console.log("선택삭제 ajax 통신 실패");
	            		   }
        	   
            			})
           			}

           
           
			
       
           })		
         })
       })
           
    </script>
	</div>
</body>
</html>