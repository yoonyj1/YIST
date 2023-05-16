<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="toast.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.css" integrity="sha512-3pIirOrwegjM6erE5gPSwkUzO+3cTjpnV9lexlNZqvupR64iZBnOOTiiLPb9M36zpMScbmUNIcHUqKD47M719g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>


<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/summernote-lite.js"></script>
	<script src="${pageContext.request.contextPath}/resources/admin/plugins/summerNote/lang/summernote-ko-KR.js"></script>
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
							let totalId = "";
							
							$(".score-btn").on("click",function(){
								currentId = "." + $(this).attr("id") + 'input-score';
								totalId = "#total-score" + $(this).attr("id");
								console.log("currentId : " + currentId);
							})
							
							$(document).on('keyup',currentId, function(){
								let sum = 0;
								
								$(currentId).each(function(){
									sum += Number($(this).val());
								})								
								
							    $(totalId).val(sum);
								
								console.log("총점수 : " + $(totalId).val());
							})
							
							$(document).on("keyup", ".input-score", function() {
								console.log($(this).val());
								
								if ($(this).val() > 20) {
										$(this).val(20);
										alert("최대 20점입니다.");
									}
				
									if ($(this).val() < 0) {
										$(this).val(0);
									}
							})
							
							$("#tt").click(function(){
								toastr.info('hi');
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
							<button type="button" id="tt" class="btn btn-primary">토스터</button>
							
								<table class="table" style="text-align: center">
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
										<c:forEach var="e" items="${examSubmitList}" varStatus="status">
											<tr>
												<td scope="row">${status.count}</td>
												<td>${e.name}</td>
												<c:choose>
													<c:when test="${e.score == 999}">
														<td>0/100</td>
													</c:when>
													<c:otherwise>
														<td>${e.score}.00/100</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${e.submitStatus eq 'Y'}">
														<td>완료</td>
														<td><button type="button" class="score-btn mb-1 btn btn-pill btn-primary" id="${e.studentId}" data-toggle="modal" data-target="#${e.studentId}score${status.count}">채점</button></td>
													</c:when>
													<c:otherwise>
														<td>미완료</td>
														<td><button type="button" class="score-btn mb-1 btn btn-pill btn-primary" id="${e.studentId}" data-toggle="modal" data-target="#${e.studentId}score${status.count}" disabled="disabled">채점</button></td>
													</c:otherwise>
												</c:choose>
											</tr>
											<!-- 과제 등록 모달 -->
								              <div class="modal fade" id="${e.studentId}score${status.count}" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
												  aria-hidden="true">
												  <div class="modal-dialog modal-xl" role="document">
												   <form action="examSetScore.ins" method="post">
												   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
												   <input type="hidden" name="subjectNo" value="${loginUser.subject}">
												   <input type="hidden" name="testNo" value="${e.testNo}">
												    <div class="modal-content">
												      <div class="modal-header">
												        <h5 class="modal-title" id="exampleModalFormTitle">${e.name}</h5>
												        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="history.go(0)">
												          <span aria-hidden="true">×</span>
												        </button>
												      </div>
												      <div class="modal-body">
												      		${e.studentId}
												      		<h4>[문제1]</h4>
												      		<br>
															<div class="row">
															  <div class="col">
															    <div class="card">
															      <img class="card-img-top" src="${question.q1}">
															      <div class="card-body">
															      	<br>
															      	<h6>학생답안</h6>
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none" readonly="readonly">${e.a1}</textarea>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none; color: blue;" readonly="readonly">${question.a1}</textarea>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.studentId}input-score" id="input-score1" type="text" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
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
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none" readonly="readonly">${e.a2}</textarea>
															        <hr>
															        
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none; color: blue;" readonly="readonly">${question.a2}</textarea>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.studentId}input-score" id="input-score2" type="text" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
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
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none" readonly="readonly">${e.a3}</textarea>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none; color: blue;" readonly="readonly">${question.a3}</textarea>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.studentId}input-score" id="input-score3" type="text" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
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
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none" readonly="readonly">${e.a4}</textarea>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none; color: blue;" readonly="readonly">${question.a4}</textarea>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.studentId}input-score" id="input-score4" type="text" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
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
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none" readonly="readonly">${e.a5}</textarea>
															        <hr>
															        <h6 style="font-weight: bolder;">모범답안</h6>															        
															        <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" style="resize: none; color: blue;" readonly="readonly">${question.a5}</textarea>
															        
															        <div class="d-flex flex-row mb-1 p-2">
															        <div class="py-4">점수입력 : </div>
																	  <div class="p-2">
							                                                <div class="form-group">
																			    <input class="form-control input-score ${e.studentId}input-score" id="input-score5" type="text" onkeyPress="javascript:checkInputNum();" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
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
																		    <input class="form-control total-score" name="score" id="total-score${e.studentId}" type="text" value="0" min="0" maxlength="100" placeholder="점수를 입력하세요">
																		</div>
																  </div>
															</div>
												      <div class="modal-footer">
												        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal" onClick="history.go(0)">닫기</button>
												        <button type="submit" class="task-insert btn btn-primary btn-pill">저장하기</button>
												        <input type="hidden" name="studentId" value="${e.studentId}">
												        <input type="hidden" name="testTitle" value="${e.testTitle}">
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
	
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" integrity="sha512-VEd+nq25CkR676O+pLBnDW09R7VQX9Mdiij052gVCp5yVH3jGtH70Ho/UUv4mJDsEdTvqRCFZg0NKGiojGnUCw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	
			
</body>
</html>