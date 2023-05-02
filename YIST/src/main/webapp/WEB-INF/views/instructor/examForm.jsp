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
	<script>
		function examSetForm(){
			console.log("등록");
			let setTime = $('input[name=examSet]:checked').val();
			console.log("시간 : " + setTime);
			$("#examForm").attr("action", "examStart.ins").submit();
		}
	

	</script>

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
									<form action="scoreForm.ins" method="post">
									<input type="hidden" name="testNo" value="${e.testNo}">
									<tr>
										<td scope="row">${status.count}</td>
										<td>${e.testTitle}</td>
										<td>${e.examDate}</td>
										<c:choose>
											<c:when test="${e.status eq 'Y'}">
												<td>종료</td>
											</c:when>
											<c:otherwise>
												<td>-</td>
											</c:otherwise>
										</c:choose>
										<td>
											<c:choose>
												<c:when test="${e.status eq 'Y'}">
													<button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" data-toggle="modal" data-target="#examStart" disabled>시작</button>
													<button type="submit" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;">채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" data-toggle="modal" data-target="#examStart">시작</button>
													<button type="submit" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;" disabled>채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>												
												</c:otherwise>
											</c:choose>
										</td>
										</form>
										<!-- 과제 등록 모달 -->
							              <div class="modal fade" id="examStart" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
											  aria-hidden="true">
											  <div class="modal-dialog" role="document">
											   <form id="examForm" method="post" action="">
											   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
											   <input type="hidden" name="subjectNo" value="1">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalFormTitle">시험 설정</h5>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="history.go(0)">
											          <span aria-hidden="true">×</span>
											        </button>
											      </div>
											      <div class="modal-body">
											         <div class="form-check">
														  <input type="radio" name="examSet" id="examSet1" value="1" checked>
														  <label for="examSet1">
														    1분
														  </label>
														</div>
														<div class="form-check">
														  <input type="radio" name="examSet" id="examSet2" value="2">
														  <label for="examSet2">
														     2분
														  </label>
														</div>
														<div class="form-check">
														  <input type="radio" name="examSet" id="examSet3" value="3">
														  <label for="examSet3">
														     3분
														  </label>
														</div>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal" onClick="history.go(0);">닫기</button>
											        <button type="button" id="exam-btn" class="btn btn-primary btn-pill" onclick="examSetForm();">설정</button>
											      </div>
											    </div>
											    </form>
											  </div>
											</div>	
											<!-- 과제 등록 모달 끝 -->
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
</body>
</html>