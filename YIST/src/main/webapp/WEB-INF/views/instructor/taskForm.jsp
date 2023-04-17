<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="${pageContext.request.contextPath}/resources/plugins/nprogress/nprogress.js"></script>

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
        <div class="content"><!-- For Components documentaion -->

          <!-- 여기서부터  -->
          <div class="row">
              <!--
            <div class="col-md-auto" style="background-color: white;">
              <div class="row mx-1" style="font-weight: bolder; font-weight: bold;">과제 컨텐츠</div>
              <div class="row mx-1">
                과제폴더 시작
                <div class="container" style="height: 600px;">
                  <div class="row">
                    
                    <div id="left" class="span3">
                      <ul id="menu-group-1" class="nav menu">
                        <li class="item-1 deeper parent active">
                          <a class="" href="#">
                            <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-1" class="sign"><i
                                class="icon-plus icon-white"></i></span>
                            <span class="lbl">자바프로그래밍</span>
                          </a>
                          <ul class="children nav-child unstyled small collapse" id="sub-item-1">
                            
                            1주차
                            <li class="item-2 deeper parent active">
                              <a class="" href="#">
                                <span data-toggle="collapse" data-parent="#menu-group-1" href="#sub-item-2"
                                  class="sign"><i class="icon-plus icon-white"></i></span>
                                <span class="lbl">과제</span>
                              </a>
                              <ul class="children nav-child unstyled small collapse" id="sub-item-2">
                              
                                <li class="item-3">
                                  <a class="" href="#">
                                    <span class="sign"><i class="icon-play"></i></span>
                                    <span class="lbl file">변수</span>
                                  </a>
                                </li>
                                
                                <li class="item-4">
                                  <a class="" href="#">
                                    <span class="sign"><i class="icon-play"></i></span>
                                    <span class="lbl file">연산자</span>
                                  </a>
                                </li>
                                
                                <li class="item-4">
                                  <a class="" href="#">
                                    <span class="sign"><i class="icon-play"></i></span>
                                    <span class="lbl file">제어문</span>
                                  </a>
                                </li>
                                
                                <li class="item-4">
                                  <a class="" href="#">
                                    <span class="sign"><i class="icon-play"></i></span>
                                    <span class="lbl file">반복문</span>
                                  </a>
                                </li>
                                
                                <li class="item-4">
                                  <a class="" href="#">
                                    <span class="sign"><i class="icon-play"></i></span>
                                    <span class="lbl file">배열</span>
                                  </a>
                                </li>
                              </ul>
                            </li>
  
  
                          </ul>
                        </li>
  
                      </ul>
                    </div>
                  </div>
                </div>

              </div> -->
              
              
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

              <!-- 과제폴더 끝 -->
              <script>
                $(function () {
                	
                  $(document).on("click", "#left ul.nav li.parent > a > span.sign", function () {
                    $(this).find('i:first').toggleClass("icon-minus");
                  });

                  // Open Le current menu
                  $("#left ul.nav li.parent.active > a > span.sign").find('i:first').addClass("icon-minus");
                  $("#left ul.nav li.current").parents('ul.children').addClass("in");


                })
                
                $(document).ready(function(){
                  // 과제 추가
                  $(document).on("click",".file", function(){
                    console.log("파일 클릭");
                    console.log($(this).html());
                    let title = $(this).html();
                    $(".conn").append("<input type=\"checkbox\" class=\"custom-control-input\" id=\"customCheck1\" checked=\"checked\"> <label class=\"custom-control-label\" for=\"customCheck1\">" + title + "</label> <label class=\"deleteTask\" style=\"cursor: pointer;\">X</label>");
                  })

                  // 과제 삭제
                  $(document).on("click",".deleteTask", function(){
                    $(this).parent().children().remove();
                    console.log("삭제 버튼");
                  });
                })
              </script>

            </div>
            <!-- 과제목록  -->
            <div class="col-10">  
              <div class="row">
              	<div class="col-10 py-3">
              		<h6 style="font-weight: bolder;">과제목록</h6>
              	</div>
              	<div class="col">
              		<!-- 과제 등록 버튼 -->
                  	<button type="button" class="btn btn-info btn-pill py-1 px-3" data-toggle="modal" data-target="#taskInsert">과제등록하기</button>
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
                    <button type="button" class="period btn btn-primary" value="today"
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
                    <label class="custom-control-label" for="customCheck3" style="font-size: 13px; margin-top: 8px">미완료 과제</label>
                  </div>
                </div>
                <div class="col-md-auto" style="margin-left: -30px;">
                  <input type="text" style="margin-top: 3px;" placeholder="과제검색">
                  <button type="button" class="btn btn-primary px-1 py-1" style="height: 27px;">검색</button>
                </div>
              </div>


              <table class="table" style="text-align: center;">
                <thead style="background-color: lightgray;">
                  <tr>
                    <th scope="col">번호</th>
                    <th scope="col">제목</th>
                    <th scope="col">학생명</th>
                    <th scope="col">완료여부</th>
                    <th scope="col">확인여부</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td scope="row" style="width: 60px;">1</td>
                    <td>정수의 합</td>
                    <td>조진원</td>
                    <td>완료</td>
                    <td><button type="button" class="btn btn-primary" style="height: 30px; line-height: 15px;"
                        data-toggle="modal" data-target="#grade1">확인하기</button></td>
                    <!-- 채점 모달1 시작 -->
                    <div class="modal fade" id="grade1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                      aria-hidden="true">
                      <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">정수의합 (조진원)</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                          	  <!-- 학생답 시작 -->
                              <div class="card">
								    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/images/test1.PNG" alt="Card image cap">

								  
							  </div>
							  <!-- 학생답끝 -->
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary btn-pill">Save Changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- 채점 모달 끝 -->
                    
                  </tr>
                  <tr>
                    <td scope="row" style="width: 60px;">2</td>
                    <td>정수의 합</td>
                    <td>김진원</td>
                    <td>완료</td>
                    <td>-</td>
                    <!-- 채점 모달2 시작 -->
                    <div class="modal fade" id="update1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                      aria-hidden="true">
                      <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">정수의합 (김진원)</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            Modal body text goes here.
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary btn-pill">Save Changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- 채점 모달 끝 -->
                  </tr>

                  <!-- 미완료  -->
                  <tr>
                    <td scope="row" style="width: 60px;">3</td>
                    <td>정수의 합</td>
                    <td>이진원</td>
                    <td>미완료</td>
                    <td>확인</td>
                    <!-- 채점 모달2 시작 -->
                    <div class="modal fade" id="update1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
                      aria-hidden="true">
                      <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                          <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">정수의합 (김진원)</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                              <span aria-hidden="true">×</span>
                            </button>
                          </div>
                          <div class="modal-body">
                            Modal body text goes here.
                          </div>
                          <div class="modal-footer">
                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary btn-pill">Save Changes</button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- 채점 모달 끝 -->
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
   
      <script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/resources/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
</body>
</html>