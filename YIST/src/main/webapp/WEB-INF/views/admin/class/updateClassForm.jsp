<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN-강의수정</title>
<style>

	div.btn-center>button:first-child{
		background-color: #99da87;
		border-color: #99da87;
	}
	
	table#updateClass-table>tbody th{
		text-align: center;
		vertical-align: middle;
		color: black;
		line-height: 4em;
	}

	div.btn-center>button:first-child:hover{
		background-color: #8eca7d;
		border-color: #8eca7d;
	}


	
	table#updateClass-table td>input,
	table#updateClass-table td>select{
		vertical-align: middle;
	}

	table#updateClass-table td>label{
		margin-right: 5px;
		line-height: 4em;
	}	
	
	
	#updateClass-table{
		width:70%;
		margin-left: auto;
    margin-right: auto;
    border-radius: 5px;
	}
	
</style>

</head>
<body class="navbar-fixed sidebar-fixed" id="body">

	<jsp:include page="../common/header.jsp"/>
	

	
	<div class="card card-default">
              <div class="card-header">
                <h2>강의 수정</h2>
              </div>

              <div class="card-body">
                <form method="post" action="" id="subjectForm">
                  <input type="hidden" value="${ s.subjectNo }" name="subjectNo">	
                  <input type="hidden" value="${ i.id }" name="instructorId">	

                  <table class="table table-bordered" id="updateClass-table" style="border-radius: 5px;">
                    
                    <tr>
                      <th colspan="2">강의명</th>
                      <td colspan="2">
                        <div class="input-group mb-3">
                          <input type="text" name="subjectName" value="${ s.subjectName }" class="form-control" required>
                          <div class="input-group-append">
                            <span class="input-group-text mdi mdi-book-open-page-variant" id="basic-addon2"></span>
                          </div>
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <th>강사명</th>
                      <td>
                        <div class="form-group">
                          <select name="id" class="js-example-basic-multiple form-control" required>
                            <option value="${ i.id }" selected>${ i.name } </option>

                            <optgroup  LABEL="---------------------------------------"></optgroup>   

                            <c:forEach var="i" items="${ iList }">
                              <option value="${ i.id }">${ i.name }</option>
                            </c:forEach>                             
                                                  
                          </select>
                        </div>
                      </td>
                      <th>강의과목</th>
                      <td>
                        <div class="form-group">
                          <select name="classNo" class="js-example-basic-multiple form-control" required>
                            <option value="${ s.classNo }">${ s.className }</option>
                          </select>
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <th>수강정원</th>
                      <td>
                        <div class="form-group">
                          <input type="number" name="maximumSeats" min="5" max="10" value="${ s.maximumSeats }" class="form-control" required>
                        </div>
                      </td>
                      <th>수강료</th>
                      <td>
                        <div class="form-group">
                          <input type="number" name="fee" min="0" max="1000000000" step="50000" class="form-control" value="${ s.fee }" required>
                        </div>
                      </td>
                    </tr>

                    <tr>
                      <th>개강일</th>
                      <td>
                        <div class="form-group">
                          <input type="date" name="startDate" class="form-control" value="" required>
                        </div>
                      </td>
                      <th>종강일</th>
                      <td>
                        <div class="form-group">
                          <input type="date" name="endDate" class="form-control" value=""  required>
                        </div>
                      </td>
                    </tr>
                    
					<script>

						
						$(function() {
							const $startDate = "${s.startDate}";
							const $endDate = "${s.endDate}";

							
							let startDateParts = $startDate.split("/");
							let startYear = startDateParts[0];
							let startMonth = startDateParts[1];
							let startDay = startDateParts[2];
							let startDateDash = startYear + "-" + startMonth + "-" + startDay;
							
							let endDateParts = $endDate.split("/");
							let year = endDateParts[0];
							let month = endDateParts[1];
							let day = endDateParts[2];
							let endDateDash = year + "-" + month + "-" + day;
		
							$("input[name=startDate]").val(startDateDash);
							$("input[name=endDate]").val(endDateDash);
							

						
						})
						
						
					</script>
					
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
                          <input type="checkbox" name="day" value="일"id="sun">
                          <label for="sun">일</label>


                      </td>
                    </tr>
					<script>
				        $(function(){
				        	
							const day = "${s.day}";
							// "" | "value,value,value"
							
							$("input[type=checkbox]").each(function(){
								// $(this) : 순차적으로 접근한 체크박스 요소
								// $(this).value : 체크박스의 value
								if(day.search($(this).val()) != -1){
									// 검색할값.search("검색대상") : 없을시 -1 반환
									$(this).attr("checked",true);
								}
							})
			
				            
				         })
					</script>
                    <tr>

                    </tr>

                  </table>
                  
                  
                  <div class="btn-center">
                    <button class="btn btn-primary btn-pill mr-2" type="button" onclick="formSubmit(1);">수정</button>
                    <button class="btn  btn-pill mr-2 btn-danger" type="button" onclick="if(confirm('삭제된 강의는 복구할 수 없습니다. 정말 삭제하시겠습니까?')){ formSubmit(2); }">삭제</button>
                    <button class="btn btn-light btn-pill" type="button" onclick="backToList();">취소</button>
                  </div>
                  
                </form>
            


              </div>

	
			  <script>
					function formSubmit(num) {
						if(num == 1){
							// 수정하기
							$('#subjectForm').attr("action","update.cl").submit();
							
						}else{
							// 삭제하기
							$('#subjectForm').attr("action","delete.cl").submit();
						}
					}

          function backToList(){
            location.href='classAdminList.ad';
          }
				</script>


	</div>


</body>
</html>