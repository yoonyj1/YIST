<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과제 상세</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>

			<div class="content-wrapper table-hover">
				<div class="content">
					<h3 align="center">자료형과 연산자</h3>
					<hr>

					<div class="row">
						<div class="col" align="right">
							<div class="custom-control custom-checkbox d-inline-block mr-3 mb-3">
		                    	<input type="checkbox" class="custom-control-input" id="customCheck3" checked="checked">
		                    	<label class="custom-control-label" for="customCheck3" style="font-size: 13px; margin-top: 8px">미완료 과제</label>
		                  	</div>
						</div>
					</div>

					<div class="row">
					
					
						<div class="col">
							<table class="table detail-table" style="text-align: center;">
								<thead style="background-color: lightgray;">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">제목</th>
										<th scope="col">이름</th>
										<th scope="col">완료여부</th>
										<th scope="col">확인여부</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th scope="col">1</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">조진원</th>
										<th scope="col">완료</th>
										<th scope="col">확인</th>
									</tr>
									<!-- 과제 모달 시작 -->
				                    <div class="modal fade" id="taskModal1" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
												    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/instructor/images/test1.PNG" alt="Card image cap">
											  </div>
											  <!-- 학생답끝 -->
				                          </div>
				                          <div class="modal-footer">
				                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
				                            <button type="button" class="btn btn-primary btn-pill">확인하기</button>
				                          </div>
				                        </div>
				                      </div>
				                    </div>
				                    <!-- 과제 모달 끝 -->
				                    
									<tr>
										<th scope="col">2</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">김진원</th>
										<th scope="col">-</th>
										<th scope="col">-</th>
										<!-- 과제 모달 시작 -->
					                    <div class="modal fade" id="taskModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
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
					                          	  <!-- 학생답 시작 -->
					                              <div class="card">
													    <img class="card-img-top" src="${pageContext.request.contextPath}/resources/instructor/images/test1.PNG" alt="Card image cap">
												  </div>
												  <!-- 학생답끝 -->
					                          </div>
					                          <div class="modal-footer">
					                            <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal">닫기</button>
					                            <button type="button" class="btn btn-primary btn-pill">확인하기</button>
					                          </div>
					                        </div>
					                      </div>
					                    </div>
					                    <!-- 과제 모달 끝 -->
									</tr>
									
									<tr>
										<th scope="col">3</th>
										<th scope="col">자료형과 연산자</th>
										<th scope="col">박진원</th>
										<th scope="col">완료</th>
										<th scope="col">-</th>
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

							
							
							<!-- 학생별 과제 상세보기 -->
							<script type="text/javascript">
								$(function(){
									$(".detail-table tr").click(function(){
										console.log($(this).children('th').eq(0).html());
										let taskModalId = '#taskModal' + $(this).children('th').eq(0).html();
										$(taskModalId).modal('show');
									})
								})
							</script>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

















