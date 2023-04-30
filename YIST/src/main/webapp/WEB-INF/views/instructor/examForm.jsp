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
		function checkInputNum() {
			if ((event.keyCode < 48) || (event.keyCode > 57)) {
				event.returnValue = false;
			}
		}

		$(function() {
			$(".close, #close").click(function() {
				let getId = '#' + $(this).parents(".s-modal").attr('id');
				console.log(getId);
				$(getId).modal('hide');

			})

			$(".test-end").click(function() {
				if (confirm("평가를 종료 하시겠습니까?")) {
					$(this).prev().attr("disabled", true);
					$(this).attr("disabled", true);
					alert("평가가 종료되었습니다");
				}
			})
		})

		$(document).ready(function() {
					$(".test-start").on("click",function() {
								let title = $(this).parents("tr").children()
										.eq(2).html();

								if (confirm("[" + title + "] 평가를 시작하시겠습니까?")) {
									alert("평가가 시작되었습니다");
									$(this).attr("disabled", true);
									$(this).next().attr("disabled", false);
									$(this).next().next().attr("disabled",
											false);

									let type = '70';
									let target = 'user02';
									let content = '시험이 시작되었습니다.';
									let loginUser = '${loginUser.getId()}';
									let url = '컨트롤러 매핑값';
									//socket.send("관리자,"+target+","+content+","+url);
									socket.send('${loginUser.name},' + target
											+ "," + content + "," + url + ","
											+ loginUser);
								}

							})

					$(document).on("keyup", "#input-score", function() {
						if ($(this).val() > 100) {
							$(this).val(100);
						}

						if ($(this).val() < 0) {
							$(this).val(0);
						}
					})

				})
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
													<button type="button" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;">채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" data-toggle="modal" data-target="#examStart">시작</button>
													<button type="button" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;" disabled>채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>												
												</c:otherwise>
											</c:choose>
										</td>
										<!-- 과제 등록 모달 -->
							              <div class="modal fade" id="examStart" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
											  aria-hidden="true">
											  <div class="modal-dialog modal-lg" role="document">
											   <form id="insertForm" method="post" action="insert.task" enctype="multipart/form-data">
											   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
											   <input type="hidden" name="subjectNo" value="1">
											    <div class="modal-content">
											      <div class="modal-header">
											        <h5 class="modal-title" id="exampleModalFormTitle">과제 등록</h5>
											        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="history.go(0)">
											          <span aria-hidden="true">×</span>
											        </button>
											      </div>
											      <div class="modal-body">
											          
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal" onClick="history.go(0)">닫기</button>
											        <button type="button" class="task-insert btn btn-primary btn-pill" onclick="taskInsertForm();">등록하기</button>
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