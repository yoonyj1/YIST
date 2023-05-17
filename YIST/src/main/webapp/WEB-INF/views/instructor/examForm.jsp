
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

			<div class="content-wrapper table-hover">
				<div class="content">
					<!-- For Components documentaion -->
					<!-- 메인 -->
					<div class="row">
						<div class="col">
							<div align="center" style="font-size: 25px; color: black;">평가목록</div>
							<hr>
							<table class="table" style="text-align: center;">
								<thead style="background-color: lightgray;">
									<tr>
										<th scope="col">번호</th>
										<th scope="col">평가명</th>
										<th scope="col">평가일</th>
										<th scope="col">상태</th>
										<th scope="col">평가</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${examList}" varStatus="status">
										<form action="scoreForm.ins" method="get">
											<input type="hidden" name="testNo" value="${e.testNo}">
											<tr>
												<td scope="row">${status.count}</td>
												<td>${e.testTitle}</td>
												<c:choose>
													<c:when test="${e.examDate != null}">
														<td>${e.examDate}</td>
													</c:when>
													<c:otherwise>
														<td>-</td>
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${e.status eq 'Y'}">
														<td><div class="timeout">-</div></td>
													</c:when>
													<c:otherwise>
														<td>-</td>
													</c:otherwise>
												</c:choose>
												<td>
															<button type="button" id="test-start${e.testNo}"
																class="test-start mb-1 btn btn-pill btn-primary"
																style="height: 25px; line-height: 10px;"
																data-toggle="modal">시험시작</button>
															<input type="hidden" value="${e.testNo}">
															<button type="submit" id="test-score${e.testNo}"
																class="test-score mb-1 btn btn-pill btn-secondary"
																style="height: 25px; line-height: 10px;">채점</button>
												</td>
											<!-- 과제 등록 모달 -->
											<div class="modal fade" id="examStart${e.testNo}"
												tabindex="-1" role="dialog"
												aria-labelledby="exampleModalFormTitle" aria-hidden="true">
												<div class="modal-dialog" role="document">
													<input type="hidden" name="instructorId"
														value="${loginUser.getId()}"> <input type="hidden"
														name="subjectNo" value="1">
													<div class="modal-content">
														<div class="modal-header">
															<h5 class="modal-title" id="exampleModalFormTitle">시험
																설정</h5>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close" onClick="history.go(0)">
																<span aria-hidden="true">×</span>
															</button>
														</div>
														<div class="modal-body">
															<div class="row">
																<div class="col">
																	<label class="text-primary">시간설정</label>
																	<div class="form-check">
																		<input type="radio" name="examSet" id="examSet1" value="60"> <label for="examSet1">
																			1분 </label>
																	</div>
																	<div class="form-check">
																		<input type="radio" name="examSet" id="examSet2" value="120"> <label for="examSet2"> 2분
																		</label>
																	</div>
																	<div class="form-check">
																		<input type="radio" name="examSet" id="examSet3" value="180"> <label for="examSet3"> 3분
																		</label>
																	</div>
																</div>
																	<div class="col">
																		<label class="text-primary">인원설정</label>
																		<c:forEach var="m" items="${memberList}">
																			<c:if test="${e.testNo eq m.testNo}">
																				<c:choose>
																					<c:when test="${m.status eq 'N'}">
																						<div class="form-check">
																						<input class="form-check-input" type="checkbox"
																							name="mem_chk" id="${m.studentId}"> <label
																							for="mem_chk">[미응시] ${m.name} </label>
																						<input type="hidden" name="status" value="${m.status}">
																						</div>
																					</c:when>
																					<c:otherwise>
																						<c:choose>
																							<c:when test="${m.score == 999}">
																								<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																								name="mem_chk" id="${m.studentId}"> <label
																								for="mem_chk">[미응시] ${m.name} </label>
																								<input type="hidden" name="status" value="${m.status}">
																								</div>	
																							</c:when>
																							<c:when test="${m.score < 60}">
																								<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																								name="mem_chk" id="${m.studentId}"> <label style="color:red"
																								for="mem_chk">[재시험] ${m.name} (${m.score}점) </label>
																								<input type="hidden" name="status" value="${m.status}">
																								</div>	
																							</c:when>
																							<c:otherwise>
																								<div class="form-check">
																								<input class="form-check-input" type="checkbox"
																								name="mem_chk" id="${m.studentId}" disabled="disabled"> <label style="color:blue"
																								for="mem_chk">[응시] ${m.name} (${m.score}점) </label>
																								<input type="hidden" name="status" value="${m.status}">
																								</div>
																							</c:otherwise>
																						</c:choose>
																					</c:otherwise>
																				</c:choose>
																			</c:if>
																		</c:forEach>
																	</div>
															</div>
	
														</div>
														<div class="modal-footer">
															<button type="button" class="btn btn-danger btn-pill"
																data-dismiss="modal" onClick="history.go(0);">닫기</button>
															<button type="button" id="exam-btn"
																class="btn btn-primary btn-pill"
																onclick="examSetForm(${e.testNo});">설정</button>
														</div>
													</div>
												</div>
											</div>
											<!-- 과제 등록 모달 끝 -->
										</form>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
		function examSetForm(testNo){
			let users = [];			
			let alarmUser = [];
			let setTime = $('input[name="examSet"]:checked').val();

			if ($('input:checkbox[name=mem_chk]:checked').length == 0){
				alert("응시할 학생을 선택해주세요.");
			} else if (!$('input[name="examSet"]').is(":checked")) { 
				alert("시간을 설정해 주세요.");
			} else {
				$('input:checkbox[name=mem_chk]').each(function (index) {
					if($(this).is(":checked") == true){
						users.push({"id":$(this).attr("id"), "status":$(this).next().next().val()});
						alarmUser.push($(this).attr("id"));;
				    }
				})
				
				
 				 $.ajax({
					url:'setExam.ins',
					traditional: true,
					data:{
							testNo:testNo
						  , setTime
						  , data: JSON.stringify(users)
					},
					dataType: 'json',
					success:function(result){
						
						if (result > 0){
							let modalId = "";
							
							// ajax 성공시
							modalId = "#test-start" + testNo;
							
							$(modalId).attr("disabled", true);
							
							$(examModalId).modal('hide');
							
							for (let i in alarmUser){
								let type = '시험';
								let title = '자바시험3';
								let target = alarmUser[i];
								let content = "시험 응시가 가능합니다.";
								let sender = '${loginUser.getId()}';

								sendAlarm(type, title, target, content, sender);	
							}
							
							alert("시험 설정을 완료했습니다.");
							
						} else {
							alert("시험 셋팅 실패");
						}
					},
					error:function(){
						alert("시험 ajax 통신 에러");
					}
					
				})  
			}
			
			
		}

	</script>
</body>
</html>











