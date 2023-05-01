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
    
	<jsp:include page="common/header.jsp"/>
	
   	<div class="card card-default">
   		<div class="card-header">
			<h2>강사관리</h2>
		</div>
		
		<div class="card-body">
			<button type="button" class="btn btn-outline-primary" data-toggle="modal" data-target="#exampleModalForm">강사배정</button>
			<button type="button" id="deleteTeacher" class="btn btn-outline-danger">강사삭제</button>
			
			<!-- 모달 시작 -->
              <div class="modal fade" id="exampleModalForm" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
                aria-hidden="true">
                <div class="modal-dialog" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalFormTitle">강사배정</h5>
	                      <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	                        <span aria-hidden="true">×</span>
	                      </button>
                    </div>
                    <div class="modal-body">
                      <form>
                          <div class="form-group">
                            <label for="exampleInputEmail1">강사 선택</label>
                            <br>
                            <select name="teacherList" id="teacherList" style="width: 300px;">
                            	<c:forEach var="t" items="${ nonSubjectList }">
									<option value="${ t.name }">${ t.name }</option>	
                            	</c:forEach>
                            </select>
                          </div>
                          <div class="form-group">
                            <label for="exampleInputPassword1">강의 선택</label>
                            <br>
                            <select name="lectureList" id="lectureList" style="width: 300px;">
                              <option value="강의1">강의1</option>                            
                              <option value="강의2">강의2</option>                            
                              <option value="강의3">강의3</option>                            
                              <option value="강의4">강의4</option>                            
                          	</select>
                          </div>
                          
                          
                          </div>
                          <div class="modal-footer">
                            <button type="submit" class="btn btn-outline-success">저장</button>
                          </div>
                      </form>
                  </div>
                </div>
              </div>
              <!-- 모달 끝 -->
         	</div> 
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
	                    <td class="checkTeacher" style="display: none;"><input type="checkbox"></td>
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
	                    <td align="center"><button class="btn btn-sm btn-primary selectTeacherButton" onclick="location.href='teacherDetail.do?id=${i.id}">조회</button></td>
	                  </tr>
                	</c:forEach>
                </tbody>
              </table>
              </div>
        
        <div class="card card-default align-items-center" style="margin-left:0px;">
		  <div class="card-body">
		
		    <nav aria-label="Page navigation example">
		      <ul class="pagination">
		        <c:choose>
             		<c:when test="${ pi.currentPage eq 1 }">
                    	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                   	</c:when>
					<c:otherwise>                    	
                    	<li class="page-item"><a class="page-link" href="teacherList.do?cpage=${ pi.currentPage - 1 }">Previous</a></li>
                   	</c:otherwise>
                   </c:choose>
		        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.maxPage }">
                	<li class="page-item"><a class="page-link" href="teacherList.do?cpage=${ p }">${ p }</a></li>
                </c:forEach>
		        <c:choose>
                  <c:when test="${ pi.currentPage eq pi.maxPage }">
                 	<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
                  </c:when>
                 <c:otherwise>
                 	<li class="page-item"><a class="page-link" href="teacherList.do?cpage=${ pi.currentPage + 1 }">Next</a></li>
                 </c:otherwise>
                 </c:choose>
		      </ul>
		    </nav>
		  </div>
		</div>
   	</div>
   	 <script>
       $(function(){
         $("#deleteTeacher").one('click', function(){
           $('.selectTeacher').removeAttr("style");
           $('.checkTeacher').removeAttr("style");

           $('.selectTeacherButton').removeClass('btn-primary').addClass('btn-danger').text('삭제').click(function(){
           $(location).attr('href', 'sign-up.html')
           });

           $('thead').prepend('<th colspan="5" align="right">' + '<button class="btn btn-sm btn-danger">삭제</button>');
         })
       })
     </script>
   	</body>
</html>