<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<title>과제관리</title>

<script src="${pageContext.request.contextPath}/resources/instructor/plugins/nprogress/nprogress.js"></script>

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
        <div class="content">
          <!-- 여기서부터  -->
            <script>
            	// 조건 검색
            	function optSearch(){
            		let startArray = $("#opt-start").val().split('-');
         	        let endArray = $("#opt-end").val().split('-');
         	        let start_date = new Date(startArray[0], startArray[1], startArray[2]);
         	        let end_date = new Date(endArray[0], endArray[1], endArray[2]);
         	        
         	        let keyword = $("#keyword").val();
         	        
         	       if(start_date.getTime() > end_date.getTime()) {
        	            alert("종료날짜보다 시작날짜가 작아야합니다.");
        	            
        	       } else {
        	    	   console.log("시작일 : " + $("#opt-start").val());
        	    	   console.log("종료일 : " + $("#opt-end").val());
        	    	   console.log("검색어 : " + keyword);
        	    	   location.href = "taskForm.ins?keyword=" + keyword + "&startDate=" + $("#opt-start").val() + "&endDate=" + $("#opt-end").val();    
        	       } 
            	}
            
            	// 과제 등록
            	function taskInsertForm(){
            		let startArray = $(".task-start").val().split('-');
         	        let endArray = $(".task-end").val().split('-');
         	        let start_date = new Date(startArray[0], startArray[1], startArray[2]);
         	        let end_date = new Date(endArray[0], endArray[1], endArray[2]);
         	        
         	        let keyword = $("#keyword").val();
         	        
         	       if(start_date.getTime() > end_date.getTime()) {
        	            alert("종료날짜보다 시작날짜가 작아야합니다.");
        	       } else {
        	    	   $("#insertForm").attr("action", "insert.task").submit();
        	    	   
        	    	   let type = '과제';
	       			   let title= $("#taskTitle").val();
	       			   let target = "all";
	       			   let content = "과제 등록";
	       			   let sender = '${loginUser.getId()}';
	       			   	
	       			   sendAlarm(type, title,  target, content, sender);
        	       }
            	}
            	
            	// 과제 관리(수정, 삭제)
	            function postFormSubmit(param, idx){
            		let formId = "#udpatePost" + idx;
            		let startDate = "#startDate" + idx;
            		let endDate = "#endDate" + idx;
					
            		let startArray = $(startDate).val().split('-');
         	        let endArray = $(endDate).val().split('-');
         	        let start_date = new Date(startArray[0], startArray[1], startArray[2]);
         	        let end_date = new Date(endArray[0], endArray[1], endArray[2]);
         	        
         	        if (startArray == "" || endArray == ""){
         	        	alert("날짜를 입력해주세요");
         	        	return false;
         	        }
         	        
         	        if(start_date.getTime() > end_date.getTime()) {
         	            alert("종료날짜보다 시작날짜가 작아야합니다.");
         	            return false;
         	        } else {
		        		if (param == 'update'){
		        			$(formId).attr("action", "update.task").submit();
		        		} else {
		        			$(formId).attr("action", "delete.task").submit();
		        		} 
         	        } 
	        		
	        	}            
            	
	            function previewFile(input, num) {
	            	
	            	  let file = input.files[0];
	            	  let previewCard = "#preview-card"; 
                      let imgSrc = "<img src='"+URL.createObjectURL(file)+"' class=\"card-img-top\"/>";
                      
	            	  if (num != 0){  // 과제 관리 reupfile시
	            		  previewCard += num;
	            		  imgSrc = "<br><label for=\"\">수정 이미지</label>" + imgSrc;
	            	  }
		              
	            	  $(previewCard).html(imgSrc);
	            	  
	            	  if ($(previewCard).css("display") == "none"){
	            		  $(previewCard).show();            	  
	            	  } else {
	            		  $(previewCard).hide();
	            	  }
	            }
            	
	            function taskAlarm(){
	            	let type = '70';
					let target = 'user02';
					let content = '자료형과 연산자 과제가 등록 되었습니다.';
					let loginUser = '${loginUser.getId()}';
					let url = '컨트롤러 매핑값';
					//socket.send("관리자,"+target+","+content+","+url);
					socket.send('${loginUser.name},' + target+","+content+","+url + "," + loginUser);
	            }
	            
				$(document).ready(function(){
					// 과제 상세 페이지로 이동
					$(".task-list-table>tbody tr").on("click", function(){
            			if (!$('body').hasClass('modal-open')){
	            			location.href= "detail.task?taskNo=" + $(this).children().eq(0).html();
            			}
            			
            		})
            		
            		// 과제 관리 모달 열기
            		$(".task-set-btn").on("click", function(e){
						let taskSetModalId = '#taskUpdate' + $(this).parents('tr').find(".task-num").html();
            			$(taskSetModalId).modal('show');
            		})
					
            		// 과제 관리 등록(파일 선택시 미리보기 버튼 생성)
					$(".form-control-file").on("change", function(){
						
						let currentId = "#" + $(this).attr("id");
						
						// 여기에서 번호 추출
						let regex = /[^0-9]/g;				
						let num = currentId.replace(regex, "");
						
						let previewBtn = "#preview-btn" + num;
						let resetBtn = "#reset-btn" + num;
						let upfile = "#upfile" + num
						let previewCard = '#preview-card' + num;
						
						if ($(currentId)[0].files[0] != null){
							$(previewBtn).show();
							$(resetBtn).show();
						} else {
							$(previewBtn).hide();
							$(resetBtn).hide();
						}
						
						$(resetBtn).on("click", function(){
							$(upfile).val("");
							$(previewBtn).hide();
							$(this).css("display", "none");
							$(previewCard).hide();
						})
					})
            		
            		// 과제 등록(파일 선택시 미리보기 버튼 생성)
					$("#upfile").on("change", function(){
						console.log("뭔가 선택됨");
						
						console.log($(this)[0].files[0].type); // image/png
						
						if ($(this)[0].files[0].type == 'image/png'){
							console.log("png 파일 입니다.");
						}
						
						if ($(this)[0].files[0] != null){
							$("#preview-btn").show();
						} else {
							$("#preview-btn").hide();
						}
						
					})
					
					// 과제 초기화
					$("#reset-btn").on("click", function(){
						$("#upfile").val("");
						$("#preview-btn").hide();
						$('#preview-card').hide();
						$(".taskTitle").val("");
						$(".taskContent").val("");
						$(".task-start").val("");
						$(".task-end").val("");
					})
            		
					// 과제 관리에서 과제 미리보기
					$(".preview-btn").on("click", function(){
						let currentId = "#" + $(this).attr("id");
						
						let regex = /[^0-9]/g;				
						let num = currentId.replace(regex, "");
						
						let previewBtn = "#upfile" + num;
						
						console.log("무슨 버튼 : " + previewBtn);
						
						previewFile($(previewBtn)[0], num);
						
					})
					
					// 과제 등록에서 과제 미리보기
					$("#preview-btn").on("click", function(){
						previewFile($("#upfile")[0], 0);
					})
					
					// 조회기간 + 검색 (버튼 클릭)
					$("#search-btn").click(function(){
						optSearch();
					})
					
					// 조회기간 + 검색 (버튼 엔터)
					$("#keyword").keyup(function(e){
						if (e.keyCode == 13){
							optSearch();
						}
					})
					
				})
            </script>
            
            <!-- 과제목록  -->
            <div class="col">  
              <div class="row">
              	<div class="col">
              		<h4 align="center">과제목록</h6>
              	</div>
              </div>
              <hr>
               <div class="d-flex justify-content-end mb-1">
				<div class="col">
              		<!-- 과제 등록 버튼 -->
                  	<button type="button" class="btn btn-primary btn btn-pill py-1 px-3" data-toggle="modal" data-target="#taskInsert">과제등록하기</button>
                  	<!-- 과제 등록 모달 -->
		              <div class="modal fade" id="taskInsert" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle"
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
						          <div class="form-group">
									    <label for="upfile">과제 파일 선택</label>
									    <div class="row">
									    	<div class="col">
				    							<input type="file" class="form-control-file" id="upfile" name="upfile">
									    	</div>
									    	<div class="col" id="reset-panel">
				    							<button type="button" class="btn btn-primary py-1 px-1" id="reset-btn">초기화</button>
				    							<button type="button" class="btn btn-primary px-1 py-1" id="preview-btn" style="display: none">미리보기</button>
									    	</div>
									    </div>
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
								  
								  <!-- 미리보기 -->
								  <div class="card" id="preview-card" style="display: none">
									  
								  </div>
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
              	</div>
                <div class="col-md-auto" style="margin-left: -10px; margin-top: 2px;">
                  <label style="font-size: 13px;">조회기간</label>
                  <input type="date" id="opt-start" class="start">
                  <label>~</label>
                  <input type="date" id="opt-end" class="end">
                </div> 
                <div class="col-md-auto">
                  <input type="text" id="keyword" style="margin-top: 3px;" placeholder="과제검색">
                  <button type="button" id="search-btn" class="btn btn-primary px-1 py-1" style="height: 30px;">검색</button>
                </div>
              </div>

			  <div style="height: 400px">
              <table class="table task-list-table" style="text-align: center;">
                <thead style="background-color: lightgray;">
                  <tr>
                    <th scope="col">번호</th>
                    <th colspan="7">제목</th>
                    <th>기간</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                	
                	<!-- 과제 조회 시작 -->
                	<c:forEach var="t" items="${taskList}" varStatus="status">
                	<tr>
	                    <th scope="col" class="task-num">${t.taskNo}</td>
	                    <th colspan="7">${t.taskTitle}</td>
	                    <th>${t.startDate} ~ ${t.endDate}</td>
	                    <th>
						 <button type="button" class="task-set-btn btn btn-primary btn-pill py-1">관리</button>
	                      <!-- 과제 수정, 삭제 모달 -->
			              <div class="modal fade" id="taskUpdate${t.taskNo}" tabindex="-1" role="dialog" aria-labelledby="exampleModalFormTitle" aria-hidden="true" style="text-align: left">
							  <div class="modal-dialog modal-lg" role="document">
							   <form id="udpatePost${t.taskNo}" method="post" action="" enctype="multipart/form-data">
							   <input type="hidden" name="instructorId" value="${loginUser.getId()}">
							   <input type="hidden" name="taskNo" value="${t.taskNo}">
							   <input type="hidden" name="subjectNo" value="${t.subjectNo}">
							   <input type="hidden" name="status" value="${t.status}">
							    <div class="modal-content">
							      <div class="modal-header">
							        <h5 class="modal-title" id="exampleModalFormTitle">과제 관리</h5>
							        <button type="button" class="close" data-dismiss="modal" aria-label="Close" onClick="history.go(0)">
							          <span aria-hidden="true">×</span>
							        </button>
							      </div>
							      <div class="modal-body">
							          <div class="form-group">
										    <label for="upfile">과제 파일 선택</label>
										    <div class="row">
										    	<div class="col">
										    		<input type="file" class="form-control-file" id="upfile${t.taskNo}" name="reupfile">
										    	</div>
										    	<div class="col">
										    		<button type="button" class="btn btn-primary py-1 px-1" id="reset-btn${t.taskNo}" style="display: none">파일 취소</button>
				    								<button type="button" class="btn btn-primary px-1 py-1 preview-btn" id="preview-btn${t.taskNo}" style="display: none">미리보기</button>
										    	</div>
										    </div>
										    <c:choose>
										    	<c:when test="${ t.originName ne 'none' }">
										    		다운로드 : 
										    		<a href="${ t.changeName }" download="${ t.originName }">${ t.originName }</a>
										    		<input type="hidden" name="originName" value="${t.originName}">
										    		<input type="hidden" name="changeName" value="${t.changeName}">
										    	</c:when>
										    </c:choose>
							          </div>
							          <br>

							          <div class="form-group">
							            <label for="exampleInputPassword1">기간설정</label>
							            <br>
							            <label style="margin-right: 5px;">시작일</label>
							            <input type="date" id="startDate${t.taskNo}" class="task-start" name="startDate" value="${t.startDate}">
							            <label>~</label>
							            <label style="margin-right: 5px;">마감일</label>
							            <input type="date" id="endDate${t.taskNo}" class="task-end" name="endDate" value="${t.endDate}">
							          </div>
							          <br>
							          
							          <!-- 과제 제목 -->
									  <div class="form-group">
									     <label for="taskTitle">과제제목</label>
									     <input type="text" class="taskTitle form-control" id="taskTitle" name="taskTitle" placeholder="과제 제목" value="${t.taskTitle}">
									  </div>
									  
									  <!-- 과제 내용 -->
									  <div class="form-group">
									    <label for="exampleFormControlTextarea1">과제 내용</label>
									    <textarea class="taskContent form-control" id="exampleFormControlTextarea1" rows="3" name="taskContent" >${t.taskContent}</textarea>
									  </div>
									  	<input type="hidden" name="fileNo" value="${t.fileNo}">
									  	<c:if test="${ t.changeName ne 'none' }">
									  		<div class="card">
									  			<label for="">원본 이미지</label>
									  			<img src="${t.changeName }" class="card-img-top" alt="...">
									  		</div>
									  	</c:if>
									  	
									  	<!-- 미리보기 -->
								  		<div class="card" id="preview-card${t.taskNo}" style="display: none">
											
								  		</div>
									  
							      </div>
							      <div class="modal-footer">
							        <button type="button" class="close-btn btn btn-danger btn-pill" onClick="history.go(0)">닫기</button>
							        <button type="button" class="task-delete btn btn-primary btn-pill" onclick="postFormSubmit('delete', ${t.taskNo})";>삭제하기</button>
							        <button type="button" class="task-btn btn btn-primary btn-pill" onclick="postFormSubmit('update', ${t.taskNo})";>수정하기</button>
							      </div>
							    </div>
							    </form>
							  </div>
							</div>	
							<!-- 과제 수정, 삭제 모달 끝 -->				
	                    </th>
                  	</tr>
                	</c:forEach>
                	<!-- 과제 조회 끝 -->
                		
                </tbody>
              </table>
			</div>
              <!-- 페이지 이동 시작 -->
              <div class="card card-default align-items-center">
                <div class="card-header">
                  <h2></h2>
                </div>
                <div class="card-body">
              
                  <nav aria-label="Page navigation example">
                    <ul class="pagination">
                    
                   <c:choose>
	                      <c:when test="${ pi.currentPage eq 1 }">
		                      <li class="page-item disabled">
		                        <a class="page-link" href="" aria-label="Previous">
		                          <span aria-hidden="true" class="mdi mdi-chevron-left"></span>
		                          <span class="sr-only">이전</span>
		                        </a>
	 	                      </li>
	                      </c:when>
	                      <c:otherwise>
	                      	<li class="page-item">
		                      	<a class="page-link" href="taskForm.ins?cpage=${ pi.currentPage-1 }" aria-label="Previous">
		                          <span aria-hidden="true" class="mdi mdi-chevron-left"></span>
		                          <span class="sr-only">이전</span>
		                        </a>
	                        </li>
	                      </c:otherwise>
                   </c:choose>
                      
                      <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                      <li class="page-item page-num">
	                        <a class="page-link" href="taskForm.ins?cpage=${p}">${ p }</a>
	                      </li>	
                      </c:forEach>
                      
                      <c:choose>
	                      <c:when test="${ pi.currentPage eq pi.maxPage }">
		                      <li class="page-item disabled">
		                        <a class="page-link" href="#" aria-label="Next">
		                          <span aria-hidden="true" class="mdi mdi-chevron-right"></span>
		                          <span class="sr-only">다음</span>
		                        </a>
		                      </li>
	                      </c:when>
	                      <c:otherwise>
	                      	<li class="page-item">
		                        <a class="page-link" href="taskForm.ins?cpage=${pi.currentPage + 1}" aria-label="Next">
		                          <span aria-hidden="true" class="mdi mdi-chevron-right"></span>
		                          <span class="sr-only">다음</span>
		                        </a>
		                      </li>
	                      </c:otherwise>
                      </c:choose>
                      
                    </ul>
                  </nav>
                </div>
              </div>
              <!-- 페이지 이동 끝 -->
              <script>
              	$(function(){
              		// 페이지 번호 색상 표시
					$(".page-num").each(function(){
						if (${pi.currentPage} == $(this).children().html()){
							$(this).addClass("active");
						}
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