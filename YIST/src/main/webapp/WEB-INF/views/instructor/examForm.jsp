
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
									<form action="scoreForm.ins" method="post">
									<input type="hidden" name="testNo" value="${e.testNo}">
									<tr>
										<td scope="row">${status.count}</td>
										<td>${e.testTitle}</td>
										<td>${e.examDate}</td>
										<c:choose>
											<c:when test="${e.status eq 'Y'}">
												<td><div class="timeout">-</div></td>
											</c:when>
											<c:otherwise>
												<td>-</td>
											</c:otherwise>
										</c:choose>
										<td>
											<c:choose>
												<c:when test="${e.status eq 'Y'}">
													<button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" data-toggle="modal">시작</button>
													<button type="submit" id="test-score" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;" disabled>채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>
												</c:when>
												<c:otherwise>
													<button type="button" class="test-start mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" data-toggle="modal">시작</button>
													<button type="submit" id="test1-score" class="test-score mb-1 btn btn-pill btn-secondary" style="height: 25px; line-height: 10px;" >채점</button>
													<button type="button" class="test-end mb-1 btn btn-pill btn-primary" style="height: 25px; line-height: 10px;" disabled>종료</button>												
												</c:otherwise>
											</c:choose>
										</td>
										</form>
										<!-- 과제 등록 모달 -->
							              <div class="modal fade" id="examStart" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
											  aria-hidden="true">
											  <div class="modal-dialog" role="document">
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
														  <input type="radio" name="examSet" id="examSet1" value="5" checked>
														  <label for="examSet1">
														    5초
														  </label>
														</div>
														<div class="form-check">
														  <input type="radio" name="examSet" id="examSet2" value="30">
														  <label for="examSet2">
														     30초
														  </label>
														</div>
														<div class="form-check">
														  <input type="radio" name="examSet" id="examSet3" value="60">
														  <label for="examSet3">
														     1분
														  </label>
														</div>
											      </div>
											      <div class="modal-footer">
											        <button type="button" class="btn btn-danger btn-pill" data-dismiss="modal" onClick="history.go(0);">닫기</button>
											        <button type="button" id="exam-btn" class="btn btn-primary btn-pill" onclick="examSetForm();">설정</button>
											      </div>
											    </div>
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
	
	<script>
		function countdown(elementId, seconds){
		  var element, endTime, hours, mins, msLeft, time;
	
		  function updateTimer(){
			msLeft = endTime - (+new Date);
			if ( msLeft < 0 ) {
				if ($("#timeDisplay").val() != ""){
			  		alert("시험종료");
			  		$("#timeDisplay").val("");	
			  		$(".test-score").attr("disabled",false);
				}
			} else {
			  time = new Date( msLeft );
			  hours = time.getUTCHours();
			  mins = time.getUTCMinutes();
			  /* element.innerText = "남은시간 : "+(hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2); */
			  element.value = "남은시간 : "+(hours ? hours + ':' + ('0' + mins).slice(-2) : mins) + ':' + ('0' + time.getUTCSeconds()).slice(-2);
			  setTimeout( updateTimer, time.getUTCMilliseconds());
			}
		  }
	
		  element = document.getElementById(elementId);
		  endTime = (+new Date) + 1000 * seconds;
		  updateTimer();
		
		}
	
		function examSetForm(){
			let setTime = $('input[name=examSet]:checked').val();
			
			let userTime = Math.round(new Date() / 1000);
			
			$.ajax({
				url:"examTime.ins",
				data:{
					setTime:Number(setTime), 
					userTime:Number(userTime)				
				},
				success:function(result){
					$("#examStart").modal('hide');
					
					countdown('timeDisplay', setTime);
				},
				error:function(){
					alert("ajax 통신 실패");
				}
			});
			
		}
		
		$(function(){
			$(".test-start").click(function(){
				if(confirm('평가를 시작하시겠습니까?')){
					$("#examStart").modal('show');
				}
			})
		})
	</script>
</body>
</html>