<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-강의등록</title>
<style>

	table#addClass-table{
		width: 70%;
        margin-left: auto;
        margin-right: auto;
		border-radius: 5px;
    }

	table#addClass-table>tbody th{
		text-align: center;
		vertical-align: middle;
		color: black;
		line-height: 4em;
	}


	table#addClass-table td>input,
	table#addClass-table td>select{
		vertical-align: middle;
		text-align: center;
	}

	table#addClass-table td>label{
		margin-right: 5px;
		line-height: 4em;
	}



</style>

</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>


	<div class="card card-default">
		<div class="card-header">
				<h2>강의 등록</h2>
		</div>
	
		<div class="card-body">
			<form method="post" action="insertSubject.cl">
				<table class="table table-bordered" id="addClass-table" style="border-radius: 5px;">
	
					<tr>
						<th colspan="2">* 강의명</th>
						<td colspan="2">
							<div class="input-group mb-3">
								<input type="text" name="subjectName" class="form-control" placeholder="강의명을 입력하세요">
								<div class="input-group-append">
									<span class="input-group-text mdi mdi-book-open-page-variant" id="basic-addon2"></span>
								</div>
							</div>
						</td>
					</tr>
	
					<tr>
						<th>* 강사명</th>
						<td>
							<div class="form-group">
								<select name="id" class="js-example-basic-multiple form-control" required>
									
									<c:forEach var="i" items="${ iList }">
									
										<option value="${ i.id }">${ i.name }</option>
										
									</c:forEach>

								</select>
							</div>
						</td>
						

						
						<th>* 강의과목</th>
						<td>
							<div class="form-group">
								<select name="classNo" class="js-example-basic-multiple form-control" required>
								
									<c:forEach var="c" items="${ cList }">
									
										<option value="${ c.classNo }">${ c.className }</option>
										
									</c:forEach>

								</select>
							</div>
						</td>
					</tr>
	
					<tr>
						<th>* 수강정원</th>
						<td>
							<div class="form-group">
								<input type="number" name="maximumSeats" min="5" max="10" class="form-control" required>
							</div>
						</td>
						<th>* 수강료</th>
						<td>
							<div class="form-group">
								<input type="number" name="fee" min="0" max="1000000000" step="50000" class="form-control" required>
							</div>
						</td>
					</tr>
	
					<tr>
						<th>* 개강일</th>
						<td>
							<div class="form-group">
								<input type="date" name="startDate" class="form-control" required>
							</div>
						</td>
						
						<th>* 종강일</th>
						<td>
							<div class="form-group">
								<input type="date" name="endDate" class="form-control" required>
							</div>
						</td>
					</tr>
	
					<tr>
						<th colspan="2">* 수업요일</th>
						<td colspan="2">
							<input type="checkbox" name="day" value="월" id="mon">
							<label for="mon">월</label> 
							
							<input type="checkbox" name="day" value="화" id="tue"> 
							<label for="tue">화</label> 
							
							<input type="checkbox" name="day" value="수" id="wed"> 
							<label for="wed">수</label> 
							
							<input type="checkbox" name="day" value="목" id="thu">
							<label for="thu">목</label>
							
							<input type="checkbox" name="day" value="금" id="fri">
							<label for="fri">금</label> 
							
							<input type="checkbox" name="day" value="토" id="sat"> 
							<label for="sat">토</label> 
							
							<input type="checkbox" name="day" value="일" id="sun">
							<label for="sun">일</label>
						</td>
					</tr>
	
						<tr>
	
						</tr>
	
	
				</table>
				
				
				<div class="btn-center">
					<button class="btn btn-primary btn-pill mr-2" type="submit">등록</button>
					<button class="btn btn-light btn-pill" type="button" onclick="javascript:history.back();">취소</button>
				</div>
			</form>
	
	
	
		</div>





	</div>
	
</body>
</html>