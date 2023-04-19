<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>과제관리</title>

<script src="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.js"></script>

<style type="text/css">
	tr {
      cursor: pointer;
    }
</style>

</head>
<body>
<div class="page-wrapper">
	<div class="wrapper">
		<!-- 헤더 -->
		<jsp:include page="../instructor/common/header.jsp"></jsp:include>
		
		<div class="content-wrapper table-hover">
        <div class="content">
          <!-- 여기서부터  -->
          <div class="row">
              <!-- 과제 등록 모달 -->
              <div class="modal fade" id="taskInsert" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
				  aria-hidden="true">
				  <div class="modal-dialog" role="document">
				   <form method="post" action="insert.task" enctype="multipart/form-data">
				   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
				   <input type="hidden" name="subjectNo" value="1">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="exampleModalFormTitle">과제 등록</h5>
				        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				          <span aria-hidden="true">×</span>
				        </button>
				      </div>
				      <div class="modal-body">
				          <div class="form-group">
							    <label for="upfile">과제 파일 선택</label>
    							<input type="file" class="form-control-file" id="upfile" name="upfile">
				          </div>
				          <br>
				          
				          <div class="form-group">
				            <label for="exampleInputPassword1">기간설정</label>
				            <br>
				            <label style="margin-right: 5px;">시작일</label>
				            <input type="date" class="task-start" name="startDate">
				            <label>~</label>
				            <label style="margin-right: 5px;">마감일</label>
				            <input type="date" class="task-end" name="endDate">
				          </div>
				          <br>
				          
				          <!-- 과제 제목 -->
						  <div class="form-group">
						     <label for="taskTitle">과제제목</label>
						     <input type="text" class="taskTitle form-control" id="taskTitle" name="taskTitle" placeholder="과제 제목">
						  </div>
						  
						  <!-- 과제 내용 -->
						  <div class="form-group">
						    <label for="exampleFormControlTextarea1">과제 내용</label>
						    <textarea class="taskContent form-control" id="exampleFormControlTextarea1" rows="3" name="taskContent"></textarea>
						  </div>
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
				        <button type="submit" class="task-btn btn btn-primary btn-pill">등록하기</button>
				      </div>
				    </div>
				    </form>
				  </div>
				</div>	
				<!-- 과제 등록 모달 끝 -->
            </div>
            
            <script>
            	$(function(){
            		$(".task-list-table>tbody tr").on("click", function(){
            			if (!$('body').hasClass('modal-open')){
	            			location.href= "detail.task?tno=" + $(this).children().eq(0).html();
            			}
            			
            		})
            		
            		$(".task-set-btn").on("click", function(e){
						let taskSetModalId = '#taskUpdate' + $(this).parents('tr').find(".task-num").html();
            			$(taskSetModalId).modal('show');
            		})
            	})

            </script>
            
            <!-- 과제목록  -->
            <div class="col-10">  
              <div class="row">
              	<div class="col-10 py-3">
              		<h6 style="font-weight: bolder;">과제목록</h6>
              	</div>
              	<div class="col">
              		<!-- 과제 등록 버튼 -->
                  	<button type="button" class="btn btn-primary btn btn-pill py-1 px-3" data-toggle="modal" data-target="#taskInsert">과제등록하기</button>
              	</div>
              </div>
              <hr>
              <br>
              <div class="d-flex flex-row mb-1">
                <div class="col-md-auto" style="margin-left: -10px; margin-top: 3px">
                  <label style="font-size: 13px;">기간별</label>
                </div>
                <div class="col-md-auto"  style="margin-left: -25px;">
                  <div class="btn-group" role="group" aria-label="Basic example" style="font-size: 10px;">
                    <button type="button" class="aa period btn btn-primary" value="today"
                      style="height: 30px; line-height: 9px; font-size: 10px;">오늘</button>
                    <button type="button" class="period btn btn-primary" value="week"
                      style="height: 30px; line-height: 9px; font-size: 12px;">일주일</button>
                    <button type="button" class="period btn btn-primary" value="month"
                      style="height: 30px; line-height: 9px; font-size: 12px;">1개월</button>
                  </div>
                </div>
                <div class="col-md-auto" style="margin-left: -10px; margin-top: 2px;">
                  <label style="margin-right: px; font-size: 13px;">기간</label>
                  <input type="date" class="start">
                  <label>~</label>
                  <input type="date" class="end">
                </div>
                <div class="col-md-auto">
                  <div class="custom-control custom-checkbox d-inline-block mr-3 mb-3">
                    <input type="checkbox" class="custom-control-input" id="customCheck3" checked="checked">
                    <label class="custom-control-label" for="customCheck3" style="font-size: 13px; margin-top: 8px">지난과제</label>
                  </div>
                </div>
                <div class="col-md-auto" style="margin-left: -30px;">
                  <input type="text" style="margin-top: 3px;" placeholder="과제검색">
                  <button type="button" class="btn btn-primary px-1 py-1" style="height: 27px;">검색</button>
                </div>
              </div>


              <table class="table task-list-table" style="text-align: center;">
                <thead style="background-color: lightgray;">
                  <tr>
                    <th scope="col">번호</th>
                    <th colspan="7">제목</th>
                    <th>기간</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <th scope="col" class="task-num">1</td>
                    <th colspan="7">자료형과 연산자1</td>
                    <th>종료</td>
                    <th>
					 <button type="button" class="task-set-btn btn btn-primary btn-pill py-1">관리</button>
                      <!-- 과제 수정, 삭제 모달 -->
		              <div class="modal fade" id="taskUpdate1" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true" style="text-align: left">
						  <div class="modal-dialog" role="document">
						   <form method="post" action="#" enctype="multipart/form-data">
						   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
						   <input type="hidden" name="subjectNo" value="1">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalFormTitle">과제 관리1</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">×</span>
						        </button>
						      </div>
						      <div class="modal-body">
						          <div class="form-group">
									    <label for="upfile">과제 파일 선택</label>
		    							<input type="file" class="form-control-file" id="upfile" name="upfile">
						          </div>
						          <br>
						          
						          <div class="form-group">
						            <label for="exampleInputPassword1">기간설정</label>
						            <br>
						            <label style="margin-right: 5px;">시작일</label>
						            <input type="date" class="task-start" name="startDate">
						            <label>~</label>
						            <label style="margin-right: 5px;">마감일</label>
						            <input type="date" class="task-end" name="endDate">
						          </div>
						          <br>
						          
						          <!-- 과제 제목 -->
								  <div class="form-group">
								     <label for="taskTitle">과제제목</label>
								     <input type="text" class="taskTitle form-control" id="taskTitle" name="taskTitle" placeholder="과제 제목">
								  </div>
								  
								  <!-- 과제 내용 -->
								  <div class="form-group">
								    <label for="exampleFormControlTextarea1">과제 내용</label>
								    <textarea class="taskContent form-control" id="exampleFormControlTextarea1" rows="3" name="taskContent"></textarea>
								  </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="close-btn btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
						        <button type="submit" class="task-btn btn btn-primary btn-pill">삭제하기</button>
						        <button type="submit" class="task-btn btn btn-primary btn-pill">수정하기</button>
						      </div>
						    </div>
						    </form>
						  </div>
						</div>	
						<!-- 과제 수정, 삭제 모달 끝 -->				
                    </th>
                  </tr>
                  
                  <tr>
                    <th scope="col" class="task-num">2</td>
                    <th colspan="7">자료형과 연산자2</td>
                    <th>2023-04-17 ~ 2023-04-18</td>
                    <th>
						<button type="button" class="task-set-btn btn btn-primary btn-pill py-1">관리</button>
					<!-- 과제 수정, 삭제 모달 -->
		              <div class="modal fade" id="taskUpdate2" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true" style="text-align: left">
						  <div class="modal-dialog" role="document">
						   <form method="post" action="#" enctype="multipart/form-data">
						   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
						   <input type="hidden" name="subjectNo" value="1">
						    <div class="modal-content">
						      <div class="modal-header">
						        <h5 class="modal-title" id="exampleModalFormTitle">과제 관리2</h5>
						        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
						          <span aria-hidden="true">×</span>
						        </button>
						      </div>
						      <div class="modal-body">
						          <div class="form-group">
									    <label for="upfile">과제 파일 선택</label>
		    							<input type="file" class="form-control-file" id="upfile" name="upfile">
						          </div>
						          <br>
						          
						          <div class="form-group">
						            <label for="exampleInputPassword1">기간설정</label>
						            <br>
						            <label style="margin-right: 5px;">시작일</label>
						            <input type="date" class="task-start" name="startDate">
						            <label>~</label>
						            <label style="margin-right: 5px;">마감일</label>
						            <input type="date" class="task-end" name="endDate">
						          </div>
						          <br>
						          
						          <!-- 과제 제목 -->
								  <div class="form-group">
								     <label for="taskTitle">과제제목</label>
								     <input type="text" class="taskTitle form-control" id="taskTitle" name="taskTitle" placeholder="과제 제목">
								  </div>
								  
								  <!-- 과제 내용 -->
								  <div class="form-group">
								    <label for="exampleFormControlTextarea1">과제 내용</label>
								    <textarea class="taskContent form-control" id="exampleFormControlTextarea1" rows="3" name="taskContent"></textarea>
								  </div>
						      </div>
						      <div class="modal-footer">
						        <button type="button" class="close-btn btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
						        <button type="submit" class="task-btn btn btn-primary btn-pill">삭제하기</button>
						        <button type="submit" class="task-btn btn btn-primary btn-pill">수정하기</button>
						      </div>
						    </div>
						    </form>
						  </div>
						</div>	
						<!-- 과제 수정, 삭제 모달 끝 -->						
                    </th>
                  </tr>
                </tbody>
              </table>
				
              <!-- 페이징 -->
              <div class="card card-default align-items-center">
                <div class="card-header">
                  <h2></h2>
                </div>
                <div class="card-body">
              
                  <nav aria-label="Page navigation example">
                    <ul class="pagination">
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Previous">
                          <span aria-hidden="true" class="mdi mdi-chevron-left"></span>
                          <span class="sr-only">Previous</span>
                        </a>
                      </li>
                      <li class="page-item active">
                        <a class="page-link" href="#">1</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">2</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#">3</a>
                      </li>
                      <li class="page-item">
                        <a class="page-link" href="#" aria-label="Next">
                          <span aria-hidden="true" class="mdi mdi-chevron-right"></span>
                          <span class="sr-only">Next</span>
                        </a>
                      </li>
                    </ul>
                  </nav>
                </div>
              </div>
            </div>
          </div>


        </div>
      </div>
	</div>
   </div>
   
</body>
</html>