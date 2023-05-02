<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	

	<div class="page-wrapper">
		<div class="wrapper">
			<!-- 헤더 -->
			<jsp:include page="../instructor/common/header.jsp"></jsp:include>
			
				<script type="text/javascript">
						function checkInputNum() {
							if ((event.keyCode < 48) || (event.keyCode > 57)) {
								event.returnValue = false;
							}
						}
						
						$(document).ready(function() {
							let currentId = "";
							
							$(".score-btn").on("click",function(){
								currentId = "." + $(this).attr("id") + 'input-score';
								console.log("currentId : " + currentId);
							})
							
							$(document).on('keyup',currentId, function(){
								let sum = 0;
								
								$(currentId).each(function(){
									sum += Number($(this).val());
								})								
								
							    $("#total-score").val(sum);
								
								console.log("총점수 : " + $("#total-score").val());
							})
							
							$(document).on("keyup", ".input-score", function() {
								if ($(this).val() > 20) {
										$(this).val(20);
										alert("최대 20점입니다.");
									}
				
									if ($(this).val() < 0) {
										$(this).val(0);
									}
							})
						})
				</script>
			<div class="content-wrapper table-hover">
				<div class="content">

					<div class="row">
						<div class="col">
							<div align="center" style="font-size: 25px; color: black;">${question.testTitle}</div>
							<hr>
							<!-- 시험참여 학생 목록 -->
							<div class="table-hover">
							<script src="${pageContext.request.contextPath}/resources/instructor/js/custom.js"></script>
							<a id="toaster-success" href="javascript:" class="btn btn-success btn-pill">Success</a>
								<table class="table">
									<thead style="background-color: darkgray;">
										<tr>
											<th scope="col">번호</th>
											<th scope="col">이름</th>
											<th scope="col">점수</th>
											<th scope="col">상태</th>
											<th scope="col"></th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="e" items="${examSubmitList}"
											varStatus="status">
											<tr>
												<td scope="row">${status.count}</td>
												<td>${e.name}</td>
												<td>${e.score}/100</td>
												<c:choose>
													<c:when test="${e.submitStatus == 'N'}">
														<td>미완료</td>
														<td><button type="button" class="mb-1 btn btn-pill btn-primary" disabled>채점</button></td>
														<input type="hidden" name="id" value="${e.id}"> 
													</c:when>
													<c:otherwise>
														<td>완료</td>
														<td><button type="button" class="score-btn mb-1 btn btn-pill btn-primary" id="${e.id}" data-toggle="modal" data-target="#${e.id}score${status.count}">채점</button></td>
													</c:otherwise>
												</c:choose>
											</tr>
											<!-- 과제 등록 모달 -->
								              <div class="modal fade" id="${e.id}score${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
												  aria-hidden="true">
												  <div class="modal-dialog modal-xl" role="document">
												   <form>
												   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
												   <input type="hidden" name="subjectNo" value="1">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalFormTitle">${e.name}</h5>
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="history.go(0)">
												          <span aria-hidden="true">×</span>
												        </button>
												      </div>
												      <div class="modal-body">
												      		<h4>[문제1]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q1}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <p class="card-text pb-3">${e.a1}</p>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <p class="card-text pb-3" style="color:blue">${question.a1}</p>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.id}input-score" id="input-score1" type="number" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																			</div>
																	  </div>
																	</div>
																   </div>
																   
															      </div>
															    </div>
															  </div>
												      		<hr>
												      		
												      		<h4>[문제2]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q2}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <p class="card-text pb-3">${e.a2}</p>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <p class="card-text pb-3" style="color:blue">${question.a2}</p>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.id}input-score" id="input-score2" type="number" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																			</div>
																	  </div>
																	</div>
																   </div>
															        
															    </div>
															  </div>
												      		</div>
												      		<hr>
												      		
												      		<h4>[문제3]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q3}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <p class="card-text pb-3">${e.a3}</p>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <p class="card-text pb-3" style="color:blue">${question.a3}</p>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.id}input-score" id="input-score3" type="number" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																			</div>
																	  </div>
																	</div>
																   </div>
															        
															      </div>
															    </div>
															  </div>
												      		<hr>
												      		
												      		<h4>[문제4]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q4}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <p class="card-text pb-3">${e.a4}</p>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <p class="card-text pb-3" style="color:blue">${question.a4}</p>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.id}input-score" id="input-score4" type="number" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																			</div>
																	  </div>
																	</div>
																   </div>
															        
															      </div>
															    </div>
															  </div>
												      		<hr>
												      		
												      		<h4>[문제5]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q5}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <p class="card-text pb-3">${e.a5}</p>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <p class="card-text pb-3" style="color:blue">${question.a5}</p>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.id}input-score" id="input-score5" type="number" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																			</div>
																	  </div>
																	</div>
																   </div>
															        
															      </div>
															    </div>
															  </div>
												      		<hr>
												      		
												      		</div>
												      		
												      		<div class="d-flex flex-row mb-1 p-2">
															    <div class="py-4">총점수 : </div>
																  <div class="p-2">
							                                            <div class="form-group">
																		    <input class="form-control total-score" id="total-score" type="number" value="10" min="0" maxlength="100" placeholder="점수를 입력하세요">
																		</div>
																  </div>
															</div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal" onClick="history.go(0)">닫기</button>
												        <button type="button" class="task-insert btn btn-primary btn-pill">저장하기</button>
												      </div>
												    </div>
												    </form>
												  </div>
												</div>	
												<!-- 과제 등록 모달 끝 -->
										</c:forEach>
									</tbody>
								</table>
							</div>
							<!-- 시험참여 학생 목록 끝 -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	
			
</body>
</html>